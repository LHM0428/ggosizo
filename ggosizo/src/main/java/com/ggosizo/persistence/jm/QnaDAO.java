package com.ggosizo.persistence.jm;

import java.util.List;

import com.ggosizo.domain.jm.Criteria;
import com.ggosizo.domain.jm.QnaVO;
import com.ggosizo.domain.jm.SearchCriteria;




public interface QnaDAO {
  public void insert(QnaVO vo)throws Exception;//�۾���
  public void delete(int no)throws Exception;//����;
  public void update(QnaVO vo)throws Exception;//����
  public QnaVO select(int no)throws Exception;//�б�
  public List<QnaVO> selectAll()throws Exception;//��ü���
  
  public List<QnaVO> selectPage(int page)throws Exception;
  public List<QnaVO> selectId(String writer)throws Exception;
  public List<QnaVO> selectCriteria(Criteria cri)throws Exception;
  public int countPaging(Criteria cri)throws Exception;
  
    //�˻���� ��ġ(like)�ϴ� ���� ��ȸ
	public List<QnaVO> listSearch(SearchCriteria cri)throws Exception;
		
	//�˻���� ��ġ(like)�ϴ� ���� ��ü ��
	public int listSearchCount(SearchCriteria cri)throws Exception; //��ü ���ڵ� ��
		
    //��ȸ�� 
	public int updateViewCnt(int no)throws Exception;

	//����� ���� ī��Ʈ
	public void updateReplyCnt(int no, int amount)throws Exception;
  

  
	

}
