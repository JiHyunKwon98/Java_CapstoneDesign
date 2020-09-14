package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import nck.Nck;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
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

	
	public int login(String userID, String userPw) {
		String SQL = "SELECT userPw FROM user WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPw)) {
					return 1;
				}
				else
					return 0;
			}
			return -1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	
	public int signup(User user) {
		String SQL = "INSERT INTO user VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getUserAddress());
			pstmt.setString(3, user.getUserEmail());
			pstmt.setString(4, user.getUserMbank());
			pstmt.setString(5, user.getUserAccount());
			pstmt.setString(6, user.getUserID());
			pstmt.setString(7, user.getUserPw());
			pstmt.setString(8, user.getUserPwc());
			pstmt.setInt(9, 1);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
		
	}
	
	public User getUser(String userID) {
		String SQL = "SELECT * FROM user WHERE userID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				User user = new User();
				user.setUserName(rs.getString(1));	
				user.setUserAddress(rs.getString(2));	
				user.setUserEmail(rs.getString(3));	
				user.setUserMbank(rs.getString(4));	
				user.setUserAccount(rs.getString(5));	
				user.setUserID(rs.getString(6));	
				user.setUserPw(rs.getString(7));	
				user.setUserPwc(rs.getString(8));	
				user.setUserAvailable(rs.getInt(9));
				return user;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; // �����ͺ��̽� ����
	}
	
	public int update(String userMbank, String userAccount ) {
		String SQL = "UPDATE user SET userMbank = ?, userAccount = ? ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userMbank);
			pstmt.setString(2, userAccount);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // �����Ϳ��̽� ����
	}
	


	public ArrayList<User> getuserList(int pageNumber){
		String SQL = "SELECT * FROM user";
		ArrayList<User> list = new ArrayList<User>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				User user = new User();
				user.setUserName(rs.getString(1));	
				user.setUserAddress(rs.getString(2));	
				user.setUserEmail(rs.getString(3));	
				user.setUserMbank(rs.getString(4));	
				user.setUserAccount(rs.getString(5));	
				user.setUserID(rs.getString(6));	
				user.setUserPw(rs.getString(7));	
				user.setUserPwc(rs.getString(8));	
				user.setUserAvailable(rs.getInt(9));
				list.add(user);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
	
	
	
	
	public int delete(String userID) {
		String SQL = "delete from user where userID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();		
		}
		return -1;
	}


}
