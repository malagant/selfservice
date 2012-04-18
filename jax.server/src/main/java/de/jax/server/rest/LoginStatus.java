package de.jax.server.rest;

public class LoginStatus {

	
	// // // curl -i -H "Content-Type: application/json" -X POST -d
	// "{\"deviceId\": \"my-iphone\", \"lastName\": \"Duck\", \"tcCode\": \"7777\", \"username\": \"dd@example.com\", \"firstName\": \"Donald\"}"
	// http://localhost:8080/jaxtc/rest/registration
	
	
	private String status;

	public LoginStatus(String string) {
		this.status = string;
	}

	public LoginStatus() {
		super();
	}

	@Override
	public String toString() {
		return "LoginStatus [status=" + status + "]";
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	
	
	
	
	
	

}
