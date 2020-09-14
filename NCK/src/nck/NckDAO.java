package nck;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class NckDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	public NckDAO() {
		try {
			String dbURL ="jdbc:mysql://localhost:3306/nck";
			String dbID ="root";
			String dbPassword = "JiSuhyun6942#@*";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public int getNext() {
		String SQL = "SELECT nckID FROM nck ORDER BY nckID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1)+ 1;
			}
			return 1; // ù��° �Խù� �ΰ��
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}
	
	
	   public int register(String userID, String userEmail,String nckPdName, String nckcTg , String nckEx, String nckImg
	            , String nckReImg, String nckStart, String nckUnit
	            , String nckTerm1, String nckTerm2, String nckShip, String nckCurrent
	            , String beID, String beEmail) {
	         String SQL = "INSERT INTO nck VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	         try {
	            PreparedStatement pstmt = conn.prepareStatement(SQL);
	            pstmt.setInt(1, getNext());
	            pstmt.setString(2, userID);
	            pstmt.setString(3, userEmail);
	            pstmt.setString(4, nckPdName);
	            pstmt.setString(5, nckcTg);
	            pstmt.setString(6, nckEx);
	            pstmt.setString(7, nckImg);
	            pstmt.setString(8, nckReImg);
	            pstmt.setString(9, nckStart);
	            pstmt.setString(10, nckUnit);
	            pstmt.setString(11, nckTerm1);
	            pstmt.setString(12, nckTerm2);
	            pstmt.setString(13, nckShip);
	            pstmt.setInt(14, 1);
	            pstmt.setString(15, nckCurrent);
	            pstmt.setInt(16, 0);
	            pstmt.setString(17, beID);
	            pstmt.setString(18, beEmail);
	            return pstmt.executeUpdate();
	         }catch(Exception e) {
	            e.printStackTrace();
	         }
	         return -1; // �����ͺ��̽� ����
	      }
	   
	   
	
	public ArrayList<Nck> getsaleList(int pageNumber){
		String SQL = "SELECT * FROM nck WHERE nckID < ? AND nckAvailable = 1 ORDER BY nckID DESC LIMIT 10";
		ArrayList<Nck> list = new ArrayList<Nck>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1)* 10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Nck nck = new Nck();
				nck.setNckID(rs.getInt(1));
				nck.setUserID(rs.getString(2));
				nck.setUserEmail(rs.getString(3));
				nck.setNckcTg(rs.getString(5));
				nck.setNckPdName(rs.getString(4));
				nck.setNckEx(rs.getString(6));
				nck.setNckImg(rs.getString(7));
				nck.setNckReImg(rs.getString(8));
				nck.setNckStart(rs.getString(9));
				nck.setNckUnit(rs.getString(10));
				nck.setNckTerm1(rs.getString(11));
				nck.setNckTerm2(rs.getString(12));
				nck.setNckShip(rs.getString(13));
				nck.setNckAvailable(rs.getInt(14));
				nck.setNckCurrent(rs.getString(15));
				nck.setNckHit(rs.getInt(16));
				nck.setbID(rs.getString(17));
				nck.setBemail(rs.getString(18));
				list.add(nck);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
	
	public ArrayList<Nck> getmains(int pageNumber){
	      String SQL = "SELECT * FROM nck WHERE nckID < ? AND nckAvailable = 1 ORDER BY nckHit DESC LIMIT 6";
	      ArrayList<Nck> list = new ArrayList<Nck>();
	      try {
	         PreparedStatement pstmt = conn.prepareStatement(SQL);
	         pstmt.setInt(1, getNext() - (pageNumber - 1)* 10);
	         rs = pstmt.executeQuery();
	         while(rs.next()) {
	            Nck nck = new Nck();
	            nck.setNckID(rs.getInt(1));
	            nck.setUserID(rs.getString(2));
	            nck.setUserEmail(rs.getString(3));
	            nck.setNckcTg(rs.getString(5));
	            nck.setNckPdName(rs.getString(4));
	            nck.setNckEx(rs.getString(6));
	            nck.setNckImg(rs.getString(7));
	            nck.setNckReImg(rs.getString(8));
	            nck.setNckStart(rs.getString(9));
	            nck.setNckUnit(rs.getString(10));
	            nck.setNckTerm1(rs.getString(11));
	            nck.setNckTerm2(rs.getString(12));
	            nck.setNckShip(rs.getString(13));
	            nck.setNckAvailable(rs.getInt(14));
	            nck.setNckCurrent(rs.getString(15));
	            nck.setNckHit(rs.getInt(16));
	            nck.setbID(rs.getString(17));
	            nck.setBemail(rs.getString(18));
	            list.add(nck);
	         }
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      return list; 
	   }
	
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM nck WHERE nckID < ? AND nckAvailable = 1 ORDER BY nckID DESC LIMIT 10";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1)* 10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false; // �����ͺ��̽� ����
	}
	
	public Nck getDetailNck(int nckID) {
		String SQL = "SELECT * FROM nck WHERE nckID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, nckID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Nck nck = new Nck();
				nck.setNckID(rs.getInt(1));	
				nck.setNckcTg(rs.getString(5));
				nck.setNckPdName(rs.getString(4));
				nck.setNckStart(rs.getString(9));
				nck.setNckImg(rs.getString(7));
				nck.setNckReImg(rs.getString(8));
				nck.setNckUnit(rs.getString(10));
				nck.setNckEx(rs.getString(6));
				nck.setNckShip(rs.getString(13));
				nck.setNckTerm1(rs.getString(11));
				nck.setNckTerm2(rs.getString(12));
				nck.setUserID(rs.getString(2));
				nck.setUserEmail(rs.getString(3));
				nck.setNckAvailable(rs.getInt(14));
				nck.setNckCurrent(rs.getString(15));
				nck.setNckHit(rs.getInt(16));
				return nck;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; // �����ͺ��̽� ����
	}
	
	
	public int updatep(int nckID, String nckCurrent) { //���� ����
		String SQL = "UPDATE nck SET nckCurrent = ? WHERE nckID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, nckCurrent);
			pstmt.setInt(2, nckID);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // �����Ϳ��̽� ����
	}
	
	public int updateh(int nckID, int nckHit) {
	      String SQL = "UPDATE nck SET nckHit= ? WHERE nckID = ?";
	      try {
	         PreparedStatement pstmt = conn.prepareStatement(SQL);
	         pstmt.setInt(1, nckHit);
			 pstmt.setInt(2, nckID);
	         return pstmt.executeUpdate();
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      return -1; // �����Ϳ��̽� ����
	   }

	public int goodupdate(int nckID, int nckCurrent) { 
		String SQL = "UPDATE nck SET nckCurrent = ? WHERE nckID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, nckCurrent);
			pstmt.setInt(2, nckID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // �����Ϳ��̽� ����
	}
	

	
	public int goodupdate2(int nckID, String nckPdName, String nckcTg,  String nckEx, String nckImg
			, String nckReImg, String nckStart, String nckUnit
			, String nckTerm1, String nckTerm2, String nckShip, String nckCurrent) {
			String SQL = "UPDATE nck SET userID=?, userEmail=?, nckPdName=?, nckcTg=?, nckEx=?, nckImg=?, nckReImg=?, nckStart=?, nckUnit=?, nckTerm1=?, nckTerm2=?, nckShip=?, nckCurrent=?, nckHit=? WHERE nckID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, nckPdName);
			pstmt.setString(2, nckcTg);
			pstmt.setString(3, nckEx);
			pstmt.setString(4, nckImg);
			pstmt.setString(5, nckReImg);
			pstmt.setString(6, nckStart);
			pstmt.setString(7, nckUnit);
			pstmt.setString(8, nckTerm1);
			pstmt.setString(9, nckTerm2);
			pstmt.setString(10, nckShip);
			pstmt.setString(11, nckCurrent);
			pstmt.setInt(12, 0);
			pstmt.setInt(13, nckID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // �����Ϳ��̽� ����
	}
	
	
	
	public int updateb(int nckID, String beID, String beEmail) {
	      String SQL = "UPDATE nck SET beID = ?, beEmail=? WHERE nckID = ?";
	      try {
	         PreparedStatement pstmt = conn.prepareStatement(SQL);
	         pstmt.setString(1, beID);
	         pstmt.setString(2, beEmail);
	         pstmt.setInt(3, nckID);
	         return pstmt.executeUpdate();
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      return -1; // 데이터에이스 오류
	   }
	   
	
	   
}