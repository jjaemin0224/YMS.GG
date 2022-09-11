package gg.yms.icia.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import gg.yms.icia.bean.Tsb_Board;
import gg.yms.icia.dao.TsbDao;
import gg.yms.icia.userClass.Paging;

@Service
public class TsbMM {

	@Autowired
	private TsbDao TsbDao;

	ModelAndView mav;
	
	public ModelAndView getTsbList(Integer pageNum, Tsb_Board tsbBoard) {
		if (pageNum == null)
			pageNum = 1;

		if (tsbBoard.getTsb_lane() != null) {
			mav = new ModelAndView();
			List<Tsb_Board> sortTsbList = TsbDao.getTsbListSort(pageNum, tsbBoard.getTsb_lane(), tsbBoard.getTsb_que(),
					tsbBoard.getTsb_tier());
			System.out.println("sort" + sortTsbList);

			if (sortTsbList != null && sortTsbList.size() != 0) {
				mav.addObject("tsbList", sortTsbList);
				mav.addObject("tsbPaging", getSortPaging(pageNum ,  tsbBoard.getTsb_lane(), tsbBoard.getTsb_que(),
						tsbBoard.getTsb_tier()));
//				mav.addObject("tsbPaging", getSortPaging(pageNum , tsbBoard.getTsb_lane(), tsbBoard.getTsb_que(),
//						tsbBoard.getTsb_tier() ));
				String view = "tsBoard/tsbListAj";
				mav.setViewName(view);
				System.out.println("if" + tsbBoard.getTsb_lane());
				System.out.println("sortTsbList=" + tsbBoard);
			} 
			else {
				String view = "tsBoard/tsbNoListAj";
				mav.setViewName(view);
			}
		}

		else {
			mav = new ModelAndView();
			List<Tsb_Board> tsbList = TsbDao.getTsbList(pageNum);
			if (tsbList != null && tsbList.size() != 0) {
				mav.addObject("tsbList", tsbList);
				mav.addObject("tsbPaging", getPaging(pageNum));
				String view = "tsBoard/tsbList";
				mav.setViewName(view);
				System.out.println("tsbList=" + tsbBoard);
			}
		}
		return mav;

	}

	private String getPaging(Integer pageNum) {
		int maxNum = TsbDao.getBoardCount();
		int listCount = 10; // 페이지당 글의 개수
		int pageCount = 5; // 그룹당 페이지 개수
		String boardName = "TsbList"; // url
		Paging paging = new Paging(maxNum, pageNum, listCount, pageCount, boardName);
		System.out.println("maxNum" + maxNum);
		return paging.makeHtmlPaging();
	}
	
	private String getSortPaging(Integer pageNum ,String lane , String que, String tier ) {
		int maxNum = TsbDao.getSortBoardCount(lane , que , tier);
		System.out.println("maxNum"+maxNum);
		int listCount = 10; // 페이지당 글의 개수
		int pageCount = 5; // 그룹당 페이지 개수
		String boardName = "TsbList"; // url
		
		Paging paging = new Paging(maxNum, pageNum, listCount, pageCount, boardName);
		return paging.makeHtmlPaging();
	}
	
	
	

	// 글번호로 글쓰기 key select 가능 할 경우
	public ModelAndView tsbWrite(Tsb_Board tsb, HttpSession session) {
		mav = new ModelAndView();
		String view = null;
		String id = session.getAttribute("id").toString();
		tsb.setTsb_id(id);

		System.out.println("tsb" + tsb);
		if (TsbDao.tsbWrite(tsb)) {
			view = "home";
			mav.addObject("tsbInsertCheck", 1);
		} else {
			view = "tsBoard/tsbList";
			mav.addObject("tsbInsertCheck", 2);
		}
		mav.setViewName(view);
		return mav;
	}

	public ModelAndView tsbContents(int postnum) {
		String view = "tsBoard/tsbContents";
		mav = new ModelAndView();
		Tsb_Board tsBoard = TsbDao.getTsb(postnum);
		System.out.println("게시글 확인 " + tsBoard);
		mav.addObject("tsbContents", tsBoard);
		mav.setViewName(view);
		return mav;
	}

	public ModelAndView tsbDelete(int postnum) {
		String view = null;
		mav = new ModelAndView();
		if (TsbDao.tsbDelete(postnum)) {
			view = "tsBoard/tsbList";
//			System.out.println("delete 후 table 값"+TsbDao.getTsbList());
			mav.addObject("tsbDeleteCheck", 1);
		} else {
			view = "tsBoard/tsbContents";
			mav.addObject("tsbDeleteCheck", 1);
		}
		mav.setViewName(view);
		return mav;
	}

	

}
