package com.yfyk.utils;

/**
 * Created by fddxiaohui on 2015/8/6.
 */

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

public final class RedisUtils {

    //Redis服务器IP
//    private static String ADDR = "10.12.34.37";
    private static String ADDR = "114.215.252.82";

    //Redis的端口号
    private static int PORT = 6379;

    //访问密码 SettingUtils.get().getRedisPwd()"yPK!OxP*nO5Cg%@zO5#9"
    private static String AUTH = "my_redis";

    //可用连接实例的最大数目，默认值为8；
    //如果赋值为-1，则表示不限制；如果pool已经分配了maxActive个jedis实例，则此时pool的状态为exhausted(耗尽)。
    private static int MAX_ACTIVE = 1024;

    //控制一个pool最多有多少个状态为idle(空闲的)的jedis实例，默认值也是8。
    private static int MAX_IDLE = 200;

    //等待可用连接的最大时间，单位毫秒，默认值为-1，表示永不超时。如果超过等待时间，则直接抛出JedisConnectionException；
    private static int MAX_WAIT = 10000;

    private static int TIMEOUT = 10000;

    //在borrow一个jedis实例时，是否提前进行validate操作；如果为true，则得到的jedis实例均是可用的；
    private static boolean TEST_ON_BORROW = true;

    private static JedisPool jedisPool = null;

    /**
     * 初始化Redis连接池
     */
    static {
        try {
            JedisPoolConfig config = new JedisPoolConfig();
            config.setMaxActive(MAX_ACTIVE);
            config.setMaxIdle(MAX_IDLE);
            config.setMaxWait(MAX_WAIT);
            config.setTestOnBorrow(TEST_ON_BORROW);
            jedisPool = new JedisPool(config, ADDR, PORT, TIMEOUT);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取Jedis实例
     *
     * @return
     */
    public synchronized static Jedis getJedis() {
        try {
            if (jedisPool != null) {
                Jedis resource = jedisPool.getResource();
                //resource.auth(AUTH);
                return resource;
            } else {
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 释放jedis资源
     */
    public static void returnBrokenResorce(Jedis jedis) {
        if (jedis != null) {
            jedisPool.returnBrokenResource(jedis);
        }
    }

    /**
     * 返还给连接池
     *
     * @param jedis
     */
    public static void returnResource(Jedis jedis) {
        if (jedis != null) {
            jedisPool.returnResource(jedis);
        }
    }

    /**
     * 获取数据
     *
     * @param key
     * @return
     */
    public static String get(String key) {
        String value = null;
        Jedis jedis = null;
        try {
            jedis = getJedis();
            value = jedis.get(key);
        } catch (Exception e) {
            //释放redis对象  
            jedisPool.returnBrokenResource(jedis);
            e.printStackTrace();
        } finally {
            //返还到连接池  
            returnResource(jedis);
        }
        return value;
    }

    public static byte[] get(byte[] key) {
        byte[] value = null;
        Jedis jedis = null;
        try {
            jedis = getJedis();
            value = jedis.get(key);
        } catch (Exception e) {
            //释放redis对象  
            jedisPool.returnBrokenResource(jedis);
            e.printStackTrace();
        } finally {
            //返还到连接池  
            returnResource(jedis);
        }
        return value;
    }

    /**
     * 设置数据
     *
     * @param key
     * @return
     */
    public static String set(String key, String value, int expire) {
        String result = null;
        Jedis jedis = null;
        try {
            jedis = getJedis();
            result = jedis.set(key, value);
            if (expire != 0) {
                jedis.expire(key, expire);
            }

        } catch (Exception e) {
            //释放redis对象  
            jedisPool.returnBrokenResource(jedis);
            e.printStackTrace();
        } finally {
            //返还到连接池  
            returnResource(jedis);
        }
        return result;
    }

    /**
     * 设置数据
     *
     * @param key
     * @return
     */
    public static String set(String key, String value) {
        return set(key, value, 0);
    }

    /**
     * 设置数据
     *
     * @param key
     * @return
     */
    public static String set(byte[] key, byte[] value, int expire) {
        String result = null;
        Jedis jedis = null;
        try {
            jedis = getJedis();
            result = jedis.set(key, value);
            if (expire != 0) {
                jedis.expire(key, expire);
            }
        } catch (Exception e) {
            //释放redis对象  
            jedisPool.returnBrokenResource(jedis);
            e.printStackTrace();
        } finally {
            //返还到连接池  
            returnResource(jedis);
        }
        return result;
    }

    /**
     * 设置数据
     *
     * @param key
     * @return
     */
    public static String set(byte[] key, byte[] value) {
        return set(key, value, 0);
    }


    /**
     * 删除数据
     *
     * @param key
     * @return
     */
    public static Long del(String key) {
        Long result = null;
        Jedis jedis = null;
        try {
            jedis = getJedis();
            result = jedis.del(key);
        } catch (Exception e) {
            //释放redis对象  
            jedisPool.returnBrokenResource(jedis);
            e.printStackTrace();
        } finally {
            //返还到连接池  
            returnResource(jedis);
        }
        return result;
    }

    /**
     * 删除数据
     *
     * @param key
     * @return
     */
    public static Long del(byte[] key) {
        Long result = null;
        Jedis jedis = null;
        try {
            jedis = getJedis();
            result = jedis.del(key);
        } catch (Exception e) {
            //释放redis对象  
            jedisPool.returnBrokenResource(jedis);
            e.printStackTrace();
        } finally {
            //返还到连接池  
            returnResource(jedis);
        }
        return result;
    }

    /**
     * 添加list
     * @param
     */
    public static void setList(String key,String value){
        Jedis jedis = null;
        try {
            jedis = getJedis();
            jedis.lpush(key, value);
        } catch (Exception e) {
            //释放redis对象
            jedisPool.returnBrokenResource(jedis);
            e.printStackTrace();
        } finally {
            //返还到连接池
            returnResource(jedis);
        }
    }

    /**
     * 添加list
     */
    public static long getLength(String key) {
        Jedis jedis = null;
        long length=0;
        try {
            jedis = getJedis();
            length=jedis.llen(key);
        } catch (Exception e) {
            //释放redis对象
            jedisPool.returnBrokenResource(jedis);
            e.printStackTrace();
        } finally {
            //返还到连接池
            returnResource(jedis);
        }
        return length;
    }

    /**
     * 返回并删除尾元素
     * @param
     */
    public static String getElement(String key){
        Jedis jedis = null;
        String element="";
        try {
            jedis = getJedis();
            element = jedis.rpop(key);
        } catch (Exception e) {
            //释放redis对象
            jedisPool.returnBrokenResource(jedis);
            e.printStackTrace();
        } finally {
            //返还到连接池
            returnResource(jedis);
        }
        return element;
    }

    public static void main(String[] args) {
        Jedis jedis=getJedis();
        //System.out.println(jedis.llen("xx"));
        jedis.lpush("xx","1");
        //jedis.lpush("ss", "1");
        //jedis.lpush("ss", "2");
        //jedis.lpush("ss", "3");
        //jedis.lpush("ss", "4");
        System.out.println(jedis.lrange("792houseInfoCheck", 0, -1));
//        List<DailyReportVO> dailyList= (List<DailyReportVO>)SerializeUtil.unserialize(RedisUtils.get(SerializeUtil.serialize("dailyList5307")));
//        RedisUtils.del(SerializeUtil.serialize("dailyList5396"));
//        jedis.del("dailyList5307");
        //System.out.println(jedis.lrange("ss", 0, -1));
        //System.out.println(jedis.llen("ss"));
//        System.out.println(jedis.lrange("792houseInfoCheck",0,-1));
//        jedis.flushAll();
//        List<DailyReportVO> redisList=new ArrayList<DailyReportVO>();
//        DailyReportVO dailyReportVO=new DailyReportVO();
//        dailyReportVO.setSuccessNum("1212");
//        dailyReportVO.setCheckNum("2");
//        byte[] a=SerializeUtil.serialize(redisList);
//        byte[] b=SerializeUtil.serialize("dailyList792");
//        redisList.add(dailyReportVO);
//        RedisUtils.set(SerializeUtil.serialize("dailyList792"),SerializeUtil.serialize(redisList),10000);
//        RedisUtils.set(SerializeUtil.serialize("dailyList5011"),SerializeUtil.serialize(redisList),10000);
//        List<DailyReportVO> dailyList= (List<DailyReportVO>)SerializeUtil.unserialize(RedisUtils.get(SerializeUtil.serialize("dailyList792")));
//        List<DailyReportVO> dailyList1= (List<DailyReportVO>)SerializeUtil.unserialize(RedisUtils.get(SerializeUtil.serialize("dailyList5011")));
//        System.out.println(dailyList.get(0).getSuccessNum());
//        System.out.println(dailyList1.get(0).getSuccessNum());
    }
}