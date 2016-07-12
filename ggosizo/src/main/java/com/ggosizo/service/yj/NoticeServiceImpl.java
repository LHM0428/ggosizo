package com.ggosizo.service.yj;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ggosizo.domain.yj.Criteria;
import com.ggosizo.domain.yj.NoticeFileVO;
import com.ggosizo.domain.yj.NoticeVO;
import com.ggosizo.domain.yj.SearchCriteria;
import com.ggosizo.persistence.yj.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Inject
	private NoticeDAO dao;
	
	@Transactional
	@Override
	public void insert(NoticeVO notice) throws Exception {
        dao.insert(notice);
        
        String files = notice.getFiles();
        
        if(files == null)
        	return;
        
        NoticeFileVO file = new NoticeFileVO();
        file.setPath(files);
        file.setNo(dao.maxNo());
        
        dao.addAttach(file);
        
	}

	@Override
	public void delete(int no) throws Exception {
		dao.deleteAttach(no);
		dao.delete(no);
	}

	@Override
	public void update(NoticeVO notice) throws Exception {
		dao.update(notice);
		NoticeFileVO file = new NoticeFileVO();
			file = dao.getAttach(notice.getNotice_no());
	        file.setPath(notice.getFiles());
		dao.updateAttach(file);
	}

	@Override
	public NoticeVO select(int no) throws Exception {
		dao.updateViewCnt(no);
		NoticeVO notice = dao.select(no);
			if(dao.getAttach(no) != null){
				NoticeFileVO file = dao.getAttach(no);				
				notice.setFiles(file.getPath());
			}
		return notice;
	}
	
	@Override
	public NoticeVO updateSelect(int no) throws Exception {
		NoticeVO notice = dao.select(no);
		if(dao.getAttach(no) != null){
			NoticeFileVO file = dao.getAttach(no);				
			notice.setFiles(file.getPath());
		}
		return notice;
	}

	@Override
	public List<NoticeVO> selectAll() throws Exception {
		return dao.selectAll();
	}

	@Override
	public void selectPage(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void selectCount() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<NoticeVO> listCriteria(Criteria cri) throws Exception {
		return dao.selectCriteria(cri);
	}

	@Override
	public int listCountCriteria() throws Exception {
		return dao.countPage();
	}

	@Override
	public List<NoticeVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

}
