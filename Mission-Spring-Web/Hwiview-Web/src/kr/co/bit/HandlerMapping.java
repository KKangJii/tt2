package kr.co.bit;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import kr.co.bit.controller.Controller;

public class HandlerMapping {
	private Map<String,Controller> mappings = null;
	

	public HandlerMapping() {
		this("E:\\Lecture\\web-workspace\\Hwiview-Web\\bean.properties");
	}

	public HandlerMapping(String configName) {
		mappings = new HashMap<>();
		try {
		Properties prop = new Properties();
		
		InputStream inStream = new FileInputStream(configName);
		prop.load(inStream);
		Set<Object> keys = prop.keySet();
		for(Object key : keys) {
			String className = prop.getProperty(key.toString());
			Class<?> clz = Class.forName(className);
			System.out.println(key);
			mappings.put(key.toString(), (Controller)clz.newInstance());
		}
		}catch(Exception e) {
			
		}
		/*mappings.put("/list.do", new ListController());
		mappings.put("/writeForm.do", new WriteFormController());
		mappings.put("/login.do", new LoginController());
		mappings.put("/LogInfo.do", new LogInfoController());
		mappings.put("/logout.do", new LogoutController());*/
	}
	
	public Controller getController(String uri) {
		
		
		return mappings.get(uri);
	}
}
