package pack.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("list2")
public class JsonController2 {
	@RequestMapping(method=RequestMethod.GET)
	@ResponseBody
	public Map getJsons(){
		List<Map<String, String>> dataList = new ArrayList();
		
		Map<String, String> data = new HashMap<String, String>();
		data.put("name", "똘스머프");
		data.put("age", "5");
		dataList.add(data);
		
		data = new HashMap<String, String>();
		data.put("name", "뽕스머프");
		data.put("age", "3");
		dataList.add(data);
		
		data = new HashMap<String, String>();
		data.put("name", "뚱스머프");
		data.put("age", "6");
		dataList.add(data);
		
		//return data;
		
		Map<String, Object> data2 = new HashMap<String, Object>();
		data2.put("datas", dataList);
		return data2;
	}
}
