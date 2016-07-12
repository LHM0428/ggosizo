package com.ggosizo.controller.jm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ggosizo.domain.jm.Criteria;
import com.ggosizo.domain.jm.PageMaker;
import com.ggosizo.domain.jm.QnaReplyVO;
import com.ggosizo.service.jm.QnaReplyService;

@RestController
@RequestMapping("/qnaReplies")
public class QnaReplyController {
	
	@Inject
	private QnaReplyService service;
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody QnaReplyVO vo){
		ResponseEntity<String> entity = null;
		try {
			int viewCnt = service.insert(vo);
			System.out.println("ÀÔ·Â¼º°ø");
			entity = new ResponseEntity<String>("[ "+viewCnt+" ]", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		 
		}
		return entity;
	}
	
	@RequestMapping(value="/all/{no}", method=RequestMethod.GET)
	public ResponseEntity<List<QnaReplyVO>> list(@PathVariable("no")int no){
		
		ResponseEntity<List<QnaReplyVO>> entity = null;
		try {
			entity = new ResponseEntity<>(service.list(no), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/{reply_no}", method={RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("reply_no") int reply_no,
			@RequestBody QnaReplyVO vo){
		System.out.println("ï¿½ï¿½ï¿½ï¿½  : "+reply_no);
		ResponseEntity<String> entity = null;
		try {
			vo.setreply_no(reply_no);
			service.update(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/{reply_no}", method=RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("reply_no") int reply_no){
		ResponseEntity<String> entity = null;
		try {
			System.out.println(reply_no);
			service.delete(reply_no);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/{no}/{page}", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(
			@PathVariable("no") int no, @PathVariable("page") int page){
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		try {
			Criteria cri = new Criteria();
			cri.setPage(page);
			cri.setPerPageNum(5);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			
			Map<String, Object> map = new HashMap<String, Object>();
			List<QnaReplyVO> list = service.listPage(no, cri);
		//	System.out.println(list.get(0).getreply_content());
			map.put("list", list);
			int replyCount = service.count(no);
			pageMaker.setTotalCount(replyCount);
			
			map.put("pageMaker", pageMaker);
			
			entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return entity;
	}
}






