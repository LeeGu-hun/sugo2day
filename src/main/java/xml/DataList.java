package xml;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

//XML로 출력될 데이터배열을 갖는 클래스
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="Letter")
public class DataList {
   //하나의 객체 시작과 끝 내그
   @XmlElement(name="item")
   private List<Data> list;

   public DataList(List<Data> list) {
       this.list = list;
   }

   public DataList() {
       super();
       // TODO Auto-generated constructor stub
   }

   public List<Data> getList() {
       return list;
   }

   public void setList(List<Data> list) {
       this.list = list;
   }

   @Override
   public String toString() {
       return "DataList [list=" + list + "]";
   }
   
   
}