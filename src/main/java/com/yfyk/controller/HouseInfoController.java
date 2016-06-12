//package com.yfyk.controller;
//
//import com.yjbadmin.admin.entity.Admin;
//import com.yjbadmin.bean.Message;
//import com.yjbadmin.bean.Pager;
//import com.yjbadmin.bean.SystemContext;
//import com.yjbadmin.collection.entity.CollectionHouseInfo;
//import com.yjbadmin.collection.service.ICollectionHouseInfoService;
//import com.yjbadmin.common.entity.Area;
//import com.yjbadmin.common.service.AreaService;
//import com.yjbadmin.finance.entity.Expenses;
//import com.yjbadmin.finance.entity.Income;
//import com.yjbadmin.finance.service.IExpensesService;
//import com.yjbadmin.finance.service.IIncomeService;
//import com.yjbadmin.houseinfo.entity.Agent;
//import com.yjbadmin.houseinfo.entity.HouseInfo;
//import com.yjbadmin.houseinfo.entity.HouseInfo.HouseInfo_STATUS;
//import com.yjbadmin.houseinfo.entity.HouseInfo.HouseInfo_SaleWay;
//import com.yjbadmin.houseinfo.entity.HouseInfo2;
//import com.yjbadmin.houseinfo.service.IHouseInfoService;
//import com.yjbadmin.member.entity.Member;
//import com.yjbadmin.member.service.MemberService;
//import com.yjbadmin.utils.DateUtils;
//import org.apache.commons.lang.StringUtils;
//import org.apache.http.HttpEntity;
//import org.apache.http.HttpHost;
//import org.apache.http.HttpResponse;
//import org.apache.http.auth.AuthScope;
//import org.apache.http.auth.UsernamePasswordCredentials;
//import org.apache.http.client.AuthCache;
//import org.apache.http.client.ClientProtocolException;
//import org.apache.http.client.HttpClient;
//import org.apache.http.client.methods.HttpGet;
//import org.apache.http.client.methods.HttpPost;
//import org.apache.http.client.protocol.ClientContext;
//import org.apache.http.impl.auth.BasicScheme;
//import org.apache.http.impl.client.BasicAuthCache;
//import org.apache.http.impl.client.DefaultHttpClient;
//import org.apache.http.protocol.BasicHttpContext;
//import org.apache.http.util.EntityUtils;
//import org.apache.log4j.Logger;
//import org.apache.poi.hssf.usermodel.HSSFCell;
//import org.apache.poi.hssf.usermodel.HSSFRow;
//import org.apache.poi.hssf.usermodel.HSSFSheet;
//import org.apache.poi.hssf.usermodel.HSSFWorkbook;
//import org.apache.poi.ss.usermodel.Cell;
//import org.apache.poi.xssf.usermodel.XSSFCell;
//import org.apache.poi.xssf.usermodel.XSSFRow;
//import org.apache.poi.xssf.usermodel.XSSFSheet;
//import org.apache.poi.xssf.usermodel.XSSFWorkbook;
//import org.apache.shiro.SecurityUtils;
//import org.springframework.beans.BeanUtils;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.ModelMap;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import javax.annotation.Resource;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import java.io.*;
//import java.util.*;
//
///**
// * Controller - 地区
// */
//@Controller
//@RequestMapping("/auth/houseInfo")
//public class HouseInfoController {
//
//
//
//
//	public static StringBuffer resultBuffer;
//
//	public static StringBuffer buffer;
//
//	public static boolean isDone;
//
//
//	private static Logger logger = Logger.getLogger(HouseInfoController.class);
//
//
//	/**
//	 * 列表
//	 */
//	@RequestMapping(value = "/list", method = RequestMethod.GET)
//	public String list(ModelMap model, String status, String beginDate, String endDate, String mobile, String community, String areaId, String memberName) {
//		String hql="select h from HouseInfo h left join h.area a left join h.member m  where 1=1 ";
//		//判断时间条件是否存在
//		SystemContext.setSort("h.createDate");
//		SystemContext.setOrder("desc");
//		if (!StringUtils.isEmpty(beginDate)) {
//			model.addAttribute("beginDate", beginDate);
//			hql += " and h.createDate>'" + beginDate + " 00:00:00' ";
//		}
//		if (!StringUtils.isEmpty(endDate)) {
//			model.addAttribute("endDate", endDate);
//			hql += " and h.createDate<'" + endDate + " 23:59:59' ";
//		}
//		if (!StringUtils.isEmpty(mobile)) {
//			hql += " and h.mobile='" + mobile+"'";
//		}
//		if (!StringUtils.isEmpty(community)) {
//			model.addAttribute("community", community);
//			hql += " and h.community='" + community+"'";
//		}
//		if (!StringUtils.isEmpty(memberName)) {
//			model.addAttribute("memberName", memberName);
//			hql += " and m.username='" + memberName+"'";
//		}
//		if(!StringUtils.isEmpty(areaId)){
//			hql+=" and (a.id="+areaId+" or a.treePath like '%"+areaId+"%')";
//			Area area=areaService.get(Long.parseLong(areaId));
//			model.addAttribute("area",area);
//		}
//		if(StringUtils.isEmpty(status)){
//			Pager<HouseInfo> pager = houseInfoService.find(hql);
//			model.addAttribute("pager", pager);
//		}else{
//			hql += " and h.status=?";
//			Object[] obj =new Object[1];
//			if(status.equals("APPLY")){
//				obj[0]=HouseInfo.HouseInfo_STATUS.APPLY;
//			}else if(status.equals("CHECKING")){
//				obj[0]=HouseInfo.HouseInfo_STATUS.CHECKING;
//			}else if(status.equals("FAIL")){
//				obj[0]=HouseInfo.HouseInfo_STATUS.FAIL;
//			}else if(status.equals("SUCCESS")){
//				obj[0]=HouseInfo.HouseInfo_STATUS.SUCCESS;
//			} else if (status.equals("CHECKING_DISCON1")) {
//				obj[0] = HouseInfo.HouseInfo_STATUS.CHECKING_DISCON1;
//			} else if (status.equals("CHECKING_DISCON2")) {
//				obj[0] = HouseInfo.HouseInfo_STATUS.CHECKING_DISCON2;
//			}
//
//			Pager<HouseInfo> pager = houseInfoService.find(hql, obj);
//			model.addAttribute("pager", pager);
//			model.addAttribute("status", status);
//		}
//
//		return "/houseInfo/list";
//
//	}
//
//	/**
//	 * 查看
//	 */
//	@RequestMapping(value = "/view", method = RequestMethod.GET)
//	public String view(Long id, ModelMap model) {
//		model.addAttribute("houseInfo", houseInfoService.get(id));
//		return "/houseInfo/view";
//	}
//
//
//
//	@RequestMapping("exportExcel")
//	public void exportExcel(HttpServletRequest request, HttpServletResponse response, String beginDate, String endDate,String status,String areaId) {
//		//查询数据生成excel导出
//		String hql = "select h from HouseInfo h left join h.area a where 1=1 ";
//		SystemContext.setSort("h.createDate");
//		SystemContext.setOrder("desc");
//		//判断时间条件是否存在
//		if (!StringUtils.isEmpty(beginDate)) {
//			hql += " and h.createDate>'" + beginDate + " 00:00:00' ";
//		}
//		if (!StringUtils.isEmpty(endDate)) {
//			hql += " and h.createDate<'" + endDate + " 23:59:59' ";
//		}
//		if(!StringUtils.isEmpty(areaId)){
//			hql+=" and (a.id="+areaId+" or a.treePath like '%"+areaId+"%')";
//		}
//		List<HouseInfo> list=new ArrayList<HouseInfo>();
//		if (StringUtils.isEmpty(status)) {
//			list=houseInfoService.list(hql);
//		} else {
//			hql += " and h.status=?";
//			Object[] obj = new Object[1];
//			if (status.equals("APPLY")) {
//				obj[0] = HouseInfo.HouseInfo_STATUS.APPLY;
//			} else if (status.equals("CHECKING")) {
//				obj[0] = HouseInfo.HouseInfo_STATUS.CHECKING;
//			} else if (status.equals("FAIL")) {
//				obj[0] = HouseInfo.HouseInfo_STATUS.FAIL;
//			} else if (status.equals("SUCCESS")) {
//				obj[0] = HouseInfo.HouseInfo_STATUS.SUCCESS;
//			} else if (status.equals("CHECKING_DISCON1")) {
//				obj[0] = HouseInfo.HouseInfo_STATUS.CHECKING_DISCON1;
//			} else if (status.equals("CHECKING_DISCON2")) {
//				obj[0] = HouseInfo.HouseInfo_STATUS.CHECKING_DISCON2;
//			}
//			list = houseInfoService.list(hql, obj);
//		}
//
//
//		HttpSession session = request.getSession();
//		session.setAttribute("state", null);
//		// 生成提示信息，
//		response.setContentType("application/vnd.ms-excel");
//		String codedFileName = null;
//		OutputStream fOut = null;
//		try {
//			// 进行转码，使其支持中文文件名
//			codedFileName = java.net.URLEncoder.encode(DateUtils.getToday()+"导出", "UTF-8");
//			response.setHeader("content-disposition", "attachment;filename=" + codedFileName + ".xlsx");
//			// 产生工作簿对象
//			XSSFWorkbook workbook = new XSSFWorkbook();
//			//产生工作表对象
//			XSSFSheet sheet = workbook.createSheet();
//			//产生表头
//			String[] headers={"会员账号","创建日期","地区","地址","小区","信息价格","状态","备注"};
//			XSSFRow rowHeader= sheet.createRow((int) 0);//创建一行
//			for (int i=0;i<headers.length;i++){
//				XSSFCell cellHeader = rowHeader.createCell((int) i);//创建一列
//				cellHeader.setCellType(HSSFCell.CELL_TYPE_STRING);
//				cellHeader.setCellValue(headers[i]);
//			}
//			for (int i = 1; i <=list.size(); i++) {
//				XSSFRow row = sheet.createRow((int) i);//创建一行
//				for (int j = 0; j < headers.length; j++) {
//					XSSFCell cell = row.createCell((int) j);//创建一列
//					cell.setCellType(HSSFCell.CELL_TYPE_STRING);
//					try {
//						switch (j) {
//						case 0:
//							cell.setCellValue(list.get(i - 1).getMember().getUsername());
//							break;
//						case 1:
//							cell.setCellValue(list.get(i - 1).getCreateDate().toString());
//							break;
//						case 2:
//							cell.setCellValue(list.get(i - 1).getArea().getFullName());
//							break;
//						case 3:
//							cell.setCellValue(list.get(i - 1).getAddress());
//							break;
//						case 4:
//							cell.setCellValue(list.get(i - 1).getCommunity());
//							break;
//						case 5:
//							cell.setCellValue(list.get(i - 1).getInfoPrice());
//							break;
//						case 6:
//							cell.setCellValue(list.get(i - 1).getStatus().getOutername());
//							break;
//						case 7:
//							cell.setCellValue(list.get(i - 1).getCheckContent());
//							break;
//						}
//					}catch (Exception e){
//						cell.setCellValue("");
//					}
//				}
//			}
//			fOut = response.getOutputStream();
//			workbook.write(fOut);
//		} catch (UnsupportedEncodingException e1) {
//		} catch (Exception e) {
//		} finally {
//			try {
//				fOut.flush();
//				fOut.close();
//			} catch (IOException e) {
//			}
//			session.setAttribute("state", "open");
//		}
//		System.out.println("文件生成...");
//	}
//
//	@RequestMapping("check")
//	public void check(HttpServletRequest request, HttpServletResponse response) {
//		try {
//			if ("open".equals(request.getSession().getAttribute("state"))) {
//				request.getSession().setAttribute("state", null);
//				response.getWriter().write("true");
//				response.getWriter().flush();
//			} else {
//				response.getWriter().write("false");
//				response.getWriter().flush();
//			}
//		} catch (IOException e) {
//		}
//	}
//
//	@RequestMapping(value = "/uploadPage")
//	public String uploadPage(ModelMap model){
//		//查询城市列表
//		String ahql=" from Area where parent=null";
//		List<Area> cityList=areaService.list(ahql);
//		model.addAttribute("cityList",cityList);
//		return "/houseInfo/upload";
//	}
//
//	@RequestMapping(value = "/upload.do")
//	public String upload(@RequestParam(value = "filFile", required = false) MultipartFile filFile, HttpServletRequest request, ModelMap model) {
//		//查询城市列表
//		String ahql=" from Area where parent=null";
//		List<Area> cityList=areaService.list(ahql);
//		model.addAttribute("cityList",cityList);
//
//		if(filFile.isEmpty()){
//			model.addAttribute("errInfo", "请选择文件");
//			return "/houseInfo/upload";
//		}
//
//		String path = request.getSession().getServletContext().getRealPath("upload");
//		String fileName = filFile.getOriginalFilename();
//		String startIndex=request.getParameter("startIndex");
//		String endIndex=request.getParameter("endIndex");
//		String isChecked=request.getParameter("isChecked");
//		String cityId=request.getParameter("cityId");
//		if(cityId.isEmpty()){
//			model.addAttribute("errInfo", "请选择城市！");
//			return "/houseInfo/upload";
//		}
//
//		File targetFile = new File("/upload/", fileName);
//		if (!targetFile.exists()) {
//			targetFile.mkdirs();
//		}
//		//保存
//		try {
//			filFile.transferTo(targetFile);
//			isDone = false;
//
//			StringBuffer buffer = importUserHouseInfo(targetFile, Integer.parseInt(startIndex), Integer.parseInt(endIndex),
//					Long.parseLong(cityId), false,model);
//			isDone = true;
//			model.addAttribute("result",resultBuffer.toString());
//			model.addAttribute("log",buffer.toString());
//		} catch (Exception e) {
//			e.printStackTrace();
//			model.addAttribute("errInfo", "上传失败");
//			return "/houseInfo/upload";
//		}
//		return "/houseInfo/upload";
//	}
//
//	public StringBuffer importUserHouseInfo(File file, int startIndex, int rowNumbers, long areaId, boolean isPre,ModelMap model){
//		try {
//			resultBuffer = new StringBuffer();
//			buffer = new StringBuffer();
//			InputStream is = new FileInputStream(file);
//			HSSFWorkbook houseInfoWBook = new HSSFWorkbook(is);
//			HouseInfo houseInfo = null;
//			int errCount=0;
//			int successCount=0;
//			int localExistCount=0;
//			int remoteExistCount=0;
//			int agentCount=0;
//			for (int i = 0; i < houseInfoWBook.getNumberOfSheets(); i++) {
//				HSSFSheet sheet = houseInfoWBook.getSheetAt(i);
//				if (sheet == null) {
//					continue;
//				}
//				for (int index = startIndex; index < rowNumbers; index++) {
//					HSSFRow row = sheet.getRow(index);
//					try {
//						if (row != null) {
//							houseInfo = new HouseInfo();
//							//判断是否重复
//							//3--> mobile 联系号码[6列]
//							HSSFCell cell = row.getCell(5);
//							String mobile="";
//							if (cell!=null) {
//								row.getCell(5).setCellType(Cell.CELL_TYPE_STRING);
//								String value = cell.getStringCellValue().trim();
//								if (!value.equals("")) {
//									if (value.indexOf(" ")!=-1) {
//										houseInfo.setMobile(value.split(" ")[0]);
//										mobile=value.split(" ")[0];
//										houseInfo.setDescription(value);
//									}else {
//										houseInfo.setMobile(value);
//										mobile=value;
//									}
//								}
//							}else {
//								//手机号为空
//								continue;
//							}
//
//							if (isAgent(mobile)) {
//								buffer.append("*********第"+index+"行取消导入:经纪人号码\n");
//								agentCount++;
//								continue;
//							}
//							if (isHouseExist(mobile)) {
//								buffer.append("*********第"+index+"行取消导入:重复\n");
//								localExistCount++;
//								continue;
//							}
//							//6-->ban楼栋号[2列]
//							if (row.getCell(1)!=null) {
//								row.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
//								if (!(row.getCell(1).getStringCellValue().trim().equals(""))) {
//									houseInfo.setBan(row.getCell(1).getStringCellValue().trim());
//								}else {
//									houseInfo.setBan("");
//								}
//							}else {
//								houseInfo.setBan("");
//							}
//							//房间号
//							if (row.getCell(2)!=null) {
//								row.getCell(2).setCellType(Cell.CELL_TYPE_STRING);
//								if (!row.getCell(2).getStringCellValue().trim().equals("")) {
//									houseInfo.setRoomNumber(row.getCell(2).getStringCellValue().trim());
//								}else {
//									houseInfo.setRoomNumber("");
//								}
//							}else {
//								houseInfo.setRoomNumber("");
//							}
//							//1-->创建日期--
//
//							//4-->community` 小区[1列]
//							if (row.getCell(0)!=null) {
//								row.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
//								houseInfo.setCommunity(row.getCell(0).getStringCellValue().trim());
//							}
//							//5--> areaSize 面积[4列]
//							if (row.getCell(3)!=null&&!row.getCell(3).toString().trim().isEmpty()) {
//								row.getCell(3).setCellType(Cell.CELL_TYPE_STRING);
//								houseInfo.setAreaSize(Float.parseFloat((row.getCell(3).getStringCellValue().trim())));
//							}else {
//								houseInfo.setAreaSize(0f);
//							}
//							//`salePrice`售价[5列]
//							if (row.getCell(4)!=null) {
//								row.getCell(4).setCellType(Cell.CELL_TYPE_STRING);
//								if (!row.getCell(4).getStringCellValue().trim().isEmpty()) {
//									houseInfo.setSalePrice(Float.parseFloat(row.getCell(4).getStringCellValue().trim()));
//								}else {
//									houseInfo.setSalePrice(0f);
//								}
//							}
//							houseInfo.setStatus(HouseInfo_STATUS.APPLY);
//							houseInfo.setHouseShape("零室零厅");
//							houseInfo.setPriority(2);//设置优先级
//							houseInfo.setInfoPrice(10f);
//							if(areaId==5307){
//								houseInfo.setInfoPrice(30f);
//							}
//							houseInfo.setSaleWay(HouseInfo_SaleWay.SYSTEM);
//							houseInfo.setIsChannel(1);
//							if (row.getCell(6)!=null) {
//								row.getCell(6).setCellType(Cell.CELL_TYPE_STRING);
//								if (!row.getCell(6).getStringCellValue().trim().isEmpty()) {
//									String username=row.getCell(6).getStringCellValue().trim();
//									String sql = "SELECT * FROM t_member where username = '"+username+"'";
//									List<Member> mList =memberService.listBySql(sql, Member.class, true);
//									if (mList.size()>0) {
//										houseInfo.setMember(mList.get(0));
//									}else{
//										continue;
//									}
//								}
//							}
//							Area area = new Area();
//							area.setId(areaId);
//							houseInfo.setArea(area);
//							houseInfo.setCreateDate(new Date());
//							houseInfoService.add(houseInfo);
//							buffer.append("*********第"+index+"行导入成功***************\n");
//							successCount++;
//						}
//					}
//					catch (Exception e) {
//						e.printStackTrace();
//						buffer.append("*********第"+index+"行导入失败***************\n");
//						buffer.append("原因--"+e.getMessage()+"\n");
//						errCount++;
//						continue;
//					}
//				}
//			}
//			resultBuffer.append("成功"+successCount+"---失败"+errCount+"\n");
//			resultBuffer.append("线上存在--"+remoteExistCount+"\n");
//			resultBuffer.append("本地存在--"+localExistCount+"\n");
//			resultBuffer.append("经纪人号码--"+agentCount+"\n");
//			resultBuffer.append("待审核量--"+(successCount-remoteExistCount)+"\n");
//			return buffer;
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//		return null;
//
//	}
//
//	private boolean isAgent(String mobile){
//		return isAgentRemote(mobile)||isAgentLocal(mobile);
//	}
//
//	private boolean isAgentLocal(String mobile){
//		String sql="select * from t_agent where mobile = "+mobile;
//		List<Object> aList = houseInfoService.listBySql(sql, Agent.class, true);
//		if (aList.size()>0) {
//			return true;
//		}
//		return false;
//	}
//
//	private boolean isAgentRemote(String mobile){
//
//			String url = "http://agent.esf.fangdd.com/agent/mobile/isExist";
//			url = url.replace("mobile", mobile);
//			HttpGet request = new HttpGet(url);
//			try {
//				HttpClient httpClient=new DefaultHttpClient();
//				HttpResponse response=httpClient.execute(request);
//				String result= EntityUtils.toString(response.getEntity());
//				((Closeable) httpClient).close();
//				return result.indexOf("true")!=-1;
//			} catch (UnsupportedEncodingException e) {
//				e.printStackTrace();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//			return false;
//	}
//
//	private boolean isHouseExist(String mobile){
//		if(isHouseInfoLocal(mobile)||isHouseInfoExistRemote(mobile)){
//			return true;
//		}
//		return false;
//	}
//
//	private boolean isHouseInfoLocal(String mobile){
//		String sql="select * from t_house_info where mobile = "+mobile;
//		List<HouseInfo2> aList = houseInfoService.listBySql(sql, HouseInfo2.class, true);
//		if(aList.size()==0){
//			return false;
//		}else if(aList.size()==1){
//			HouseInfo2 h = aList.get(0);
//			if(h.getStatus()==HouseInfo2.HouseInfo_STATUS.FAIL
//					||h.getStatus()==HouseInfo2.HouseInfo_STATUS.FAIL_SOLDOUT
//					||h.getStatus()==HouseInfo2.HouseInfo_STATUS.FAIL_UNAVAILABLE){
//				return false;
//			}else{
//				return true;
//			}
//		}else{
//			return true;
//		}
//	}
//
//	public boolean isHouseInfoExistRemote(String mobile) {
//		HttpHost targetHost = new HttpHost("dean.fangdd.fdd", 80, "http");
//		DefaultHttpClient httpclient = new DefaultHttpClient();
//		httpclient.getCredentialsProvider().setCredentials(
//		new AuthScope(targetHost.getHostName(), targetHost.getPort()),
//		new UsernamePasswordCredentials("fangdd_dean", "s+YbZftGL8tl"));
//		// Create AuthCache instance
//		AuthCache authCache = new BasicAuthCache();
//		// Generate BASIC scheme object and add it to the local auth cache
//		BasicScheme basicAuth = new BasicScheme();
//		authCache.put(targetHost, basicAuth);
//		// Add AuthCache to the execution context
//		BasicHttpContext localcontext = new BasicHttpContext();
//		localcontext.setAttribute(ClientContext.AUTH_CACHE, authCache);
//
//		String url ="http://dean.fangdd.fdd/house/pb/get_phone_related_house_info/mobile";
//		url =url.replace("mobile", mobile);
//		HttpPost httpPost = new HttpPost(url);
//
//		httpPost.setHeader("Content-Type", "application/x-www-form-urlencoded");
//		String result="";
//		try {
//			HttpResponse response = httpclient.execute(targetHost, httpPost, localcontext);
//			HttpEntity entity = response.getEntity();
//			result= EntityUtils.toString(entity);
//			EntityUtils.consume(entity);
//		} catch (ClientProtocolException e) {
//			return false;
//		} catch (IOException e) {
//			return false;
//		}
//		if(!result.isEmpty()){
//			if(result.contains("\"exist\":true")&&result.contains("\"offline\":false")){
//				return true;
//			}else{
//				return false;
//			}
//		}
//		return false;
//	}
//
//	@RequestMapping(value = "/getBuffer", method = RequestMethod.GET)
//	@ResponseBody
//    public Map<String, String> getBuffer() {
//		if(buffer==null){
//			return null;
//		}
//		Map<String, String> map = new HashMap<String, String>();
//		map.put("status", isDone?"true":"false");
//		map.put("result", buffer.toString());
//		return map;
//    }
//
//}