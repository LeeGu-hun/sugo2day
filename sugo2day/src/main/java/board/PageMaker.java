package board;

public class PageMaker {
	Integer page, count;
	Integer start, end;
	Boolean prev, next;
	
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
	public Integer getCount() {
		return count;
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
	public Integer getPage() { return page; }

	public void setPage(Integer page) {
		if (page == null || page < 1) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	public void setCount(Integer count) {
		if (count < 1) return;
		this.count = count;
		calcPage();
	}

	private void calcPage() {
		// page변수는 현재 페이지번호
		int tempEnd = (int) (Math.ceil(page / 10.0) * 10);
		// 현재 페이지번호를 기준으로 끝 페이지를 계산한다.
		// 시작 페이지 계산
		this.start = tempEnd - 9;
		if (tempEnd * 10 > this.count) {
			// 가상으로 계산한 tempEnd크기가 실제 count보다 많을경우
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
