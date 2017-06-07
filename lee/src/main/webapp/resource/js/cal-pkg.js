'use strict';
/*
init 즉시실행함수로 변경

전역변수 

+ now   현재날짜. 145263644... 방식
+ nd    now 를 알아볼수 있는 날짜로 포맷
+ lastday  매달 마지막일
+ specialday  국가 지정 공휴일
+ inputspec 해당 월에 맞는 공휴일 추출

*/
var lastday = Array(31,28,31,30,31,30,31,31,30,31,30,31);
var specialday = Array('1-1','1-27','1-28','1-30','3-1','5-3','5-5','6-6','8-15','10-3','10-4','10-5','10-6','10-9');
var specialdayDetail = Array('신정','','설날연휴','','삼일절','석가탄신일','어린이날','현충일','광복절','개천절','','추석연휴','','한글날')
var now = Date.now();
var nd = new Date(now);
var ElementOption,cd,table;

var init = (function(){

	var firstFull = nd.getFullYear() +"/"+ (nd.getMonth() + 1) +"/1";
	var firstDate = new Date(firstFull);

	return {
		Line : function(){ return  7 - firstDate.getDay();},
		Year : function(){ return  firstDate.getFullYear();},
		Month : function(){ return  firstDate.getMonth();},
		Day : function(){ return  firstDate.getDay();},
		Full : firstFull
	}
}());

var nowday = {id : "today",year : nd.getFullYear(),month : nd.getMonth(),day : nd.getDate(),week : nd.getDay()}

var step = {
	prev : function(){return "<button type='button' id='prev'>Prev</button> ";},
	next : function(){return "<button type='button' id='next'>Next</button>";}
}

/* 현재 날짜 */
function CurrentOpen(ln,config){
	
	var g = config.year+"/"+(config.month + 1)+"/1";
	table = "";
	table = "<table class='"+g+"'>";

	var year,month,date,currrent;

	if(ln == null || ln == ""){
		currrent = config.year + " Y " 
					+ (config.month + 1) + " M " 
					+ config.day + " D ";
	}else{

		Number.prototype.getString = function(v){ return this.toString();}
		currrent = ln.replace(/(yyyy|yy|MM|DD|mm|dd)/gi, function(a){
			switch(a){
				case "yyyy" : return config.year;
				case "yy" : return (config.year % 1000).getString(2); 
				case "MM" : return config.month + 1 > 9 ? (config.month + 1) : "0"+ ( config.month + 1 );
				case "DD" : return config.day > 9 ? config.day : "0"+config.day;
				case "mm" : return config.month + 1;
				case "dd" : return config.day;
			};
		});
	}
	table += "<tr>";
		table += "<td colspan='7' id='current'>";
			table += step.prev() + "<span id='current_text'>" + currrent + "</span>" + step.next();
		table += "</td>";
	table += "</tr>";
}

/* 요일 옵션( 한글, 영어 ) */
function DayOpen(language){

	var week = Array();

	if(language=='ko'){
		week = Array('일','월','화','수','목','금','토');
	}else if(language == 'en' || language == null){
    	week = Array('Sun','Mon','Tue','Wen','Thu','Fri','Sat');
	}

	table += "<tr class='day'>";

	for(var j = 0; j < 7 ; j++){
		table += "<td>" + week[j] + "</td>"; 
	}
	table += "</tr>";

}


/* 일자 */
function DateOpen(config){

	var inputspec = new Array();
	var inputspecText = new Array();
	var root = lastday[config.Month()] - config.Line();
	var loop = Math.round(root / 7);
	var rest = root % 7;

	if(rest == 0){
		rest = 7;
	}

	if(rest < 4){
		loop += 1;
	}

	/* 기념일 */
	function specialFind(day ,index){
		var word = (config.Month() + 1) + "-";
		if(day.indexOf(word) > -1 ){
			day = day.split('-');
			inputspec.push(day[1].toString());
			inputspecText.push(specialdayDetail[index]);
		}
	}	

	specialday.forEach(specialFind);

	var input = 0;
	var deinput = 0;

	for(var l = 0; l <= loop ; l++){
		
		table += "<tr>";

		for(var k = 0; k < 7; k++){
			
			table += "<td>";
			if(config.Day() > k && l == 0){
				table += '';
			}else if(l == loop && rest <= k){
				table += '';
			}else{
				
				input += 1;
				if(config.Month() == nowday.month && input == nowday.day){
					table += "<div id='"+nowday.id+"'>"+input+"</div>";
				}else if(inputspec.indexOf(input.toString()) > -1){
					table += "<div id='special'>"+input+"<input type='hidden' value='"+inputspecText[deinput]+"' class='spt' /></div>";
					deinput++;
				}else{
					table += "<div>"+input+"</div>";
				}
			}
			table += "</td>";
		}
		table += "</tr>";
	}
 }



function CssBound(op){
   /* 추가예정 */
}



var eventList = {

	handelClick : function(e){
		 var daywrite =  document.getElementById('information');
		 var spt = e.target.children[0];
		 var parent = e.target.id;

		 if(spt == null){
			 spt = "";
		 }else{
			 spt = spt.value;
		 }
		 var print = e.target.innerHTML+"<br>"+spt;

		if(daywrite == null){
			//console.warn('You are not create information tag');
			return false;
		}else{

			daywrite.style.display = "block";
			daywrite.style.color = "#ffffff";
			daywrite.style.fontWeight = "normal"
			daywrite.style.fontSize = "20px";

			if(parent == 'special'){
				daywrite.style.color = "#ff0000";
			}else if(parent == 'today'){
				daywrite.style.fontSize = "25px";
				daywrite.style.fontWeight = "bold";				
			}

			daywrite.innerHTML = print;
		} 
	},
	handelNPButton : function(e){
		var id = e.target.id;
		preview(ElementOption,id);
	}
}



var DayClick = function (el){

	var point = document.getElementById(el);
	var td = point.getElementsByTagName('div');
	for(var i = 0 ; i < td.length ; i++){
		td[i].addEventListener('click',eventList.handelClick,false);
	}
};

var NextBt = function(){
	var bt = document.getElementById('next');
	bt.addEventListener('click',eventList.handelNPButton,false);
}

var PrevBt = function(){
	var bt = document.getElementById('prev');
	bt.addEventListener('click',eventList.handelNPButton,false);
}

function EventLaunch(option){
	DayClick(option.el);
	NextBt();
	PrevBt();
}


/* render */
function CalendarLaunch(option){
	try{
	ElementOption = option;
	CurrentOpen(option.format == null ? null : option.format,nowday);
	DayOpen(option.lang == null || option.lang == "" ? null : option.lang);
	DateOpen(init);
	document.getElementById(option.el).innerHTML = table;

	EventLaunch(option);

	 console.info("Welcome to NoDe Calendar. \nYou can fix this function so easy. \nEnjoy my calendar function. Thank you!");
	}catch(error){
		if(document.getElementById(option.el) == null){
	    	console.error("Load fail at Element option "+
			"\n You didn't create 'el'(element) in HTML. "+
			"\n Fist check. Create element in HTML "+
			"\n Second check. Write 'CalenderLaunch' instance attribute 'el'");
		}else{
			console.log(error);
		}
	}
}



function PreviewCalLaunch(option,fixday,fixdate){
	
	CurrentOpen(option.format == null ? null : option.format,fixday);
	DayOpen(option.lang == null || option.lang == "" ? null : option.lang);
	DateOpen(fixdate);
	document.getElementById(option.el).innerHTML = table;

	EventLaunch(option);
}



function preview(option,action){

	var ready = document.getElementsByTagName('table');
	var previewDate = ready[0].className.split('/');
	var previewFull = "";

	if(action == 'next'){
		previewDate[1] = parseInt(previewDate[1]) + 1;

		if(previewDate[1] == 13){
			previewDate[1] = 1;
			previewDate[0] = parseInt(previewDate[0]) + 1; 
		}

		for(var i = 0; i < previewDate.length; i++){
			if(i == 2){
				previewFull += previewDate[i];	
			}else{
				previewFull += previewDate[i]+"/";
			}
		}

	}else if(action == 'prev'){
		previewDate[1] = parseInt(previewDate[1]) - 1;

		if(previewDate[1] == 0){
			previewDate[1] = 12;
			previewDate[0] = parseInt(previewDate[0]) - 1; 
		}

		for(var i = 0; i < previewDate.length; i++){
			if(i == 2){
				previewFull += previewDate[i];	
			}else{
				previewFull += previewDate[i]+"/";
			}
		}
	}

	cd = new Date(previewFull);

	var fixday = {id : "today",year : cd.getFullYear(),month : cd.getMonth(),day : cd.getDate(),week : cd.getDay()};
	var fixdate = {
		Line : function(){ return  7 - cd.getDay();},
		Year : function(){ return  cd.getFullYear();},
		Month : function(){ return  cd.getMonth();},
		Day : function(){ return  cd.getDay();},
		Full : previewFull
	}

	PreviewCalLaunch(option,fixday,fixdate);

};
