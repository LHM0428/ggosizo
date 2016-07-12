package com.ggosizo.controller.yj;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ggosizo.domain.hm.SidoCriteria;
import com.ggosizo.domain.yj.FestivalVO;
import com.ggosizo.domain.yj.MonthCriteria;
import com.ggosizo.service.yj.FestivalService;
import com.ggosizo.util.MediaUtils;
import com.ggosizo.util.UploadFileUtils;

@Controller
@RequestMapping(value = "/upfestival")
public class UploadController {

  private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

  @Inject
  private FestivalService service;
  
  private String uploadPath=null;
  private FestivalVO fileVO;
  private int fileNo;
  
  @RequestMapping(value = "/inputForm", method = RequestMethod.GET)
  public String uploadForm(FestivalVO festival, Model model, @ModelAttribute("cri") MonthCriteria cri) {
	  fileVO = new FestivalVO();
	return "/upfestival/f_input_form";
  }

  @RequestMapping(value = "/inputForm", method = RequestMethod.POST)
  public String uploadForm(FestivalVO festival,  RedirectAttributes attr, MonthCriteria cri, 
			@RequestParam("year1") String year1, @RequestParam("month1") String month1, @RequestParam("day1") String day1,
			@RequestParam("year2") String year2, @RequestParam("month2") String month2, @RequestParam("day2") String day2, 
			HttpSession session, SidoCriteria sido) throws Exception {

    
    String startdate=year1+"/"+month1+"/"+day1;
	String enddate=year2+"/"+month2+"/"+day2;
	
	
	festival.setStartdate(startdate);
	festival.setEnddate(enddate);
	if(!festival.getFile().isEmpty()){
	}
    
    service.insert(festival);
	attr.addFlashAttribute("msg", "success");
	return "redirect:/festival/festival";
  }

  @RequestMapping(value = "/uploadAjax", method = RequestMethod.GET)
  public void uploadAjax() {
  }

  @ResponseBody
  @RequestMapping(value ="/uploadAjax", method=RequestMethod.POST, 
                  produces = "text/plain;charset=UTF-8")
  public ResponseEntity<String> uploadAjax(MultipartFile file,String category,HttpSession session)throws Exception{
    
    uploadPath = "I:\\yeonji\\workspace\\uploadFiles\\"+category;
    
    String filePath = UploadFileUtils.uploadFile(uploadPath, 
            file.getOriginalFilename(),
            file.getBytes());
    
    System.out.println("uploadAjax POST filePath :"+filePath);
    
    return 
      new ResponseEntity<>(filePath,HttpStatus.CREATED);
  }
  
  
  @ResponseBody
  @RequestMapping("/displayFile")
  public ResponseEntity<byte[]>  displayFile(String fileName, HttpSession session)throws Exception{
    
    InputStream in = null; 
    ResponseEntity<byte[]> entity = null;
        
    try{
      
      String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
      
      MediaType mType = MediaUtils.getMediaType(formatName);
      
      HttpHeaders headers = new HttpHeaders();
      
      uploadPath = "I:/yeonji/workspace/uploadFiles/festival";
      in = new FileInputStream(uploadPath+fileName);
      
      if(mType != null){
        headers.setContentType(mType);
      }else{
        
        fileName = fileName.substring(fileName.indexOf("_")+1);       
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.add("Content-Disposition", "attachment; filename=\""+ 
          new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
      }

        entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), 
          headers, 
          HttpStatus.CREATED);
    }catch(Exception e){
      e.printStackTrace();
      entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
    }finally{
      in.close();
    }
      return entity;    
  }
    
  @ResponseBody
  @RequestMapping(value="/deleteFile", method=RequestMethod.POST)
  public ResponseEntity<String> deleteFile(String fileName){
    
    logger.info("delete file: "+ fileName);
    
    String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
    
    MediaType mType = MediaUtils.getMediaType(formatName);
    
    if(mType != null){      
      
      String front = fileName.substring(0,12);
      String end = fileName.substring(14);
      new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
    }
    
    new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
    
    
    return new ResponseEntity<String>("deleted", HttpStatus.OK);
  }  
  
  @ResponseBody
  @RequestMapping(value="/deleteAllFiles", method=RequestMethod.POST)
  public ResponseEntity<String> deleteFile(@RequestParam("files[]") String[] files){
    
    logger.info("delete all files: "+ files);
    
    if(files == null || files.length == 0) {
      return new ResponseEntity<String>("deleted", HttpStatus.OK);
    }
    
    for (String fileName : files) {
      String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
      
      MediaType mType = MediaUtils.getMediaType(formatName);
      
      if(mType != null){      
        
        String front = fileName.substring(0,12);
        String end = fileName.substring(14);
        new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
      }
      
      new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
      
    }
    return new ResponseEntity<String>("deleted", HttpStatus.OK);
  }  
  
  private String uploadFile(String originalName, byte[] fileData) throws Exception {

	    UUID uid = UUID.randomUUID();

	    String savedName = uid.toString() + "_" + originalName;

	    File target = new File(uploadPath, savedName);
	    
	    FileCopyUtils.copy(fileData, target);

	    return savedName;

	  }
}
