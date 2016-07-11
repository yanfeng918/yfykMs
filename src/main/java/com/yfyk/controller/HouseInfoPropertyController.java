package com.yfyk.controller;


import com.yfyk.bean.Pager;
import com.yfyk.dto.request.GetHouseInfoPropertyListRequest;
import com.yfyk.entity.Community;
import com.yfyk.entity.HouseInfoProperty;
import com.yfyk.service.AgentService;
import com.yfyk.service.CommunityService;
import com.yfyk.service.HouseInfoPropertyService;
import com.yfyk.utils.DateUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;


/**
 * Controller - 有效房源
 */
@Controller
@RequestMapping("/houseInfoProperty")
public class HouseInfoPropertyController {

    @Autowired
    private AgentService agentService;

    @Autowired
    private HouseInfoPropertyService houseInfoPropertyService;

    @Autowired
    private CommunityService communityService;

    public static StringBuffer resultBuffer;

    public static StringBuffer buffer;

    public static boolean isDone;



    @RequestMapping(value="/list")
    public String home(Model model, GetHouseInfoPropertyListRequest request) {
        Pager<HouseInfoProperty> list = houseInfoPropertyService.list(request);
        model.addAttribute("pager", list);
        return "/houseInfo/list";
    }


    @RequestMapping(value = "/uploadPage")
    public String uploadPage(ModelMap model){
        return "/houseInfoProperty/upload";
    }

    /**
     *
     * @param filFile
     * @param request
     * @param model
     * @return 如果小区的名称查询不到，那么【小区对应的区域id就是792】
     */
    @RequestMapping(value = "/upload.do")
    public String upload(@RequestParam(value = "filFile", required = false) MultipartFile filFile, HttpServletRequest request, ModelMap model) {
        String beginDate = request.getParameter("beginDate");

        if(filFile.isEmpty()){
            model.addAttribute("errInfo", "请选择文件");
            return "/houseInfoProperty/upload";
        }
        String path = request.getSession().getServletContext().getRealPath("upload");
        String fileName = filFile.getOriginalFilename();
        //上传文件
        File targetFile = new File("/upload/", fileName);
        if (!targetFile.exists())
            targetFile.mkdirs();
        //保存
        try {
            filFile.transferTo(targetFile);
            isDone = false;
            StringBuffer buffer = importUserHouseInfo(targetFile, Long.parseLong(792+""),DateUtils.parse(beginDate));
            isDone = true;
            model.addAttribute("result",resultBuffer.toString());
            model.addAttribute("log",buffer.toString());
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errInfo", "上传失败");
            return "/houseInfoProperty/upload";
        }
        return "/houseInfoProperty/upload";
    }

    public StringBuffer importUserHouseInfo(File file, long areaId,Date createDate){
        try {
            resultBuffer = new StringBuffer();
            buffer = new StringBuffer();
            InputStream is = new FileInputStream(file);
            HSSFWorkbook houseInfoWBook = new HSSFWorkbook(is);
            HouseInfoProperty houseInfo = null;
            int errCount=0;
            int successCount=0;
            int localExistCount=0;
            int remoteExistCount=0;
            int agentCount=0;
            for (int i = 0; i < houseInfoWBook.getNumberOfSheets(); i++) {
                HSSFSheet sheet = houseInfoWBook.getSheetAt(i);
                if (sheet == null) {
                    continue;
                }
                for (int index = 1; index <= sheet.getLastRowNum(); index++) {
                    HSSFRow row = sheet.getRow(index);
					try {
						if (row != null) {
							houseInfo = new HouseInfoProperty();
                            houseInfo.setCreateDate(createDate);
							// mobile 联系号码[6列]
							HSSFCell cell = row.getCell(5);
							String mobile="";
							if (cell!=null) {
								row.getCell(5).setCellType(Cell.CELL_TYPE_STRING);
								String value = cell.getStringCellValue().trim();
								if (!value.equals("")) {
									if (value.indexOf(" ")!=-1) {
										houseInfo.setMobile(value.split(" ")[0]);
										mobile=value.split(" ")[0];
									}else {
										houseInfo.setMobile(value);
										mobile=value;
									}
								}
							}else {
								//手机号为空
								continue;
							}

							if (agentService.isAgent(mobile)) {
								buffer.append("*********第"+index+"行取消导入:经纪人号码\n");
								agentCount++;
								continue;
							}
                            //6-->ban楼栋号[2列]
                            if (row.getCell(1)!=null) {
                                row.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
                                if (!(row.getCell(1).getStringCellValue().trim().equals(""))) {
                                    houseInfo.setBan(row.getCell(1).getStringCellValue().trim());
                                }else {
                                    houseInfo.setBan("");
                                }
                            }else {
                                houseInfo.setBan("");
                            }
                            //房间号
                            if (row.getCell(2)!=null) {
                                row.getCell(2).setCellType(Cell.CELL_TYPE_STRING);
                                if (!row.getCell(2).getStringCellValue().trim().equals("")) {
                                    houseInfo.setRoomNumber(row.getCell(2).getStringCellValue().trim());
                                }else {
                                    houseInfo.setRoomNumber("");
                                }
                            }else {
                                houseInfo.setRoomNumber("");
                            }
                            //判断是否重复
							if (houseInfoPropertyService.isHouseExist(houseInfo.getMobile(),houseInfo.getBan(),houseInfo.getRoomNumber())) {
								buffer.append("*********第"+index+"行取消导入:重复\n");
								localExistCount++;
								continue;
							}
							//4-->community` 小区[1列]
							if (row.getCell(0)!=null) {
								row.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
								houseInfo.setCommunity(row.getCell(0).getStringCellValue().trim());
							}

							houseInfo.setAreaId((int)areaId);
                            //处理小区名称
                            Community community = communityService.findByName(houseInfo.getCommunity());
                            if (community!=null){
                                houseInfo.setAreaId(community.getAreaId());
                            }
                            houseInfoPropertyService.add(houseInfo);
							buffer.append("*********第"+index+"行导入成功***************\n");
							successCount++;
						}
					}
					catch (Exception e) {
						e.printStackTrace();
						buffer.append("*********第"+index+"行导入失败***************\n");
						buffer.append("原因--"+e.getMessage()+"\n");
						errCount++;
						continue;
					}
                }
            }
            resultBuffer.append("成功"+successCount+"---失败"+errCount+"\n");
            resultBuffer.append("本地存在--"+localExistCount+"\n");
            resultBuffer.append("经纪人号码--"+agentCount+"\n");
//          resultBuffer.append("待审核量--"+(successCount-remoteExistCount)+"\n");
            return buffer;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }

    @RequestMapping(value = "/getBuffer", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, String> getBuffer() {
        if(buffer==null){
            return null;
        }
        Map<String, String> map = new HashMap<String, String>();
        map.put("status", isDone?"true":"false");
        map.put("result", buffer.toString());
        return map;
    }

	
}