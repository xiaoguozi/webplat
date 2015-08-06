package com.tjs.admin.system.utils;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

import org.springframework.util.StringUtils;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.mongodb.WriteConcern;
import com.tjs.admin.utils.DateTimeUtils;

/***
 * mongdbUtils
 * @author Administrator
 *
 */
public class MongoUtils {
	
	private static Object lock  = new Object();
	/**修改参数*/
	public final static String UPDATE_KEYS ="keys";  
	/**修改数据*/
	public final static String UPDATE_PARAMS ="params";  
	
	/********条件参数********/
	/**小于*/
	public final static String LESS = "$lt";
	/**小于等于*/
	public final static String LESS_EQ = "$lte";
	/**大于*/
	public final static String GREAT = "$gt";
	/**大于等于*/
	public final static String GREAT_EQ="$gte";
	/**不等于*/
	public final static String NOT_EQ = "$ne";
	
	public final static String AND = "$and";
	public final static String OR = "$or";
	public final static String NOR = "$nor";
	
	public final static String CONFIG_FILE = "application-mongo";
	/********条件参数********/
	
	private static Mongo mg = null;
	private static DB db = null; 
	
	
	/***
	 * 返回 mongoDB的db
	 * @return
	 */
	public  static DB getMongoDB(){
		synchronized(lock) {
			if( db == null ){
				ResourceBundle rb = ResourceBundle.getBundle(CONFIG_FILE);
				Mongo mg = new Mongo(rb.getString("mongo.server"), Integer.parseInt(rb.getString("mongo.port")));
				db = mg.getDB(rb.getString("mongo.database"));
				db.setWriteConcern(WriteConcern.ACKNOWLEDGED);
			}
		}
		return db;
	}
	
	
	
	/***
	 * 根据map返回 DBObject
	 * @param params
	 * @param haveNull
	 * @return
	 */
	public static DBObject getDBObjectByMap(Map<String,?> params, boolean haveNull){
		DBObject obj = new BasicDBObject();
		for(String key:params.keySet()){
			if (haveNull) {
				obj.put(key, params.get(key));
				continue;
			}
			if (!StringUtils.isEmpty(params.get(key))) {
				obj.put(key, params.get(key));
			}
		}
		return obj;
	}
	
	
	
	/***
	 * 根据map返回 DBObject
	 * @param params
	 * @param haveNull
	 * @return
	 */
	public static DBObject getQueryParams(Map<String,?> params, boolean haveNull){
		DBObject obj = new BasicDBObject();
		for(String key:params.keySet()){
			if (haveNull) {
				obj.put(key, params.get(key));
				continue;
			}
			if (!StringUtils.isEmpty(params.get(key))) {
				obj.put(key, params.get(key));
			}
		}
		return obj;
	}
	/****
	 * 根据cursor 获取 list
	 * @param cursor
	 * @return
	 */
	public static List<Map<String,Object>> getDBCursor(DBCursor cursor ){
		List<DBObject>  listObjet = cursor.toArray();
		List<Map<String,Object>>  returnList = new ArrayList<Map<String,Object>>();
		for(DBObject obj:  listObjet){
			Map<String,Object> map = new HashMap<String,Object>();
			for(String key:obj.keySet()){
				Object value = obj.get(key);
				//对日期格式的处理
				if (value != null && value instanceof java.util.Date) {
					value = DateTimeUtils.formatDate((Date)value, DateTimeUtils.ISO_DATETIME_FORMAT);
				}
				map.put(key, value);
			}
			returnList.add(map);
		}
		return returnList;
	}
	
	
	public static void close(){
		if (null != mg) {
			try
			{
				mg.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
			mg = null;
			db = null;
		}	
	}
}
