package goods;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class goodsDAO {
   
   private Connection conn;
   private ResultSet rs;
   
   public goodsDAO() {
      try {
         String dbURL ="jdbc:mysql://localhost:3306/NCK?useSSL=false";
         String dbID ="root";
         String dbPassword = "1111";
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
      String SQL = "SELECT nckID FROM NCK ORDER BY nckID DESC";
      try {
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         rs = pstmt.executeQuery();
         if (rs.next()) {
            return rs.getInt(1)+ 1;
         }
         return 1; // 첫번째 게시물 인경우
      }catch(Exception e) {
         e.printStackTrace();
      }
      return -1; // 데이터베이스 오류
   }
   
   
   public int register(String userID, String userEmail,String nckPdName, String nckcTg , String nckEx, String nckImg
         , String nckReImg, String nckStart, String nckUnit
         , String nckTerm1, String nckTerm2, String nckShip, String nckCurrent) {
      String SQL = "INSERT INTO NCK VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
         return pstmt.executeUpdate();
      }catch(Exception e) {
         e.printStackTrace();
      }
      return -1; // 데이터베이스 오류
   }
   
   public ArrayList<goods> getsaleList(int pageNumber){
      String SQL = "SELECT * FROM NCK WHERE nckID < ? AND nckAvailable = 1 ORDER BY nckID DESC LIMIT 10";
      ArrayList<goods> list = new ArrayList<goods>();
      try {
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         pstmt.setInt(1, getNext() - (pageNumber - 1)* 10);
         rs = pstmt.executeQuery();
         while(rs.next()) {
        	goods nck = new goods();
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
            list.add(nck);
         }
      }catch(Exception e) {
         e.printStackTrace();
      }
      return list; 
   }
   
   
   public boolean nextPage(int pageNumber) {
      String SQL = "SELECT * FROM NCK WHERE nckID < ? AND nckAvailable = 1 ORDER BY nckID DESC LIMIT 10";
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
      return false; // 데이터베이스 오류
   }
   
   public goods getDetailNck(int nckID) {
      String SQL = "SELECT * FROM Nck WHERE nckID = ?";
      try {
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         pstmt.setInt(1, nckID);
         rs = pstmt.executeQuery();
         if(rs.next()) {
        	goods nck = new goods();
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
      return null; // 데이터베이스 오류
   }
   
   
   public int updatep(int nckID, String nckCurrent) {
      String SQL = "UPDATE NCK SET nckCurrent = ? WHERE nckID = ?";
      try {
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         pstmt.setString(1, nckCurrent);
         pstmt.setInt(2, nckID);
         return pstmt.executeUpdate();
      }catch(Exception e) {
         e.printStackTrace();
      }
      return -1; // 데이터에이스 오류
   }
   

   public int goodupdate(int nckID, String nckCurrent) {
      String SQL = "UPDATE NCK SET nckCurrent = ? WHERE nckID = ?";
      try {
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         pstmt.setString(1, nckCurrent);
         pstmt.setInt(2, nckID);
         return pstmt.executeUpdate();
      }catch(Exception e) {
         e.printStackTrace();
      }
      return -1; // 데이터에이스 오류
   }
   

   
   public int goodupdate2(int nckID, String userID, String userEmail,String nckPdName, String nckcTg,  String nckEx, String nckImg
         , String nckReImg, String nckStart, String nckUnit
         , String nckTerm1, String nckTerm2, String nckShip, String nckCurrent) {
         String SQL = "UPDATE NCK SET userID=?, userEmail=?, nckPdName=?, nckcTg=?, nckEx=?, nckImg=?, nckReImg=?, nckStart=?, nckUnit=?, nckTerm1=?, nckTerm2=?, nckShip=?, nckCurrent=?, nckHit=? WHERE nckID = ?";
      try {
         PreparedStatement pstmt = conn.prepareStatement(SQL);;
         pstmt.setString(1, userID);
         pstmt.setString(2, userEmail);
         pstmt.setString(3, nckPdName);
         pstmt.setString(4, nckcTg);
         pstmt.setString(5, nckEx);
         pstmt.setString(6, nckImg);
         pstmt.setString(7, nckReImg);
         pstmt.setString(8, nckStart);
         pstmt.setString(9, nckUnit);
         pstmt.setString(10, nckTerm1);
         pstmt.setString(11, nckTerm2);
         pstmt.setString(12, nckShip);
         pstmt.setString(13, nckCurrent);
         pstmt.setInt(14, 0);
         pstmt.setInt(15, nckID);
         return pstmt.executeUpdate();
      }catch(Exception e) {
         e.printStackTrace();
      }
      return -1; // 데이터에이스 오류
   }
   
   public String getbidemail(String bid, String bemail) {
	      String SQL =  "UPDATE NCK SET userID=? WHERE nckID = ?";
	      try {
	         PreparedStatement pstmt = conn.prepareStatement(SQL);
	         pstmt.setString(1, bid);
	         rs = pstmt.executeQuery();
	         if(rs.next()) {
	        	
	         }
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      return null; // 데이터베이스 오류
	   }

}







