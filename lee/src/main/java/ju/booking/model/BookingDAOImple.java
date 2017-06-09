package ju.booking.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import ju.dto.RefRoomDTO;
import ju.dto.StudyRoomDTO;

public class BookingDAOImple implements BookingDAO {

	private SqlSessionTemplate sql;
	
	public BookingDAOImple(SqlSessionTemplate sql) {
		this.sql = sql;
	}
	
	public int booking(RefRoomDTO dto) {
		return sql.insert("bigINSrrBook", dto);
	}
	
	public java.util.Date getStart() throws ParseException{
		/*유닉스 타임, 타임스탬프*/
		Long unixTime=System.currentTimeMillis();
		System.out.print("unixTime : "+unixTime);
		
		/*현재시간으로*/
		String dateFormat="yyyy-MM-dd HH:mm:ss";
		Date d=new Date(unixTime);
		SimpleDateFormat f=new SimpleDateFormat(dateFormat);
		System.out.println(f.format(d));
		
		return f.parse(f.format(d));
	}

	public List<RefRoomDTO> rrCheck(int rr_cate) {
		// TODO Auto-generated method stub
		
		return sql.selectList("bigSELrrCheck", rr_cate);
	}

	public int srBook(StudyRoomDTO dto) {
		// TODO Auto-generated method stub
		return sql.insert("bigINSsrBook",dto);
	}
	
	public List<StudyRoomDTO> srCheck(String date) {
		// TODO Auto-generated method stub
		
		java.sql.Date resdate = java.sql.Date.valueOf(date);
		StudyRoomDTO dto = new StudyRoomDTO();
		dto.setSr_resdate(resdate);
		return sql.selectList("bigSELsrCheck",dto);
	}

	public int srCancel(int roomno, int time) {
		// TODO Auto-generated method stub
		Map m = new HashMap();
		m.put("sr_roomno", roomno);
		m.put("sr_time", time);
		return sql.delete("bigDELsrCancel", m);
	}

	public String srUserCheck(int roomno, int time, String resdate) {
		// TODO Auto-generated method stub
		Map m = new HashMap();
		m.put("sr_roomno", roomno);
		m.put("sr_time", time);
		m.put("sr_resdate", resdate);
		return sql.selectOne("bigSELsrUserCheck",m);
	}
}
