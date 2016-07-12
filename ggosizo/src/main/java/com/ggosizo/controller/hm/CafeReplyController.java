package com.ggosizo.controller.hm;

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

import com.ggosizo.domain.hm.CafeReplyVO;
import com.ggosizo.domain.yj.Criteria;
import com.ggosizo.domain.yj.PageMaker;
import com.ggosizo.service.hm.CafeReplyService;

@RestController
@RequestMapping("/cafeReplies")
public class CafeReplyController {

	@Inject
	private CafeReplyService service;
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody CafeReplyVO vo){
		ResponseEntity<String> entity = null;
		try {
			int viewCnt = service.addReply(vo);
			entity = new ResponseEntity<String>("[ "+viewCnt+" ]", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/all/{no}", method=RequestMethod.GET)
	public ResponseEntity<List<CafeReplyVO>> list(@PathVariable("no")int no){
		
		ResponseEntity<List<CafeReplyVO>> entity = null;
		try {
			entity = new ResponseEntity<List<CafeReplyVO>>(service.list(no), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<CafeReplyVO>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/{reply_no}", method={RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("reply_no") int reply_no,
			@RequestBody CafeReplyVO vo){
		
		ResponseEntity<String> entity = null;
		try {
			vo.setReply_no(reply_no);
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
			int viewCnt = service.delete(reply_no);
			entity = new ResponseEntity<String>("[ "+viewCnt+" ]", HttpStatus.OK);
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
		System.out.println("no "+no+" page "+page);
		try {
			Criteria cri = new Criteria();
			cri.setPage(page);
			cri.setPerPageNum(5);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			
			Map<String, Object> map = new HashMap<String, Object>();
			List<CafeReplyVO> list = service.listReplyPage(no, cri);
			for(int i=0; i<list.size(); i++){
				System.out.println("getNo : "+list.get(i).getReply_no());
			}
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
