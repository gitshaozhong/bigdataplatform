/**
 *  Copyright (c) 2012-2015 dhc
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.dhc.common.orm.mybatis.proxy;

import org.apache.ibatis.binding.BindingException;
import org.apache.ibatis.binding.MapperRegistry;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.SqlSession;

/**
 * <p>
 * .
 * </p>
 *
 *  
 * @version 2014-7-16
 */
public class PaginationMapperRegistry extends MapperRegistry {
    public PaginationMapperRegistry(Configuration config) {
        super(config);
    }

    @Override
    public <T> T getMapper(Class<T> type, SqlSession sqlSession) {
        if (!hasMapper(type)) {
            throw new BindingException("Type " + type + " is not known to the MapperRegistry.");
        }
        try {
            return PaginationMapperProxy.newMapperProxy(type, sqlSession);
        } catch (Exception e) {
            throw new BindingException("Error getting mapper instance. Cause: " + e, e);
        }
    }
}
