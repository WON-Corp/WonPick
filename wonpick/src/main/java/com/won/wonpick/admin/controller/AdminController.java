package com.won.wonpick.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.won.wonpick.admin.service.AdminService;
import com.won.wonpick.admin.service.AdminServiceImpl;
import com.won.wonpick.member.model.vo.Member;
import com.won.wonpick.post.model.vo.Post;
import com.won.wonpick.errorPost.model.vo.ErrorPost; // ErrorPost import
import com.won.wonpick.post.service.PostService;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;
    
    @Autowired
    private PostService postService;
    
    @RequestMapping("/adminMain")
    public String adminMain() {
        return "admin/adminMain";
    }
    
    // 회원 정보 수정
    @RequestMapping("/manageUsers")
    public String adminUsers(Model model) {
        List<Member> userList = adminService.getAllMembers();
        model.addAttribute("userList", userList);
        return "admin/manageUsers";
    }

    @RequestMapping("/updateUser")
    @ResponseBody
    public String updateUser(@RequestBody Member member) {
        int result = adminService.updateMember(member);
        return (result > 0) ? "success" : "fail";
    }

    @RequestMapping("/deleteUser")
    public String deleteUser(String id) {
        int result = adminService.deleteUser(id);
        return (result > 0) ? "redirect:/admin/manageUsers" : "common/errorPage";
    }

    // 게시글 관리
    @RequestMapping("/managePosts")
    public String adminPosts(Model model) {
        List<Post> postList = postService.getAllPosts();
        model.addAttribute("postList", postList);
        return "admin/managePosts";
    }

    @RequestMapping("/updatePost")
    @ResponseBody
    public String updatePost(@RequestBody Post post) {
        int result = postService.updatePost(post);
        return (result > 0) ? "success" : "fail";
    }

    @RequestMapping("/deletePost")
    public String deletePost(int postId) {
        int result = postService.deletePost(postId);
        return (result > 0) ? "redirect:/admin/managePosts" : "common/errorPage";
    }

    @RequestMapping("/manageReports")
    public String adminReports(Model model) {
        List<ErrorPost> reportList = adminService.getAllReports();
        model.addAttribute("reportList", reportList);
        return "admin/manageReports";
    }
    
    // 탈퇴 회원 관리
    @RequestMapping("/managedrawnUsers")
    public String manageWithdrawnUsers(Model model) {
        List<Member> withdrawnUserList = adminService.getWithdrawnMembers();
        model.addAttribute("withdrawnUserList", withdrawnUserList);
        return "admin/managedrawnUsers";
    }
    
    @RequestMapping("/deleteWithdrawnUser")
    public String deleteWithdrawnUser(String id) {
        int result = adminService.deleteUser(id);
        return (result > 0) ? "redirect:/admin/manageWithdrawnUsers" : "common/errorPage";
    }

    // 문제 신고 답변
    @RequestMapping("/respondReport")
    @ResponseBody
    public String respondReport(@RequestBody ErrorPost errorPost) {
        int result = adminService.respondToReport(errorPost);
        String phone = adminService.getPhoneNumber(errorPost.getUserId());
        
        if(result > 0) {
        	return phone;
        } else {
        	return "01074400000";
        }
    }

    // 문제 신고 삭제
    @RequestMapping("/deleteReport")
    public String deleteReport(int errorPostId) {
        int result = adminService.deleteReport(errorPostId);
        return (result > 0) ? "redirect:/admin/manageReports" : "common/errorPage";
    }

    @RequestMapping("/manageUserCounts")
    @ResponseBody
    public int adminUserCounts() {
        return adminService.getTotalMemberCount();
    }

    @RequestMapping("/managePostCounts")
    @ResponseBody
    public int adminPostCounts() {
        return adminService.getTotalPostCount();
    }

}
