


function bkRefresh(bk_idx){
	$.ajax({
		type: "GET",
		url: "bkRefresh.ju",
		data: {'bk_idx' : bk_idx},
		dataType: "json",
		success: function(list){
			if(list.count==1){
				$('#refreshSpan_1').text('대출중');
				result = 3;
			}else if(list.count==0){
				$('#refreshSpan_1').text('대출가능');
				result = 1;
			}
		}
	});
}

function bkYeyak(bk_idx){
	if(result==1){
		alert('대출가능 도서입니다. 도서관에 방문하시거나 택배대출기능을 이용해주세요');
	}else if(result==0){
		alert('대출가능여부를 확인해주세요');
		
	}else if(result==3){
		$.ajax({
			type: "GET",
			url: "bkYeyak.ju",
//			sid를 임시로 고정
			data: {'bk_idx' : bk_idx},
			dataType: "json",
			success: function(list){
				if(list.count==1){
					alert('대출예약이 되었습니다 순번 : ' + list.ye_sunbun);
				}else if(list.count==80){
					alert('예약 회원이 많아 예약이 불가합니다');
//					$('#refreshSpan_1').text('예약실패');
				}else if(list.count==90){
					alert('이미 예약한 도서입니다');
				}else if(list.count==70){
					alert('예약은 총 3권 까지만 가능합니다. 마이페이지에서 확인 바랍니다');
				}else{
					alert('오류가 발생했습니다. 관리자에게 문의 바랍니다');
				}
			}
		});
	}
}

function bkFedex(bk_idx){
	if(result==1){
		$.ajax({
			type: "GET",
			url: "bkFedex.ju",
//			sid를 임시로 고정
			data: {'bk_idx' : bk_idx},
			dataType: "json",
			success: function(list){
				if(list.count==1){
					alert('택배대출신청했습니다. 마이페이지에서 현황을 확인해주세요');
					result2 = 1;
				}else if(list.count==0){
					alert('오류가 발생했습니다. 관리자에게 문의 바랍니다.');
				}else if(list.count==90){
					alert('이미 대출하신 도서가 3권 이상입니다');
				}
			}
		});
		
	}else if(result==0){
		alert('대출가능여부를 확인해주세요');
	}else if(result==3){
		alert('대출중인 도서입니다. 대출이 가능하면 신청해주세요');
	}else if(result2==1){
		alert('이미 예약하셨습니다. 마이페이지에서 확인 바랍니다');
		
	}
}













