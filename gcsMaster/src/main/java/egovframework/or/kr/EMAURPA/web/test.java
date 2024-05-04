package egovframework.or.kr.EMAURPA.web;

import java.io.File;
import java.io.FilenameFilter;

import org.springframework.web.servlet.ModelAndView;

public class test {
	public static void main(String[] args) {
//		File dir = new File("/home/rpa/work/2021/09/15");
//		FilenameFilter filter = new FilenameFilter() {
//			public boolean accept(File f, String name) {
//				return name.startsWith("file");
//			}
//		};
//		
//		File files[] = dir.listFiles(filter);
//		for (int i = 0; i < files.length; i++) {
//			System.out.println("file: " + files[i]);
//		}
		String strDirPath = "C:\\home\\rpa\\work\\2021\\09\\16";
		ListFile(strDirPath);
		
	}

	private static ModelAndView ListFile(String strDirPath) {
		ModelAndView mav = new ModelAndView("jsonView");
		File path = new File(strDirPath);
		File[] fList = path.listFiles();
		
		for (int i = 0; i < fList.length; i++) {
			if(fList[i].isFile()) {
				System.out.println(fList[i].getPath());
			}else if(fList[i].isDirectory()) {
				ListFile(fList[i].getPath());
			}
			mav.addObject("list", fList[i].getPath());
		}
		return mav;
		
	}
	

}
