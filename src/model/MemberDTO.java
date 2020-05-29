package model;

/*
DTO객체(Data Transfer Object)
	: 데이터를 저장하기 위한 객체로 멤버변수,생성자,getter/setter
	메소드를 가지고있는 클래스로 일반적인 자바빈(Bean)규약을 따른다.
*/
public class MemberDTO {
	//멤버변수 : 정보은닉을 위해 private으로 선언함.
	private String name;
	private String id;
	private String pass1;
	private String tel;
	private String mob;
	private String email;
	private String addr;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass1() {
		return pass1;
	}

	public void setPass1(String pass1) {
		this.pass1 = pass1;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getMob() {
		return mob;
	}

	public void setMob(String mob) {
		this.mob = mob;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getAddr() {
		return addr;
	}
	
	public void setAddr(String addr) {
		this.addr = addr;
	}

	/*
	Object클래스에서 제공하는 메소드로 객체를 문자열형태로 변형해서
	반환해주는 역할을 한다. toString()메소드를 오버라이딩하면
	객체 자체를 그대로 println()하는것이 가능하다.
	 */
	
	@Override
	public String toString() {
		return String.format("아이디:%s, 비밀번호:%s, 이름:%s",id,pass1,name);
	}
	
}
	
