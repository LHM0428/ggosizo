package com.ggosizo.service.yj;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ggosizo.domain.yj.Criteria;
import com.ggosizo.domain.yj.EventFileVO;
import com.ggosizo.domain.yj.EventVO;
import com.ggosizo.domain.yj.SearchCriteria;
import com.ggosizo.persistence.yj.EventDAO;

@Service
public class EventServiceImpl implements EventService {

	@Inject
	private EventDAO dao;
	
	@Transactional
	@Override
	public void insert(EventVO event) throws Exception {
        dao.insert(event);
        
        String files = event.getFiles();
        
        if(files == null)
        	return;
        
        EventFileVO file = new EventFileVO();
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
	public void update(EventVO event) throws Exception {
		dao.update(event);
		EventFileVO file = new EventFileVO();
			file = dao.getAttach(event.getEvent_no());
	        file.setPath(event.getFiles());
		dao.updateAttach(file);
	}	
	

	@Override
	public EventVO select(int no) throws Exception {
		dao.updateViewCnt(no);
		EventVO event = dao.select(no);
			if(dao.getAttach(no) != null){
				EventFileVO file = dao.getAttach(no);				
				event.setFiles(file.getPath());
			}
		return event;
	}

	@Override
	public EventVO updateSelect(int no) throws Exception {
		EventVO event = dao.select(no);
		if(dao.getAttach(no) != null){
			EventFileVO file = dao.getAttach(no);				
			event.setFiles(file.getPath());
		}
		return event;
	}

	@Override
	public List<EventVO> selectAll() throws Exception {
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
	public List<EventVO> listCriteria(Criteria cri) throws Exception {
		return dao.selectCriteria(cri);
	}

	@Override
	public int listCountCriteria() throws Exception {
		return dao.countPage();
	}

	@Override
	public List<EventVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

}
