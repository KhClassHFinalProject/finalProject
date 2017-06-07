var XHR = null; // XHR 전역변수 만들고 초기화

function getXHR(){
	if(window.ActiveXObject){ // 인터넷 익스플로어인지 묻는것
		return new ActiveXObject('Msxml2.XMLHTTP');
	}else if(window.XMLHttpRequest){ // 다른 브라우저인지 확인
		return new XMLHttpRequest();
	}else{ // 아무것도 지원안하는 브라우저
		return null
	}
}

function sendRequest(url,params,callback,method){
	XHR = getXHR();
	
	var httpMethod = method ? method : 'GET'; // method가 존재하면 method를 집어넣고 아니면 GET 값을 집어넣음
	if(httpMethod!='GET'&&httpMethod!='POST'){
		httpMethod='GET';
	}
	
	var httpParams = (params==null || params=='') ? null : params;
	
	var httpUrl = url;
	if(httpMethod=='GET' && httpParams!=null){ // GET방식이면서 param값이 널이 아닐때
		httpUrl = httpUrl+'?'+httpParams;
	}
	
	XHR.onreadystatechange=callback;
	XHR.open(httpMethod,httpUrl,true);
	XHR.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	XHR.send(httpMethod=='POST' ? httpParams : null);
}