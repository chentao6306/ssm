package ssm_test.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import ssm_test.Dao.Scientific_research_project_Dao;
import ssm_test.Entity.Research_projects;
import ssm_test.Service.Scientific_research_project_service;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Base64;
import java.util.List;


/**
 * 科研项目的相关操作 (申报、审核、合同签订、经费管理、成果汇报)等操作
 */
@Controller
@RequestMapping("/Scientific_research_project")
public class Scientific_research_project {

    @Autowired
    private Scientific_research_project_service scientific_research_project_service;


    /**
     * 科研项目申报操作
     * @param project_number
     * @param project_name
     * @param project_leader
     * @param category
     * @param subject
     * @param budget
     * @param start_date
     * @param end_date
     * @param application_file
     * @return
     * @throws IOException
     */
    @PostMapping("/declare")
    public String declare(@RequestParam("project_number") String project_number, @RequestParam("project_name") String project_name, @RequestParam("project_leader") String project_leader, @RequestParam("category") String category, @RequestParam("subject") String subject, @RequestParam("budget") float budget, @RequestParam("start_date") String start_date, @RequestParam("end_date") String end_date, @RequestParam("application_file") MultipartFile application_file, @RequestParam("approval_status") String approval_status) throws IOException {

        if (!application_file.isEmpty()){
            byte[] application_fileBytes = application_file.getBytes();
            int declare = scientific_research_project_service.declare(project_number,project_name,project_leader,category,subject, Float.parseFloat(String.valueOf(budget)),start_date,end_date,application_fileBytes,approval_status);

            if (declare >= 1){
                System.out.println("申报成功");
                return "redirect:/Scientific_research_project/declare_list"; // 上传成功后的跳转页面
            } else {
                System.out.println("申报失败");
                return null;
            }
        }

        return null;
    }


    /**
     * 查询所有申报的数据
     * @param session
     * @return
     */
    @GetMapping("/declare_list")
    public String declare_list(HttpSession session){
        List<Research_projects> research_projects = scientific_research_project_service.declare_list();
        session.setAttribute("research_projects",research_projects);
        return "redirect:/Project_declaration_list.jsp";
    }

    /**
     * 下载申请书的操作
     * @param session
     * @return
     */
    @GetMapping("/declare_img_download")
    public String declare_list(int id, HttpSession session) throws IOException {

        Research_projects by_id_research_projects = scientific_research_project_service.find_by_id_research_projects(id);
        byte[] application_file1 = by_id_research_projects.getApplication_file();

        // 通过ByteArrayInputStream将byte数组包装为输入流：
        ByteArrayInputStream bis = new ByteArrayInputStream(application_file1);

        // 通过ImageIO类将输入流转换为BufferedImage对象
        BufferedImage bImage = ImageIO.read(bis);

        // 将BufferedImage对象写入到本地文件中
        File outputfile = new File("image.jpg");
        ImageIO.write(bImage, "jpg", outputfile);

        // 将字节数组转换成 Base64 字符串
        String base64String = Base64.getEncoder().encodeToString(application_file1);


        return "redirect:/Project_declaration_list.jsp";


    }

    /**
     * 编辑操作之前的数据回显
     * @param id
     * @param session
     * @return
     */
    @GetMapping("/declare_find_by_id")
    public String declare_find_by_id(int id, HttpSession session){
        Research_projects by_id_research_projects = scientific_research_project_service.find_by_id_research_projects(id);
        session.setAttribute("by_id_research_projects",by_id_research_projects);
        return "redirect:/Project_declaration_edit.jsp";
    }


    /**
     * 修改已经申报的数据
     * @param project_number
     * @param project_name
     * @param project_leader
     * @param category
     * @param subject
     * @param budget
     * @param start_date
     * @param end_date
     * @param application_file
     * @param approval_status
     * @return
     */
    @PostMapping("/declare_edit")
    public String declare_edit(@RequestParam("id") int id, @RequestParam("project_number") String project_number, @RequestParam("project_name") String project_name, @RequestParam("project_leader") String project_leader, @RequestParam("category") String category, @RequestParam("subject") String subject, @RequestParam("budget") float budget, @RequestParam("start_date") String start_date, @RequestParam("end_date") String end_date, @RequestParam("application_file") MultipartFile application_file, @RequestParam("approval_status") String approval_status) throws IOException {
        if (!application_file.isEmpty()){
            byte[] application_file_byte = application_file.getBytes();

            int i = scientific_research_project_service.declare_edit(id,project_number, project_name, project_leader, category, subject, budget, start_date, end_date, application_file_byte, approval_status);
            if (i >= 1){
//                System.out.println("修改申报成功");
                return "redirect:/Scientific_research_project/declare_list";
            } else {
                System.out.println("修改申报失败");
                return "修改申报失败";
            }
        }
        return null;
    }

    /**
     * 删除已经申报的数据
     * @param id
     * @return
     */
    @GetMapping("/declare_delete")
    public String declare_delete(int id){
        System.out.println("删除id" + id);
        int declare_delete = scientific_research_project_service.declare_delete(id);
        if (declare_delete >= 1){
//            System.out.println("删除成功");
            return "redirect:/Scientific_research_project/declare_list";
        } else {
            System.out.println("删除失败");
            return null;
        }
    }

    /**
     * 根据项目名称搜索项目
     * @param project_name
     * @return
     * @throws UnsupportedEncodingException
     */
    @GetMapping("/declare_select")
    public String declare_select(String project_name, HttpSession session) throws UnsupportedEncodingException {
        project_name = new String(project_name.getBytes("ISO-8859-1"), "UTF-8");
        List<Research_projects> by_project_name_project = scientific_research_project_service.find_by_project_name_project(project_name);
        session.setAttribute("by_project_name_project", by_project_name_project);

        return "redirect:/Project_declaration_select.jsp";
    }


}
