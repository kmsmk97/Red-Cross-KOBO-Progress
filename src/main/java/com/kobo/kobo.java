package com.kobo;

public class kobo {
	private int kid;
	private String cname;
	private String stype;
	private String division;
	private String location;
	private String date;
	private double cost;
	private String participants;
	
	public kobo(int kid,String cname, String stype, String division, String location, String date,
			double cost, String participants) {
		
		this.kid = kid;
		this.cname = cname;
		this.stype = stype;
		this.division = division;
		this.location = location;
		this.date = date;
		this.cost = cost;
		this.participants = participants;
	}

	public int getKid() {
		return kid;
	}

	
	public String getCname() {
		return cname;
	}

	
	public String getStype() {
		return stype;
	}

	
	public String getDivision() {
		return division;
	}

	
	public String getLocation() {
		return location;
	}

	
	public String getDate() {
		return date;
	}

	
	public double getCost() {
		return cost;
	}


	public String getParticipants() {
		return participants;
	}

	
	
}
