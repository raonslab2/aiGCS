package egovframework.or.kr.EMAU000.service.impl;

import egovframework.let.utl.sim.service.EgovFileScrty;

public class test {
	public static void main(String[] args) {

		String id = "admin";
		String passwd = "1";
		try {
			String enpassword = EgovFileScrty.encryptPassword(passwd, id);
			System.out.println(enpassword);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
