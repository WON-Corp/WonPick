package com.won.wonpick.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.won.wonpick.member.model.vo.Member;
import com.won.wonpick.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	private final MemberService mService;
	private final BCryptPasswordEncoder bCrypt;
	
	// 생성자 주입 방식으로 의존성 주입
	@Autowired
	public MemberController(MemberService mService, BCryptPasswordEncoder bCrypt) {
		this.mService = mService;
		this.bCrypt = bCrypt;
	}
	
	@RequestMapping("/login")
	 public String loginMember(Member m, Model model, HttpSession session) {
		Member loginUser = mService.loginMember(m);
		
		if (loginUser != null && bCrypt.matches(m.getPassword(), loginUser.getPassword())) {	// 로그인 성공

			session.setAttribute("loginUser", loginUser);

			return "redirect:/";
			
		} else { 					// 로그인 실패
			session.setAttribute("alertMsg", "로그인에 실패했습니다.");

			return "redirect:/";
		}
	 }
	/**
	 * 회원가입 페이지로 이동
	 * @return "member/joinPage"
	 */
	@RequestMapping("/join")
	public String enrollForm() {
		return "member/joinPage";
	}
	
	/**
	 * 회원가입 기능 구현
	 * @param m
	 * @param session
	 * @return "redirect:/"
	 */
	@RequestMapping("/insertMember")
	public String insertMember(Member m, HttpSession session) {
		
		
		m.setPassword(bCrypt.encode(m.getPassword()));
		
		int result = mService.insertMember(m);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "회원가입 성공.");
			return "redirect:/";
		} else {
			session.setAttribute("alertMsg", "회원가입에 실패하였습니다.");
			return "redirect:/";
		}
	}
	
	@RequestMapping("/idCheck")
	public void idCheck(Member m, HttpServletResponse response) {
		int count = mService.idCheck(m.getUserId());
		
		// 중복되는 데이터인 경우 "NNN" 응답 ---------------------------------------------------------
		if (count > 0) {
			try {
				response.getWriter().print("NNN");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
		// 중복되지 않는 데이터인 경우 "NNY" 응답
			try {
				response.getWriter().print("NNY");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/findIdForm")
	public String findIdForm() {
		return "member/findId";
	}
	
	@RequestMapping("/findId")
	public String findId(Member m, HttpSession session) {
		
		String userId = mService.findId(m);
		
		 if (userId != null) {
			 session.setAttribute("userId", userId);
	         return "member/findIdResult";
	     } else {
	         return "member/findIdResult";
	     }
	}
	
	@RequestMapping("/changePwdUserForm")
	public String changePwdUserForm() {
		return "member/changePasswordUser";
	}
	
	@RequestMapping("/changePwdForm")
	public String changePwdForm(Member m, HttpSession session, Model model) {
		
		int result = mService.changePwdUser(m);
		if (result > 0) {
			model.addAttribute("userId", m.getUserId());
	         return "member/changePassword";
	     } else {	
	    	 session.setAttribute("alertMsg", "회원정보가 일치하지 않습니다.");
	         return "member/changePasswordUser";
	     }
	}
	
	@RequestMapping("/changePassword")
	public String changePassword(Member m, HttpSession session) {
		
		m.setPassword(bCrypt.encode(m.getPassword()));
		
		int result = mService.changePassword(m);
		
		if (result > 0) {
			session.setAttribute("result", "비밀번호 변경에 성공하였습니다.");
	         return "member/changePasswordResult";
	     } else {	
	    	 session.setAttribute("result", "비밀번호 변경에 실패하였습니다.");
	         return "member/changePasswordResult";
	     }
	}
	@RequestMapping("/editprofile")
	public String myprofile() {
		//프로필 편집 페이지로 이동
		return "option/editProfile";
	}
	@RequestMapping("/editinfo")
	public String info() {
		//정보 수정 페이지로 이동
		return "option/information";
	}
	
	@RequestMapping("/profileInfo")
	   public String showProfileInfo(@RequestParam(value = "userId", required = false) String userId, HttpSession session, Model model) {

	       if (userId == null) {
	           Member loginUser = (Member) session.getAttribute("loginUser");
	           if (loginUser != null) {
	               userId = loginUser.getUserId();
	           } else {
	               model.addAttribute("errorMsg", "로그인 정보가 없습니다.");
	               return "common/errorPage";
	           }
	       }

	       Member foundMem = mService.getMemberById(userId);

	       if (foundMem != null) {
	           model.addAttribute("member", foundMem);
	           return "option/profileInfo"; 
	       } else {
	           model.addAttribute("errorMsg", "사용자를 찾을 수 없습니다.");
	           return "common/errorPage";
	       }
	   }


	
	@RequestMapping("/updateMember")
	public String updateMember(Member m, HttpSession session) {
		
		Member updateMem = mService.updateMember(m);
		
		if (updateMem != null) {
			session.setAttribute("loginUser", updateMem);
			session.setAttribute("alertMsg", "정보 수정에 성공하였습니다.");
			return "option/myprofile";
		} else {
			session.setAttribute("alertMsg", "정보 수정에 실패하였습니다.");
			return "redirect:/";
		}
	}
	
	@RequestMapping("/editpf")
    public String editpfImg(Member m, MultipartFile uploadImg, HttpSession session) {

            if (uploadImg != null && !uploadImg.isEmpty()) {
                    // 기존 파일 업로드 로직 유지
                    String site = "wonpick-";
                    String currTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
                    int random = (int)(Math.random() * 999 - 100 + 1) + 100;
                    String ext = uploadImg.getOriginalFilename().substring(uploadImg.getOriginalFilename().lastIndexOf("."));

                    String imgFileName = site + currTime + random + ext;
                    String path = session.getServletContext().getRealPath("/resources/profileImgs/");

                    try {
                        uploadImg.transferTo(new File(path + imgFileName));
                    } catch (IllegalStateException | IOException e) {
                        e.printStackTrace();
                    }

                    m.setPfImg("/wonpick/resources/profileImgs/" + imgFileName);
                } else {
                        // 파일을 업로드하지 않은 경우, 기존 프로필 이미지 유지
                	Member currentMember = (Member) session.getAttribute("loginUser");
                    m.setPfImg(currentMember.getPfImg());
                }

                Member updateMem = mService.updateProfile(m);

                if (updateMem != null) {
                        session.setAttribute("alertMsg", "정보 변경 성공");
                        session.setAttribute("loginUser", updateMem);
                        return "option/myprofile";
                } else {
                    session.setAttribute("alertMsg", "정보 변경 실패");
                    return "redirect:/";
                }
        }

}
