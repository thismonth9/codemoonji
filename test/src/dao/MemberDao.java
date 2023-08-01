package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.MemberDto;


public class MemberDao {
	public boolean loginCheck(String id, String pw) {
		Connection conn = Jdbc.connect();
		String sql ="SELECT count(*) FROM member WHERE id=? AND pw=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id); // pstmt.setInt(물음표번호, 정수 값);-->물음표를 그 값으로 치환. 참고) pstmt.setString(물음표번호, 문자열);
			pstmt.setString(2, pw); // pstmt.setInt(물음표번호, 정수 값);-->물음표를 그 값으로 치환. 참고) pstmt.setString(물음표번호, 문자열);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int cnt = rs.getInt(1);
				if(cnt==1) {
					return true;
				}else {
					return false;
				}
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	
	public ArrayList<MemberDto> select1() {
		Connection conn = Jdbc.connect();
		ArrayList<MemberDto> listDto = new ArrayList<MemberDto>();		
		String sql ="SELECT * FROM member";
		
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String id1 = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				int point = rs.getInt("point");
				MemberDto dto= new MemberDto(id1,pw,name,point);
				listDto.add(dto);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return listDto;
	}
	
	public MemberDto select2(String id) {
		Connection conn = Jdbc.connect();
		MemberDto listDto = null;
		
		String sql ="SELECT * FROM member WHERE id= ?";
		
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String id1 = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				int point = rs.getInt("point");
				listDto = new MemberDto(id1,pw,name,point);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return listDto;
	}
	
	public void decreasePoint(String id, int point) {
        Connection conn = Jdbc.connect();

        String sql = "UPDATE member SET point = point - ? WHERE id = ?";

        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, point);
            pstmt.setString(2, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                pstmt.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
	}
	
	public void signup(String id,String pw,String name, int point) {
		Connection conn = Jdbc.connect();
		String sql = "INSERT INTO member(id,pw,name,point)"
				+ " VALUES (?,?,?,?)";
			 PreparedStatement pstmt = null;
		 try {
			 pstmt=conn.prepareStatement(sql);
			 pstmt.setString(1,id);
			 pstmt.setString(2,pw);
			 pstmt.setString(3,name);
			 pstmt.setInt(4,point);
			 pstmt.executeUpdate();
		 } catch(SQLException e) {
				 e.printStackTrace();
		 } finally {
			try {
				if(pstmt!=null)
				pstmt.close();
				if(conn!=null)
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
	}
	   public void increasePoint(String id, int point) {
	        Connection conn = Jdbc.connect();

	        String sql = "UPDATE member SET point = point + ? WHERE id = ?";

	        PreparedStatement pstmt = null;
	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, point);
	            pstmt.setString(2, id);
	            pstmt.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                pstmt.close();
	                conn.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	   public void update(MemberDto memberDto) {
	        Connection conn = Jdbc.connect();
	        PreparedStatement pstmt = null;
	        try {
	            String sql = "UPDATE member SET pw=?, name=?, point=? WHERE id=?";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, memberDto.getPw());
	            pstmt.setString(2, memberDto.getName());
	            pstmt.setInt(3, memberDto.getPoint());
	            pstmt.setString(4, memberDto.getId());
	            pstmt.executeUpdate();

	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (pstmt != null) pstmt.close();
	                if (conn != null) conn.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }

	    }
	   
	   public void delete(String id) {
		   Connection conn = Jdbc.connect();
		     PreparedStatement pstmt = null;
	        try {
        		String sql= "DELETE FROM member WHERE id=?";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, id);
	            pstmt.executeUpdate();

	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (pstmt != null) pstmt.close();
	                if (conn != null) conn.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	}
	   public static void increaseAllPoints() {
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        
	        try {
	            conn = Jdbc.connect();
	            String sql = "UPDATE member SET point = point + 1";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (pstmt != null) pstmt.close();
	                if (conn != null) conn.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	  
}
