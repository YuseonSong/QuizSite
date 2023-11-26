package ac.honam;

public class ProblemDTO {

	public int problemNumber;
	public String problemType;
	public String problem;
	public String problemAnswer;
	public String problemHint;
	public String problemComment;
	
	public ProblemDTO(int problemNumber, String problemType, String problem, String problemAnswer, String problemHint, String problemComment) {
		this.problemNumber = problemNumber;
		this.problemType = problemType;
		this.problem = problem;
		this.problemAnswer = problemAnswer;
		this.problemHint = problemHint;
		this.problemComment = problemComment;
	}

	public int getProblemNumber() {
		return problemNumber;
	}

	public void setProblemNumber(int problemNumber) {
		this.problemNumber = problemNumber;
	}

	public String getProblemType() {
		return problemType;
	}

	public void setProblemType(String problemType) {
		this.problemType = problemType;
	}

	public String getProblem() {
		return problem;
	}

	public void setProblem(String problem) {
		this.problem = problem;
	}

	public String getProblemAnswer() {
		return problemAnswer;
	}

	public void setProblemAnswer(String problemAnswer) {
		this.problemAnswer = problemAnswer;
	}

	public String getProblemHint() {
		return problemHint;
	}

	public void setProblemHint(String problemHint) {
		this.problemHint = problemHint;
	}

	public String getProblemComment() {
		return problemComment;
	}

	public void setProblemComment(String problemComment) {
		this.problemComment = problemComment;
	}

}
