package pack.upload;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UploadController {
	@Autowired
	private FileValidator fileValidator; //파일 검사
	
	@RequestMapping(value="upload", method=RequestMethod.GET)
	public String getUploadForm(@ModelAttribute("uploadFile") UploadBean uploadBean){
		return "uploadform";
	}
	
	@RequestMapping(value="upload", method=RequestMethod.POST)
	public ModelAndView fileUpload(@ModelAttribute("uploadFile") UploadBean uploadBean, BindingResult result){
		//BindingResult 에러처리
		InputStream inputStream = null;
		OutputStream outputStream = null;
		
		//파일 오류검사
		MultipartFile file = uploadBean.getFile();
		fileValidator.validate(uploadBean, result);
		
		String fileName = file.getOriginalFilename();
		if(result.hasErrors()){
			return new ModelAndView("uploadform");
		}
		
		try {
			inputStream = file.getInputStream();
			File newFile = new File("/Users/All/Documents/my/upload/" + fileName);
			if(!newFile.exists()){
				newFile.createNewFile();
			}
			outputStream = new FileOutputStream(newFile);
			int read = 0;
			byte[] bytes = new byte[1024];
			
			while((read = inputStream.read(bytes)) != -1){
				outputStream.write(bytes, 0, read);
			}
		} catch (Exception e) {
			System.out.println("fileUpload err : " + e);
		} finally {
			try {
				outputStream.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return new ModelAndView("uploadedlist", "filename", fileName);
	}
}
















