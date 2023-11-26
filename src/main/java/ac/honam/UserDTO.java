package ac.honam;

public class UserDTO {

	String userID;
	String userPassWord;
	String userName;
	String userNickname;
	String userGender;
	
	
	
	public UserDTO() {
	
	}
	public UserDTO(String userID, String userPassWord, String userName,  String userNickname ,String userGender) {
		super();
		this.userID = userID;
		this.userPassWord = userPassWord;
		this.userName = userName;
		this.userNickname = userNickname;
		this.userGender = userGender;
		
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassWord() {
		return userPassWord;
	}
	public void setUserPassWord(String userPassWord) {
		this.userPassWord = userPassWord;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserNickname() {
		return userNickname;
		
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	

}
