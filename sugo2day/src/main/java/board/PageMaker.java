package board;

public class PageMaker {
	Integer page, count;
	Integer start, end;
	Boolean prev, next;
	
	public Integer getCount() {
		return count;
	}
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getEnd() {
		return end;
	}
	public void setEnd(Integer end) {
		this.end = end;
	}
	public Boolean getPrev() {
		return prev;
	}
	public void setPrev(Boolean prev) {
		this.prev = prev;
	}
	public Boolean getNext() {
		return next;
	}
	public void setNext(Boolean next) {
		this.next = next;
	}
	public Integer getPage() {
		return page;
	}
	
	public void setPage(Integer page) {
		if(page == null || page < 1) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	public void setCount(Integer count) {
		if(count < 1) return;
		this.count = count;
		calcPage();
	}
	
	private void calcPage() {
		int tempEnd = (int) (Math.ceil(page / 10.0) * 10);
		this.start = tempEnd - 9;
		if(tempEnd * 10 > this.count) {
			this.end = (int) Math.ceil(this.count / 10.0);
			this.prev = (this.page == 1) ? false : true;
			this.next = (this.page >= this.end) ? false : true;
		} else {
			this.end = tempEnd;
			this.prev = this.start != 1;
			this.next = this.end * 10 < this.count;
		}
		
	}

}
