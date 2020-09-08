package podcast.controller;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;



//test use 
@Controller
public class ResponseController {
	@RequestMapping(path="/response/responseBody.controller",method=RequestMethod.GET)
	public @ResponseBody String responseBody(){
		return "This message is from Island.";
	}
	@RequestMapping(path="/response/charset/responseAccept.controller",method=RequestMethod.GET,produces = "text/plain;charset=UTF-8")
	public @ResponseBody String responseCharsetBody() {
		return "中文測試Hello.";
	}
	
	@RequestMapping(path="/response/charset/responseAcceptCode.controller",method=RequestMethod.GET,produces = "text/HTML;charset=UTF-8")
	public @ResponseBody String responseCharsetBodyHTML() {
		return "中文測試,Hello.";
	}
	
	@RequestMapping(path="/response/statusCode.controller",method = RequestMethod.GET)
	public ResponseEntity<String> responseStatusCode(){
		return new ResponseEntity<String>("Website Visit Forbidden:403",HttpStatus.FORBIDDEN);
	}
	
	@RequestMapping(path="/response/header.controller",method = RequestMethod.GET)
	public ResponseEntity<String> responseHeaderAction(){
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.TEXT_PLAIN);
		return new ResponseEntity<String>("Website Visit Permitted",HttpStatus.OK);
	}
	
	@RequestMapping(path="/response/responseImage.controller",method = RequestMethod.GET,produces = "text/plain;charset=UTF-8")
	public void responseImageAsByteArray(HttpServletRequest request,HttpServletResponse response) throws IOException {
		InputStream in = request.getServletContext().getResourceAsStream("/WEB-INF/resources/images/GR.jpg");
		IOUtils.copy(in, response.getOutputStream());
	}
	
	@RequestMapping(path="/response/responseImageByteArray.controller",method = RequestMethod.GET,produces = "text/plain;charset=UTF-8")
	public @ResponseBody byte[] responseImageAsByteArray2(HttpServletRequest request,HttpServletResponse response) throws IOException {
		InputStream in = request.getServletContext().getResourceAsStream("/WEB-INF/resources/images/GR.jpg");
		response.setContentType(MediaType.IMAGE_JPEG_VALUE);
		return IOUtils.toByteArray(in);
	}
}
