package ju.controller;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import net.sf.json.JSONSerializer;
 
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;


public class ControllerSurpport {

	private Log log = LogFactory.getLog(getClass());

	public ResponseEntity<String> getJsonResponse(Object responseObject){

		String rtnJson = "{}";
		HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.add("Content-Type", "text/html; charset=UTF-8");

		try{

	        rtnJson = new JSONSerializer().toJSON(responseObject).toString();
	        log.debug(">> Response JSON : "+rtnJson);

		}catch(Exception e){
			log.error("Response JSON Error : "+e.getMessage());
			e.printStackTrace();
		}
        return new ResponseEntity<String>(rtnJson, responseHeaders, HttpStatus.CREATED);
	}

	public HashMap getResultMap(String errCode){

		HashMap result = new HashMap(), errMap = new HashMap();

		errMap.put("errCode", errCode);
		result.put("result", errMap);

		return result;
	}

//	public HashMap getResultMap(Object data){
//
//		HashMap result = new HashMap(), requestList = new HashMap();
//		HashMap requestListinfo = new HashMap();
//		List list = (ArrayList)data;
//
//		log.debug(">> !!!!!!!!!!!!!!! : "+data.toString());
//		if(list.size()<=0)
//			result.put("errCode", ErrCode.SEARCH_SUCCESS_NODATA);
//		else{
////			requestListinfo.put("requestListinfo", data);
//			requestListinfo.put("requestListinfo", data);
//			requestList.put("requestList", requestListinfo);
//			 log.debug(">> asdfasdfasdfasdf : "+requestList);
//
//		//	String str = "[" + requestList + "]";
//		//	requestListinfo.put("requestListinfo", str);
//			result.put("result", requestList);
//		}
//
//		return result;
//	}


//	public HashMap getResultMap(Object data, String resultStr, String listName){
//
//		HashMap result = new HashMap();
//		HashMap requestList = new HashMap();
//
//		requestList.put(listName, data);
//		requestList.put("errCode", resultStr);
//
//		result.put("result", requestList);
//
//		return result;
//	}

//	public HashMap getLoginResultMap(String cmmnStr, String errCode){
//
//		HashMap result = new HashMap(), login = new HashMap(), cmmnCheck = new HashMap();
//
//		cmmnCheck.put("cmmnCheck", cmmnStr);
//		login.put("login", cmmnCheck);
//		login.put("errCode", errCode);
//
//		result.put("result", login);
//
//
//		return result;
//	}
//
//	public HashMap getFileResultMap(String screenType, String errCode, String fileKey){
//
//		HashMap result = new HashMap(), fileMap = new HashMap();
//
//		fileMap.put(screenType, fileKey);
//		result.put("errCode", errCode);
//		result.put("result", fileMap);
//
//		return result;
//	}

}
