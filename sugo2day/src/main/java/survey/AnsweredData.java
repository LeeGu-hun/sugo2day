package survey;

import java.util.List;

public class AnsweredData {
	private List<String> responses;
	private Respondent res;
	private List<String> favLanguage;
	
	public List<String> getFavLanguage() {
		return favLanguage;
	}
	public void setFavLanguage(List<String> favLanguage) {
		this.favLanguage = favLanguage;
	}
	public List<String> getResponses() {
		return responses;
	}
	public void setResponses(List<String> responses) {
		this.responses = responses;
	}
	public Respondent getRes() {
		return res;
	}
	public void setRes(Respondent res) {
		this.res = res;
	}
	
	
}
