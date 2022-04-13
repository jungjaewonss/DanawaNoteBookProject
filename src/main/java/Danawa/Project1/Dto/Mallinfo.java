package Danawa.Project1.Dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@ToString
@Getter
@Setter
public class Mallinfo {
 
	private String modelnum;
	private String link;
	private String logo;
	private String price;
	private String shipping;
	private String mallname; 

	
	public Mallinfo() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Mallinfo(String modelnum, String link, String logo, String price, String shipping, String mallname) {
		super();
		this.modelnum = modelnum;
		this.link = link;
		this.logo = logo;
		this.price = price;
		this.shipping = shipping;
		this.mallname = mallname;
	}


	
	
	
	
}
