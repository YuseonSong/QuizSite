package ac.honam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class UserDAO {
	Connection conn = DatabaseUtil.getConnection();
	
	public int join(String userID, String userPassWord, String userName,  String userNickname, String userGender) {
		String 	SQL = "INSERT INTO USER VALUES (?,?,?,?,?)";
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, userID);
			pstmt.setString(2, userPassWord);
			pstmt.setString(3, userName);
			pstmt.setString(4, userNickname);
			pstmt.setString(5, userGender);
			
			return pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public UserDTO login(String userID, String userPassWord) {
		String SQL = "SELECT * FROM user where userID = ?";
		ResultSet rs = null;
		UserDTO userDTO = new UserDTO("a","b","c","d","e");
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (rs.getString(2).equals(userPassWord)) {
					
					userDTO.setUserID(rs.getString(1));
					userDTO.setUserPassWord(rs.getString(2));
					userDTO.setUserName(rs.getString(3));
					userDTO.setUserNickname(rs.getString(4));
					userDTO.setUserGender(rs.getString(5));
					return userDTO;
					
				} else
					return userDTO;
			} else
				return userDTO; // 아이디 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userDTO; // 데이터배이스 오류
	}
}