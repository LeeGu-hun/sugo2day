package xml;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;
 
//xml로 출력될 때 출력할 프로퍼티와 순서를 설정하는 어노테이션
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name="data",propOrder={"l_num","l_writer","l_content","l_files","l_regdate","l_isquest","l_isprivate","l_questcate"})
public class DataTest {
    
	private Integer l_num;
	private String l_writer;
	private String l_content;
	private String l_regdate;
	private String l_isquest;
	private String l_isprivate;
	private String l_questcate;
	private String l_files;
    
    
    public DataTest(Integer l_num, String l_writer, String l_content, String l_regdate, String l_isquest,
			String l_isprivate, String l_questcate,String l_files) {
		super();
		this.l_num = l_num;
		this.l_writer = l_writer;
		this.l_content = l_content;
		this.l_regdate = l_regdate;
		this.l_isquest = l_isquest;
		this.l_isprivate = l_isprivate;
		this.l_questcate = l_questcate;
		this.l_files = l_files;
	}


	public Integer getL_num() {
		return l_num;
	}


	public void setL_num(Integer l_num) {
		this.l_num = l_num;
	}


	public String getL_writer() {
		return l_writer;
	}


	public void setL_writer(String l_writer) {
		this.l_writer = l_writer;
	}


	public String getL_content() {
		return l_content;
	}


	public void setL_content(String l_content) {
		this.l_content = l_content;
	}


	public String getL_regdate() {
		return l_regdate;
	}


	public void setL_regdate(String l_regdate) {
		this.l_regdate = l_regdate;
	}


	public String getL_isquest() {
		return l_isquest;
	}


	public void setL_isquest(String l_isquest) {
		this.l_isquest = l_isquest;
	}


	public String getL_isprivate() {
		return l_isprivate;
	}


	public void setL_isprivate(String l_isprivate) {
		this.l_isprivate = l_isprivate;
	}


	public String getL_questcate() {
		return l_questcate;
	}


	public void setL_questcate(String l_questcate) {
		this.l_questcate = l_questcate;
	}
	
	public String getL_files() {
		return l_files;
	}


	public void setL_files(String l_files) {
		this.l_files = l_files;
	}

	@Override
    public String toString() {
        return "Data [l_num=" + l_num + 
        		", l_writer=" + l_writer
				+ ", l_content=" + l_content
        + ", l_files=" + l_files
        + 	",l_regdate=" + l_regdate
        + 	",l_isquest=" + l_isquest
        + 	",l_isprivate=" + l_isprivate
        + 	", l_questcate=" + l_questcate  + "]";
    }
}
 