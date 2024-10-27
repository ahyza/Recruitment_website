package com.job.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.job.model.Company;
import com.job.model.Info;
import com.job.model.Job;
import com.job.model.Letter;
import com.job.model.Page;
import com.job.model.Resume;
import com.job.model.Seeker;
import com.job.model.User;
import com.job.service.CompanyService;
import com.job.service.InfoService;
import com.job.service.JobService;
import com.job.service.LetterService;
import com.job.service.ResumeService;
import com.job.service.SeekerService;
import com.job.service.UserService;
import com.job.utils.PageUtils;
import com.job.utils.UploadUtils;

@Controller
public class IndexController {
	@Autowired
	private UserService userService;
	@Autowired
	private SeekerService seekerService;
	@Autowired
	private CompanyService companyService;
	@Autowired
	private JobService jobService;
	@Autowired
	private InfoService infoService;
	@Autowired
	private LetterService letterService;
	@Autowired
	private ResumeService resumeService;
	/**
	 * 跳转到前台主页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/index")
	public String index() {
		return "front/index";
	}

	/**
	 * 跳转到求职意向页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/infos")
	public String infos(Info info, Page page, ModelMap model) {
		page.setMaxRows(5);
		List<Info> list = infoService.queryByInfo(info);
		page = PageUtils.getPage(page, list);
		List<Info> infoList = infoService.queryByList(page, info);
		model.put("page", page);
		model.put("infoList", infoList);
		model.put("info", info);
		return "front/infos";
	}

	/**
	 * 跳转到发布求职意向页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/publishInfosPage")
	public String publishInfosPage() {
		return "front/publish_infos";
	}

	@RequestMapping(value = "/publishInfos")
	public String publishInfos(Info info, ModelMap model,HttpSession session) {
		User u = (User) session.getAttribute("user");
		if (null == u) {
			model.put("mes", "请登录");
			return "front/login";
		}
		info.setInfoUserid(u.getId());
		info.setInfoTime(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		info.setInfoType(1);
		infoService.save(info);
		model.put("mes", "发布成功");
		return "front/publish_infos";
	}

	/**
	 * 跳转到信箱页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/mail")
	public String mail(Letter letter, Page page, ModelMap model,HttpSession session) {
		User u = (User) session.getAttribute("user");
		if (null == u) {
			model.put("mes", "请登录");
			return "front/login";
		}
		letter.setLetterReceive(u.getId());
		page.setMaxRows(5);
		List<Letter> list = letterService.queryByLetter(letter);
		page = PageUtils.getPage(page, list);
		List<Letter> letterList = letterService.queryByList(page, letter);
		model.put("page", page);
		model.put("letterList", letterList);
		model.put("letter", letter);
		return "front/mail";
	}
	/**
	 * 查看信息内容
	 * @return
	 */
	@RequestMapping(value = "/mailDetail")
	public String mailDetail(Letter letter, ModelMap model) {
		letter = letterService.queryById(letter.getId());
		letter.setLetterStatus(2);
		letterService.update(letter);
		model.put("letter", letter);
		return "front/mail_detail";
	}

	/**
	 * 跳转到招聘信息页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/recruitment")
	public String recruitment(ModelMap model) {
		List<Job> jobList = jobService.queryAll();
		model.put("jobList", jobList);
		return "front/recruitment";
	}

	/**
	 * 搜索职位信息
	 * 
	 * @return
	 */
//	@RequestMapping(value = "/searchJob")
//	public String searchJob(@RequestParam("jobName") String jobName, ModelMap model) {
//		List<Job> jobList = jobService.queryJobByName(jobName);
//		model.put("jobList", jobList);
//		return "front/recruitment";
//	}

//	@RequestMapping(value = "/searchJob")
//	public String searchJob(@RequestParam(value = "jobName", required = false) String jobName,
//							@RequestParam(value = "jobXlyq", required = false) String jobXlyq,
//							ModelMap model) {
//		// 调用 service 层方法，根据职位名称和学历要求进行查询
//		List<Job> jobList = jobService.queryJobByName(jobName, jobXlyq);
//		model.put("jobList", jobList);
//		return "front/recruitment";  // 返回前端页面
//	}
	@RequestMapping(value = "/searchJob")
	public String searchJob(@RequestParam("jobName") String jobName,
							@RequestParam("jobXlyq") String jobXlyq,
							@RequestParam("salaryRange") String salaryRange,
							ModelMap model)

	{

		List<Job> jobList = jobService.queryJobByName(jobName, jobXlyq, salaryRange);

		model.put("jobList", jobList);
		return "front/recruitment";
	}

	
	/**
	 * 根据分类查询职位信息
	 * 
	 * @return
	 */
	@RequestMapping(value = "/searchJobByType")
	public String searchJobByType(@RequestParam("jobType") String jobType, ModelMap model) {
		List<Job> jobList = jobService.queryJobByType(jobType);
		model.put("jobList", jobList);
		model.put("jobType", jobType);
		return "front/recruitment";
	}

	/**
	 * 查看职位详情
	 * 
	 * @return
	 */
	@RequestMapping(value = "/jobDetail")
	public String jobDetail(Job job, ModelMap model) {
		job = jobService.queryById(job.getId());
		model.put("job", job);
		return "front/job_detail";
	}

	/**
	 * 职位沟通
	 * 
	 * @return
	 */
	@RequestMapping(value = "/chat")
	public String chat(Job job, HttpSession session, ModelMap model) {
		User u = (User) session.getAttribute("user");
		if (null == u) {
			model.put("mes", "请登录");
			return "front/login";
		}
		job = jobService.queryById(job.getId());
		Letter letter = new Letter();
		letter.setLetterSend(u.getId());
		Company company = companyService.queryById(job.getCompanyId());
		letter.setLetterReceive(userService.queryById(company.getCompanyUserid()).getId());
		model.put("letter", letter);
		return "front/chat";
	}

	/**
	 * 发送信息
	 * 
	 * @return
	 */
	@RequestMapping(value = "/sendMsg")
	public String sendMsg(Letter letter,HttpSession session, ModelMap model) {
		User u = (User) session.getAttribute("user");
		if (null == u) {
			model.put("mes", "请登录");
			return "front/login";
		}
		letter.setLetterStatus(1);
		letterService.save(letter);
		model.put("mes", "发送成功");
		return "front/chat";
	}
	
	@RequestMapping(value = "/replyMsg")
	public String replyMsg(Letter letter,HttpSession session, ModelMap model) {
		User u = (User) session.getAttribute("user");
		if (null == u) {
			model.put("mes", "请登录");
			return "front/login";
		}
		letter.setLetterSend(u.getId());;
		return "front/chat";
	}

	/**
	 * 职位投递简历
	 * 
	 * @return
	 */
	@RequestMapping(value = "/send")
	public String send(Job job, HttpSession session, ModelMap model) {
		User u = (User) session.getAttribute("user");
		if (null == u) {
			model.put("mes", "请登录");
			return "front/login";
		}
		Seeker seeker = seekerService.queryByUser(u.getId());
		if (null == seeker) {
			model.put("mes", "请完善个人信息");
			return "userInfo";
		}
		job = jobService.queryById(job.getId());
		if(resumeService.check(job.getId(), seeker.getId())){
			model.put("mes", "不能重复投递");
			return "forward:jobDetail";
		}
		Resume resume = new Resume();
		resume.setJobId(job.getId());
		resume.setCompanyId(job.getCompany().getId());;
		resume.setSeekerId(seeker.getId());;
		resume.setResumeName(seeker.getSeekerResume());
		resume.setResumeStatus(1);
		resumeService.save(resume);
		model.put("mes", "投递完成");
		return "forward:jobDetail";
	}

	/**
	 * 跳转到简历模板页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/resumes")
	public String resumes() {
		return "front/resumes";
	}

	/**
	 * 前台登录
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login")
	public String login(User user, HttpSession session, ModelMap model, @RequestParam(value = "ignoreError", required = false) String ignoreError) {
		User u = userService.login(user);
		if (null != u && u.getUserRole() != 3) {
			session.setAttribute("user", u);
			return "front/index";
		} else {
			// 只在未忽略错误时放入错误信息
			if (ignoreError == null) {
				model.put("mes", "用户名或密码错误");
			}
			return "front/login";
		}
	}


	/**
	 * 前台退出登录
	 * 
	 * @return
	 */
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session, ModelMap model) {
		session.removeAttribute("user");
		model.put("mes", "已退出登录");
		return "front/login";
	}

	/**
	 * 前台注册
	 * 
	 * @return
	 */
	@RequestMapping(value = "/register")
	public String register(User user, ModelMap model) {
		boolean res = userService.check(user.getUserName());
		if (res) {
			model.put("mes", "用户名已存在");
			return "front/register";
		} else {
			userService.save(user);
			model.put("mes", "注册成功，请登录");
			return "front/login";
		}
	}

	/**
	 * 跳转到用户信息管理
	 * 
	 * @return
	 */
	@RequestMapping(value = "/userInfo")
	public String userInfo(Seeker seeker, HttpSession session, ModelMap model) {
		User u = (User) session.getAttribute("user");
		if (null == u) {
			model.put("mes", "请登录");
			return "front/login";
		}
		seeker = seekerService.queryByUser(u.getId());
		model.put("seeker", seeker);
		return "front/user_info";
	}

	/**
	 * 更新用户信息
	 * 
	 * @return
	 */
	@RequestMapping(value = "/updateUserInfo")
	public String updateUserInfo(Seeker seeker,@RequestParam("userImage") MultipartFile userImage,HttpServletRequest request, HttpSession session, ModelMap model) {
		User u = (User) session.getAttribute("user");
		if (null == u) {
			model.put("mes", "请登录");
			return "front/login";
		}
		try {
			if (userImage.getSize() != 0) {
				seeker.setSeekerImag(UploadUtils.upload(request, userImage, "/pic"));
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		seeker.setSeekerUserid(u.getId());
		if (seeker.getId() == null || seeker.getId() == 0) {
			seekerService.save(seeker);
		} else {
			seekerService.update(seeker);
		}
		model.put("mes", "更新成功");
		return "front/user_info";
	}

	/**
	 * 跳转到企业信息管理
	 * 
	 * @return
	 */
	@RequestMapping(value = "/companyInfo")
	public String companyInfo(Company company, HttpSession session, ModelMap model) {
		User u = (User) session.getAttribute("user");
		if (null == u) {
			model.put("mes", "请登录");
			return "front/login";
		}
		company = companyService.queryByUser(u.getId());
		model.put("company", company);
		return "front/company_info";
	}

	/**
	 * 更新企业信息
	 * 
	 * @return
	 */
	@RequestMapping(value = "/updateCompanyInfo")
	public String updateCompanyInfo(Company company,@RequestParam("logo") MultipartFile logo,HttpServletRequest request, HttpSession session, ModelMap model) {
		User u = (User) session.getAttribute("user");
		if (null == u) {
			model.put("mes", "请登录");
			return "front/login";
		}
		try {
			if (logo.getSize() != 0) {
				company.setCompanyLogo(UploadUtils.upload(request, logo, "/pic"));
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		company.setCompanyUserid(u.getId());
		if (company.getId() == null || company.getId() == 0) {
			companyService.save(company);
		} else {
			companyService.update(company);
		}
		model.put("mes", "更新成功");
		return "front/company_info";
	}

	/**
	 * 跳转到个人中心页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/userCenter")
	public String userCenter(HttpSession session, ModelMap model) {
		User u = (User) session.getAttribute("user");
		if (null == u) {
			model.put("mes", "请登录");
			return "front/login";
		}
		return "front/user_center";
	}
	/**
	 * 已收到/已投递简历管理
	 * @return
	 */
	@RequestMapping(value = "/resumeManage")
	public String resumeManage(HttpSession session, ModelMap model) {
		User u = (User) session.getAttribute("user");
		if (null == u) {
			model.put("mes", "请登录");
			return "front/login";
		}
		//求职者
		if(u.getUserRole().equals(1)) {
			Seeker seeker = seekerService.queryByUser(u.getId());
			List<Resume> resumeList = resumeService.queryBySeeker(seeker.getId());
			model.put("resumeList", resumeList);
		}
		//招聘者
		else if(u.getUserRole().equals(2)) {
			Company company = companyService.queryByUser(u.getId());
			List<Resume> resumeList = resumeService.queryByCompany(company.getId());
			model.put("resumeList", resumeList);
		}
		return "front/resume_manage";
	}
	
	@RequestMapping(value = "/deleteResume")
	public String deleteResume(Resume resume){
		resumeService.deleteById(resume.getId());;
		return "redirect:resumeManage";
	}
	
	@RequestMapping(value = "/resumeDetail")
	public String resumeDetail(Resume resume, HttpSession session, ModelMap model) {
		User u = (User) session.getAttribute("user");
		if (null == u) {
			model.put("mes", "请登录");
			return "front/login";
		}
		resume = resumeService.queryById(resume.getId());
		if(u.getUserRole().equals(2) && resume.getResumeStatus().equals(1)) {
			resume.setResumeStatus(2);
			resumeService.update(resume);
		}
		model.put("resume", resume);
		return "front/resume_detail";
	}

	/**
	 * 跳转到发布职位信息页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/publishJobPage")
	public String publishJobPage() {
		return "front/publish_job";
	}

	/**
	 * 发布职位信息
	 * 
	 * @return
	 */
	@RequestMapping(value = "/publishJob")
	public String publishJob(Job job,HttpSession session, ModelMap model) {
		User u = (User) session.getAttribute("user");
		if (null == u) {
			model.put("mes", "请登录");
			return "front/login";
		}
		Company company = companyService.queryByUser(u.getId());
		if (null == company) {
			model.put("mes", "请完善公司信息");
			return "front/company_info";
		}
		job.setJobStatus(1);
		job.setCompanyId(company.getId());
		jobService.save(job);
		model.put("mes", "发布成功");
		return "front/publish_job";
	}

	/**
	 * 跳转到修改密码页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/updatePwdPage")
	public String updatePwdPage() {
		return "front/update_pwd";
	}

	/**
	 * 修改密码
	 * 
	 * @return
	 */
	@RequestMapping(value = "/updatePwd")
	public String updatePwd(@RequestParam("oldPass") String oldPass,
							@RequestParam("newPass") String newPass,
							HttpSession session, ModelMap model) {
		User u = (User) session.getAttribute("user");
		if (null == u) {
			model.put("mes", "请登录");
			return "front/login";
		}
		if (!oldPass.equals(u.getUserPass())) {
			model.put("mes", "原密码错误");
			return "front/update_pwd";
		}
		u.setUserPass(newPass);
		userService.update(u);;
		session.setAttribute("user", u);
		model.put("mes", "修改成功");
		return "front/update_pwd";
	}

	/**
	 * 查看已发布的求职意向
	 * 
	 * @return
	 */
	@RequestMapping(value = "/userInfosPage")
	public String userInfosPage(HttpSession session, ModelMap model) {
		User u = (User) session.getAttribute("user");
		if (null == u) {
			model.put("mes", "请登录");
			return "front/login";
		}
		List<Info> infoList = infoService.queryByUser(u.getId());
		model.put("infoList", infoList);
		return "front/user_infos";
	}

	/**
	 * 删除已发布的求职意向
	 * 
	 * @return
	 */
	@RequestMapping(value = "/deleteInfos")
	public String deleteInfos(Info info) {
		infoService.deleteById(info.getId());
		return "redirect:userInfosPage";
	}

	/**
	 * 查看已发布的职位信息
	 * 
	 * @return
	 */
	@RequestMapping(value = "/userRecruitmentPage")
	public String userRecruitmentPage(HttpSession session, ModelMap model) {
		User u = (User) session.getAttribute("user");
		if (null == u) {
			model.put("mes", "请登录");
			return "front/login";
		}
		Company c = companyService.queryByUser(u.getId());
		if (null == c) {
			model.put("mes", "请完善公司信息");
			return "front/company_info";
		}
		List<Job> jobList = jobService.queryByCompany(c.getId());
		model.put("jobList", jobList);
		return "front/user_recruitment";
	}

	/**
	 * 结束职位招聘
	 * 
	 * @return
	 */
	@RequestMapping(value = "/finishJob")
	public String finishJob(Job job) {
		job = jobService.queryById(job.getId());
		job.setJobStatus(2);
		jobService.update(job);;
		return "redirect:userRecruitmentPage";
	}
	
}
