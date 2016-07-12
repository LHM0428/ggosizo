package com.ggosizo.controller.ss;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

import com.ggosizo.domain.DateCourse;
import com.ggosizo.domain.hm.SidoCriteria;
import com.ggosizo.domain.ss.DateCourse1;
import com.ggosizo.domain.ss.DateCourse2;
import com.ggosizo.domain.ss.DateCourse3;
import com.ggosizo.domain.ss.DateCourseDTO;
import com.ggosizo.domain.yj.PageMaker;
import com.ggosizo.domain.yj.SearchCriteria;
import com.ggosizo.persistence.hm.SidoDAO;
import com.ggosizo.service.ss.UserCourseService;

@Controller
@RequestMapping("/userCourse")
public class UserCourseController {
   @Inject
   private UserCourseService userCourseService;
   @Inject
   SidoDAO sidoDAO;
   
   String course1Str;
   String course2Str;
   String course3Str;
   int course1;
   int course2;
   int course3;
   
   @RequestMapping("/listAll")
   public String listAll(Model model,SearchCriteria cri){
      PageMaker pageMaker = new PageMaker();
      pageMaker.setCri(cri);
      pageMaker.setTotalCount(userCourseService.listSearchCount(cri));
      
      model.addAttribute("pageMaker", pageMaker);
      model.addAttribute("course",userCourseService.selectKeyword(cri));
      return "/userCourse/user_course_listAll";
   }
   @RequestMapping(value="/selecSido", method=RequestMethod.POST)
	public String selecSido(String sido, String selectGugun, RedirectAttributes rttr, HttpSession session){
		List<String> list = sidoDAO.selectGugun(sido);
		rttr.addFlashAttribute("gugun", list);
		rttr.addFlashAttribute("selectGugun", selectGugun);
		return "redirect:/userCourse/user_course_selsido";
	}
	@RequestMapping(value="/user_course_selsido", method=RequestMethod.GET)
	public void selSido(){
	}
	
	@RequestMapping(value="/selecGugun", method=RequestMethod.POST)
	public String selecGugun(String gugun,String selectDong, RedirectAttributes rttr){
		List<String> list = sidoDAO.selectDong(gugun);
		rttr.addFlashAttribute("dong", list);
		rttr.addFlashAttribute("selectDong", selectDong);
		return "redirect:/userCourse/user_course_selsido";
	}
   
   @RequestMapping("/read")
   public String read( Model model,int no, SearchCriteria cri){
      DateCourseDTO dateCourse = userCourseService.selectDateCourse(no); //�뜲�씠�듃肄붿뒪 �젙蹂� �뼸�뼱�삤湲�
      String orders = dateCourse.getCourse_order();
      String order[] = orders.split("-");
      
      int courseNo[] = new int[3];
      DateCourse course[] = new DateCourse[3];

      for(int i=0; i<3; i++){
         courseNo[i] = userCourseService.selectCourseNo(i+1,order[i],no); //肄붿뒪1,2,3 踰덊샇 select
         course[i] = userCourseService.selectCourse(order[i],courseNo[i]); //肄붿뒪1,2,3 �젙蹂� �뼸�뼱�삤湲�
      }
      model.addAttribute("course1",course[0]);
      model.addAttribute("course2",course[1]);
      model.addAttribute("course3",course[2]);
      model.addAttribute("course", dateCourse);
      model.addAttribute("title",dateCourse.getCourse_title()); //肄붿뒪 �젣紐�
      model.addAttribute("no",dateCourse.getCourse_no()); //肄붿뒪 踰덊샇
      
      return "/userCourse/user_course_read";
   }
   
   @RequestMapping(value="/insert",method=RequestMethod.GET)
   public String insertUserCourseGET(){
      return "/userCourse/user_course_insert";
   }
   @RequestMapping(value="/insert",method=RequestMethod.POST)
   public String insertUserCoursePOST(DateCourse1 dateCourse1,DateCourse2 dateCourse2,
                              DateCourse3 dateCourse3){
      course1Str = dateCourse1.getCategory();
      course2Str = dateCourse2.getCategory2();
      course3Str = dateCourse3.getCategory3();
      course1 = userCourseService.selectCourseAllNo(course1Str);
      course2 = userCourseService.selectCourseAllNo(course2Str);
      course3 = userCourseService.selectCourseAllNo(course3Str);
      returnCourseNo(course1Str,course2Str,course3Str);
      returnEtcCourse(dateCourse1,dateCourse2,dateCourse3);
      //�닚�꽌
      String order = course1Str+"-"+course2Str+"-"+course3Str;
      String title = dateCourse2.getTitle();
      userCourseService.insertDateCourse(dateCourse1,dateCourse2,dateCourse3,
            course1,course2,course3,order,title);
      
      return "redirect:/userCourse/listAll";
   }
   
   @RequestMapping(value="/update",method=RequestMethod.GET)
   public String updateUserCourseGET(Model model,int dateCourseNo){
      DateCourseDTO dateCourse = userCourseService.selectDateCourse(dateCourseNo); //�뜲�씠�듃肄붿뒪 �젙蹂� �뼸�뼱�삤湲�
      System.out.println("###update GET###");
      String orders = dateCourse.getCourse_order();
      String order[] = orders.split("-");
      
      System.out.println("orders:"+orders);
      
      int courseNo[] = new int[3];
      DateCourse course[] = new DateCourse[3];

      for(int i=0; i<3; i++){
         courseNo[i] = userCourseService.selectCourseNo(i+1,order[i],dateCourseNo); //肄붿뒪1,2,3 踰덊샇 select
         course[i] = userCourseService.selectCourse(order[i],courseNo[i]); //肄붿뒪1,2,3 �젙蹂� �뼸�뼱�삤湲�
         System.out.println("courseNo[i]"+courseNo[i]);
         System.out.println("course[i]"+course[i]);
      }
      model.addAttribute("course1",course[0]);
      model.addAttribute("course2",course[1]);
      model.addAttribute("course3",course[2]);
      
      model.addAttribute("title",dateCourse.getCourse_title());
      model.addAttribute("no",dateCourseNo);
      
      return "userCourse/user_course_update";
   }
   @RequestMapping(value="/update",method=RequestMethod.POST)
   public String updateUserCoursePOST(int dateCourseNo, RedirectAttributes rttr, String keyword,
         DateCourse1 dateCourse1,DateCourse2 dateCourse2,DateCourse3 dateCourse3){
      System.out.println("###update POST###");
      System.out.println("dateCourseNo:"+dateCourseNo);
      System.out.println(dateCourse1.getNo());
      System.out.println(dateCourse2.getNo2());
      System.out.println(dateCourse3.getNo3());
      //媛곴컖�쓽 肄붿뒪醫낅쪟
      course1Str = dateCourse1.getCategory();
      course2Str = dateCourse2.getCategory2();
      course3Str = dateCourse3.getCategory3();
      //湲고�肄붿뒪�씪 寃쎌슦 �젣紐� 媛��졇�삤湲�
      returnEtcCourse(dateCourse1,dateCourse2,dateCourse3);
      //�닚�꽌
      String order = course1Str+"-"+course2Str+"-"+course3Str;
      //�뜲�씠�듃肄붿뒪 �씠由�
      String title = dateCourse2.getTitle();
      if(keyword!=null &&keyword.length()>0){
    	  rttr.addFlashAttribute("keyword", keyword);
      }
      //媛곴컖�쓽 肄붿뒪 update + �뜲�씠�듃肄붿뒪 update
      userCourseService.updateDateCourse(dateCourse1,dateCourse2,dateCourse3,order,title,
            dateCourseNo);
      
      return "redirect:/userCourse/listAll";
   }
   
   @RequestMapping(value="/delete",method=RequestMethod.POST)
   public String deleteUserCourse(int no){
      userCourseService.deleteDateCourse(no);
      
      return "redirect:/userCourse/listAll";
   }
   
   //媛숈�肄붿뒪�씪 寃쎌슦 肄붿뒪踰덊샇 利앷��떆�궎湲�
   public void returnCourseNo(String course1Str,String course2Str,String course3Str){
      if(course1Str.equals(course2Str)){
         course2 = course1+1;
         if(course2Str.equals(course3Str)){
            course3 = course2+1;
            return;
         }
      }else if(course1Str.equals(course3Str)){
         course3 = course1+1;
      }else if(course2Str.equals(course3Str)){
         course3 = course2+1;
      }
   }
   //湲고�肄붿뒪�씪 寃쎌슦 �젣紐⑷��졇�삤湲�
   public void returnEtcCourse(DateCourse1 dateCourse1,DateCourse2 dateCourse2,
         DateCourse3 dateCourse3){
      if(course1Str.equals("湲고�")){
         course1Str = dateCourse1.getEtc_title();
      }
      if(course2Str.equals("湲고�")){
         course2Str = dateCourse2.getEtc_title2();
      }
      if(course3Str.equals("湲고�")){
         course3Str = dateCourse3.getEtc_title3();
      }
   }
   
	@RequestMapping(value="naverApi", method=RequestMethod.GET)
	public String naverBlog(String query, int page, Model model) throws Exception{
		  String clientId = "X36hn5S4udKO5mXkb3IK";
         String clientSecret="gul5uME41h";
         query = query.replace(" ","-");
         String url = "https://openapi.naver.com/v1/search/blog.xml?query="
       		  		+query+"&display=5&start=1";
         if(query!=null)model.addAttribute("query",query);
         /*�슂泥�泥섎━*/
         HttpClient client = HttpClientBuilder.create().build();//�슂泥�二쇱껜
         
         HttpGet req= new HttpGet(url);//reqest 媛앹껜
         req.addHeader("X-Naver-Client-Id",clientId);
         req.addHeader("X-Naver-Client-Secret",clientSecret);
         //�슂泥�
         HttpResponse res= client.execute(req);//execute�쓽  由ъ뒪���뒪媛믪쓣 HttpResponse媛앹껜�뿉 �븷�떦 
         
         /*HttpResponse 媛앹껜�쓽 而⑦뀗痢� �씫�뼱�삤湲� */
         HttpEntity entity = res.getEntity();
         
         InputStream is = entity.getContent();
         List<HashMap<String, String>> list = getSearchResult(is);
         
         if(list!=null)model.addAttribute("list", list);
		return "userCourse/blog_result";
	}
   
	
	
	//===================XMLPullParser================================
	public ArrayList<HashMap<String,String>> getSearchResult(InputStream is){
		ArrayList<HashMap<String,String>> result = new ArrayList<HashMap<String,String>>();
        try {
			XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
			XmlPullParser parser = factory.newPullParser();
			parser.setInput(new InputStreamReader(is, "UTF-8"));
			
			boolean inDesc = false;
			HashMap<String, String> hash = null;
			String startTag = null;
			int parserEvent = parser.getEventType();
			
			while(parserEvent != XmlPullParser.END_DOCUMENT){
				switch(parserEvent){
				case XmlPullParser.START_TAG:
					if(parser.getName().equals("item")){
						inDesc = true;
						hash = new HashMap<String, String>();
					}
					startTag = parser.getName();
					break;
					
				case XmlPullParser.TEXT:
					if(inDesc){
						if(hash!= null){
							String text = parser.getText();
							if(startTag!=null && text!=null){
								hash.put(startTag, text.replace("<b>", "").replace("</b>", ""));
							}
						}
					}
					break;
					
				case XmlPullParser.END_TAG:
					if(parser.getName().equals("item")){
						inDesc=false;
						if(hash != null){result.add(hash);}
						hash = null;
					}
					break;
				}
				parserEvent = parser.next();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
        return result;
	}
}