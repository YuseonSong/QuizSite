package ac.honam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;

import util.DatabaseUtil;

public class ProblemDAO {
	Connection conn = DatabaseUtil.getConnection();
	
	public int join(int problemNumber, String problemType, String problem, String problemAnswer, String problemHint, String problemComment) {
		String 	SQL = "INSERT INTO problem VALUES (?,?,?,?,?,?)";
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1, problemNumber);
			pstmt.setString(2, problemType);
			pstmt.setString(3, problem);
			pstmt.setString(4, problemAnswer);
			pstmt.setString(5, problemHint);
			pstmt.setString(6, problemComment);

			return pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public ArrayList<ProblemDTO> getProblems() throws SQLException {
		ArrayList<ProblemDTO> problems = new ArrayList<ProblemDTO>();
		
		String SQL = "SELECT * FROM problem";
		Statement stat = conn.createStatement();
		ResultSet rs = stat.executeQuery(SQL);
		
		while(rs.next()) {
			ProblemDTO problem = new ProblemDTO(
					rs.getInt("problemNumber"),
					rs.getString("problemType"),
					rs.getString("problem"),
					rs.getString("problemAnswer"),
					rs.getString("problemHint"),
					rs.getString("problemComment")
					);
			problems.add(problem);
		}
		return problems;
	}
	public ArrayList<ProblemDTO> newProblem(String userID, String problemtype) throws SQLException { 
		ArrayList<ProblemDTO> result = new ArrayList<ProblemDTO>();
		ArrayList<Integer> sv = new SolvedpbDAO().getSolvedpb(userID);
		String SQL = "SELECT * FROM problem WHERE problemType=?";
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, problemtype);
		ResultSet rs = pstmt.executeQuery();

		while(rs.next()) {
			if (!sv.contains(rs.getInt("problemNumber"))) {
				ProblemDTO pbd = new ProblemDTO(
						rs.getInt("problemNumber"),
						rs.getString("problemType"),
						rs.getString("problem"),
						rs.getString("problemAnswer"),
						rs.getString("problemHint"),
						rs.getString("problemComment")
						);
				result.add(pbd);
			}
		}Collections.shuffle(result);
		return result;
	}
}
