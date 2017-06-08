package ju.model;

import ju.dto.RefRoomDTO;

import java.text.ParseException;
import java.util.*;

public interface BookingDAO {
	
	/**apply empty seat*/
	public int booking(RefRoomDTO dto);
	
	/**check empty seat*/
	public List<RefRoomDTO> rrCheck(int rr_cate);
	
	public java.util.Date getStart() throws ParseException;
	
}
