package com.dhc.modules.sys.service;

import com.dhc.common.orm.hibernate.EntityManager;
import com.dhc.common.orm.hibernate.HibernateDao;
import com.dhc.common.orm.hibernate.Parameter;
import com.dhc.common.utils.io.PropertiesLoader;
import com.dhc.modules.sys.entity.Config;
import com.dhc.utils.AppConstants;

import org.apache.commons.lang3.Validate;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Properties;

/**
 * 系统配置参数
 */
@Service
public class ConfigManager extends EntityManager<Config, Long> {

    private HibernateDao<Config, Long> configDao;


    /**
     * 通过注入的sessionFactory初始化默认的泛型DAO成员变量.
     */
    @Autowired
    public void setSessionFactory(final SessionFactory sessionFactory) {
        configDao = new HibernateDao<Config, Long>(sessionFactory, Config.class);
    }

    @Override
    protected HibernateDao<Config, Long> getEntityDao() {
        return configDao;
    }

    /**
     * 根据标识查找
     * @param code 配置标识
     * @return
     */
    public Config getConfigByCode(String code){
        Validate.notBlank("code", "参数[code]不能为空.");
        List<Config> list = getEntityDao().find("from Config c where c.code = :p1",new Parameter(code));
        return list.isEmpty() ? null:list.get(0);
    }

    /**
     * 根据标识查找
     * @param code 配置标识
     * @return
     */
    public String getConfigValueByCode(String code){
        Validate.notBlank("code", "参数[code]不能为空.");
        Config config = getConfigByCode(code);
        return config == null ? null:config.getValue();
    }

    /**
     * 从配置文件同步
     * @param overrideFromProperties
     */
    public void syncFromProperties(Boolean overrideFromProperties){
        PropertiesLoader propertiesLoader = AppConstants.getConfig();
        Properties properties = propertiesLoader.getProperties();
        for(String key:properties.stringPropertyNames()){
            Config config = getConfigByCode(key);
            if(config == null){
                config = new Config(key,properties.getProperty(key),null);
                this.save(config);
            }else{
                if(overrideFromProperties != null && overrideFromProperties == true){
                    config.setValue(properties.getProperty(key));
                    this.update(config);
                }
            }

        }
    }

}
