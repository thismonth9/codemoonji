import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import dao.Jdbc;
import dao.MemberDao;

public class MyJob implements Job {
	
	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		 MemberDao.increaseAllPoints();
		int count = count();
		System.out.println("<<<포인트 스케줄러가 시작되었습니다.>>>");
		System.out.println("Job이 실행되어,"+count+"명에게 1포인트가 부여되었습니다.");
	}
	public int count() {
	    Connection conn = Jdbc.connect();
	    String sql = "SELECT count(*) FROM member";

	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    int cnt = 0;
	    try {
	        pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();
	        while (rs.next()) {
	            cnt = rs.getInt(1); // 결과 집합의 첫 번째 컬럼에서 카운트 값을 가져옵니다.
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return cnt;
	}
	 
}





