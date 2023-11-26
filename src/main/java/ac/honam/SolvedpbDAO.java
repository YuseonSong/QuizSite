package ac.honam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

import util.DatabaseUtil;

public class SolvedpbDAO{

		Connection conn = DatabaseUtil.getConnection();
		public int join(String userID, int problemNumber) {
		String SQL = "INSERT INTO solvedpb VALUES (?,?)";
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, userID);
			pstmt.setInt(2, problemNumber);

			return pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public ArrayList<Integer> getSolvedpb(String userID) throws SQLException {
		ArrayList<Integer> problems = new ArrayList<Integer>();
		
		String SQL = "SELECT * FROM solvedpb WHERE userID=?";
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, userID);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			problems.add(rs.getInt("problemNumber"));
		}
		return problems;	
	}
	public Map<String, Integer> newSolvedpb() throws SQLException {
		Map<String, Integer> problemsCount = new LinkedHashMap<>();
		String SQL = "SELECT userID, RANK() OVER (ORDER BY count(problemNumber) DESC) 등수 FROM solvedpb group by userId";
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			problemsCount.put( rs.getString("userID"),rs.getInt("등수"));
		}
		return problemsCount;	
	}
}

