package ssm_test.Service;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import ssm_test.Controller.Scientific_research_project;
import ssm_test.Entity.Research_projects;

import java.util.List;

public interface Scientific_research_project_service {
    /**
     * 科研项目申报 insert操作
     * @return
     */
    int declare(String project_number, String project_name, String project_leader, String category, String subject, float budget, String start_date, String end_date, byte[] application_file, String approval_status, String reporting_of_results);

    /**
     * 查看所有已经申报的数据
     * @return
     */
    List<Research_projects> declare_list();

    /**
     * 根据id查询已经申报的项目
     * @param id
     * @return
     */
    Research_projects find_by_id_research_projects(int id);


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
    int declare_edit(int id, String project_number, String project_name, String project_leader, String category, String subject, float budget, String start_date, String end_date, byte[] application_file, String approval_status, String reporting_of_results);

    /**
     * 删除已经申报的数据
     * @param id
     * @return
     */
    int declare_delete(int id);

    /**
     * 按项目名称查找 项目
     * @param project_name
     * @return
     */
    List<Research_projects> find_by_project_name_project(String project_name);
}
