package com.tjs.admin.system.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.WriteResult;
import com.tjs.admin.system.utils.MongoUtils;

@Service
public class UploadFileService {
	private static final String NAMESPACE = "t_upload_file";

	
	public DBCollection getDBCollection() {
		return MongoUtils.getMongoDB().getCollection(NAMESPACE);
	}
	
	/***
	 * query file byId
	 * @return
	 */
	public Map<String,Object> getFileInfo(String fileId) {
		BasicDBObject filter = new BasicDBObject();
		filter.put("fileId", fileId);
		DBCursor cursor = getDBCollection().find(filter);
		List<Map<String,Object>> list = MongoUtils.getDBCursor(cursor);
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}
	/***
	 * 
	 * @param context
	 * @return
	 */
	public int insert(Map<String,?> context) {
		DBObject update = MongoUtils.getDBObjectByMap(context, false);
		WriteResult write = getDBCollection().insert(update);
		return write.getN();
	}
	
	
}
