package com.dhc.modules.sys.utils;

import org.apache.hadoop.hbase.thrift.generated.*;
import org.apache.thrift.TException;
import org.apache.thrift.protocol.TBinaryProtocol;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.transport.TSocket;
import org.apache.thrift.transport.TTransport;
import org.apache.thrift.transport.TTransportException;

import com.dhc.modules.sys.entity.echarts.indicator;
import com.dhc.modules.sys.service.EchartsManager;
import com.dhc.modules.sys.web.EchartsController;
import com.google.common.collect.Lists;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * Created by tomxie on 2016/3/30 20:09.
 */
public class ThriftUtils {

    //private ArrayList<String> top5Result;

    private static String byteBufferToString(ByteBuffer buffer) {
        CharBuffer charBuffer = null;
        try {
            Charset charset = Charset.forName("utf-8");
            CharsetDecoder decoder = charset.newDecoder();
            charBuffer = decoder.decode(buffer);
            buffer.flip();
            return charBuffer.toString();
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

    private static ByteBuffer getByteBuffer(String str) {
        return ByteBuffer.wrap(str.getBytes());
    }

    /*
     * 依次保存并返回所有搜索结果
     */
    private List<String> iterateAndSaveResults(TRowResult result, int subStringLength) throws UnsupportedEncodingException {
        List<String> all = Lists.newArrayList();
        Iterator<Map.Entry<ByteBuffer, TCell>> iter = result.columns.entrySet()
                .iterator();

        System.out.println("RowKey=" + new String(result.getRow()));
        while (iter.hasNext()) {
            Map.Entry<ByteBuffer, TCell> entry = iter.next();
            byte[] tem = decode(entry.getKey());
            all.add(new String(tem, "UTF-8").substring(subStringLength));
            all.add(new String(entry.getValue().getValue(),"UTF-8"));
            String str = new String(entry.getValue().getValue(),"UTF-8");
            String str1 = new String(tem, "UTF-8").substring(subStringLength);
            System.out.print("key:"+str1+"---->value:"+str);
            //System.out.print("thrift： 比特长度 ： "+tem.length+";;");
            //System.out.print("内容： ");
            //for(int j=0;j<tem.length;j++)
            //{
            // System.out.print(tem[j]);
            //
            //}
            //System.out.println("");
            //System.out.println("列"+new String(decode(entry.getKey())).substring(subStringLength));

            //System.out.println("值"+new String(entry.getValue().getValue()));
        }

        for (String s : all) {
            System.out.println(s);
        }
        return all;
    }

    private byte[] decode(ByteBuffer buffer) {
        byte[] bytes = new byte[buffer.limit()];
        for (int i = 0; i < buffer.limit(); i++) {
            bytes[i] = buffer.get();
        }
        return bytes;
    }

    /*
     * 开始线程，以id为rowkey在hbase中查找内容
     */
    private List<String> start(String id, String table, int subStringLength) throws UnsupportedEncodingException {
        try {
            List<String> top5Results = Lists.newArrayList();
            TTransport socket = new TSocket("10.103.238.22", 9090);// 与目的地址建立通信
            TProtocol protocol = new TBinaryProtocol(socket, true, true);// read
            // true,
            // write
            // true
            Hbase.Client client = new Hbase.Client(protocol);
            socket.open();
            System.out.println("open");
            try {
                System.out.println("scanning tables...");
                for (ByteBuffer name : client.getTableNames()) {
                    System.out.println("find:" + byteBufferToString(name));
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            List<TRowResult> row = client.getRow(
                    getByteBuffer(table), getByteBuffer(id),
//					getByteBuffer("CoverageRatePercent"), getByteBuffer("2015-01-02"),
                    new HashMap<ByteBuffer, ByteBuffer>());


            for (TRowResult tRowResult : row) {
                top5Results.addAll(iterateAndSaveResults(tRowResult, subStringLength));

            }
            socket.close();

            System.out.println("close");
            return top5Results;
        } catch (TTransportException e) {
            e.printStackTrace();
        } catch (TException e) {
            e.printStackTrace();
        }
        return null;
    }

    //	通过rowkey 查询hbase,返回
    public static List<String> searchHBaseById(String id, String table, int subStringLength) throws UnsupportedEncodingException {
        ThriftUtils c = new ThriftUtils();

        List<String> ans = c.start(id, table, subStringLength);
//		List<String> ans=c.start(id,"WeiboTagRecomm", 5);

        //for (String a : ans) {
        //    System.out.println("thrift:" + a);
        //}
        return ans;
    }

    //	通过rowkey,查询hbase，返回columnfamily、column和value
//	public static HashMap<String,List<String>> searchAllHBase(String id,String table) throws UnsupportedEncodingException {
//		ThriftUtils c =new ThriftUtils();
//		List<String> ans=c.start(id,table,0);
//
//	}
    public static void main(String args[]) throws IOException, URISyntaxException {
        ThriftUtils c = new ThriftUtils();
        List<String> ans = c.start("112016-03", "WeiboTop", 0);
        //List<String> ans = searchHBaseById("112016-03", "WeiboTop", 0);

        for (String rs : ans) {
            System.out.println("Output:" + rs);
//		byte[] a=rs.getBytes("utf-8");
//		String trim=new String(a,"utf-8");
//		System.out.println("转变后： "+trim);
//		 trim=new String(trim.getBytes("GBK"),"UTF-8");
//		 System.out.println("转变后*2： "+trim);
        }

    }
}
