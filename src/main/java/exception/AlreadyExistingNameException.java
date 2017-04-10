package exception;

public class AlreadyExistingNameException extends RuntimeException {
	
	public AlreadyExistingNameException(String msg) {
		super(msg);
	}

}
