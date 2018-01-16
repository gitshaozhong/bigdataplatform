package com.dhc.modules.sys.utils;

import org.apache.hadoop.hbase.thrift.generated.*;
import org.apache.thrift.TException;
import org.apache.thrift.protocol.TBinaryProtocol;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.transport.TSocket;
import org.apache.thrift.transport.TTransport;
import org.apache.thrift.transport.TTransportException;

import com.google.common.collect.Lists;

import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.util.*;

/**
 * 用前缀得到hbase中的rowkey
 * 
 * 
 */
public class IdComboUtils {
    private static String byteBufferToString(ByteBuffer buffer) {
        CharBuffer charBuffer;
        try {
            Charset charset = Charset.forName("UTF-8");
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


    private List<String> start( String prefix,String table) {
        try {
        	
            TTransport socket = new TSocket("10.103.238.86", 9090);//hbase数据库
            TProtocol protocol = new TBinaryProtocol(socket, true, true);// read true, write true
            Hbase.Client client = new Hbase.Client(protocol);
            socket.open();
            System.out.println("open");
           
      
            
            // 由所查表名、前缀(prefix)得到  id
            int scanID = client.scannerOpenWithPrefix(getByteBuffer(table), getByteBuffer(prefix), new ArrayList<ByteBuffer>(), new HashMap<ByteBuffer, ByteBuffer>());
            List<TRowResult> rowPrefix = client.scannerGetList(scanID, 6);//
           
            List<String> idList =  Lists.newArrayList();
            for (TRowResult tRowResult : rowPrefix) {
            	System.out.println("rowkey:"+new String(tRowResult.getRow()));
                idList.add(new String(tRowResult.getRow()));
            }
            socket.close();
            System.out.println("close");
            return idList;
        } catch (TTransportException e) {
            e.printStackTrace();
        } catch (TException e) {
            e.printStackTrace();
        }
		return null;
    }

    public static List<String> getIdComboByPrefix(String prefix,String table) {
        IdComboUtils c = new IdComboUtils();
        return c.start(prefix,table);
    }
    
    public static void main(String args[]) {
        IdComboUtils c = new IdComboUtils();
        List<String> ans=c.start("1","WeiboTagRecomm1");
        for(String rs:ans)
        {
        	System.out.println("id"+rs);
        	
        }
    }
}
