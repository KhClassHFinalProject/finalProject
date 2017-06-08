package ju.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import ju.dto.RefRoomDTO;

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

}
