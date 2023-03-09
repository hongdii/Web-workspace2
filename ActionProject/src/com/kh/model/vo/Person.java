package com.kh.model.vo;

public class Person {
	private String name;
	private String gender;
	private String job;
	private String testField;
	
	public Person() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Person(String name, String gender, String job) {
		super();
		this.name = name;
		this.gender = gender;
		this.job = job;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	// 카멀케이스 규칙 지켜야 호출됨.
	// get set메서드 자동생성 이용
	public String getTestField() {
		return this.testField;
	}
	
	@Override
	public String toString() {
		return "Person [name=" + name + ", gender=" + gender + ", job=" + job + "]";
	}
	
	
	
}
