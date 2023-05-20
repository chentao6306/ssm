package ssm_test.Service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import ssm_test.Controller.Scientific_research_project;
import ssm_test.Dao.Scientific_research_project_Dao;
import ssm_test.Entity.Research_projects;
import ssm_test.Service.Scientific_research_project_service;

import java.util.List;


@Service
public class Scientific_research_project_service_Impl implements Scientific_research_project_service {

    // 科研项目操作的dao
    @Autowired
    private Scientific_research_project_Dao scientific_research_project_dao;

    /**
     * 科研项目申报 insert操作
     *
     * @return
     */
    @Override
    public int declare(String project_number, String project_name, String project_leader, String category, String subject, float budget, String start_date, String end_date, byte[] application_file, String approval_status) {
        //at ssm_test.Service.Impl.Scientific_research_project_service_Impl.declare(Scientific_research_project_service_Impl.java:35)
        return scientific_research_project_dao.declare(project_number,project_name,project_leader,category,subject,budget,start_date,end_date,application_file,approval_status);
    }

    /**
     * 查看所有已经申报的数据
     *
     * @return
     */
    @Override
    public List<Research_projects> declare_list() {
        return scientific_research_project_dao.declare_list();
    }

    /**
     * 根据id查询已经申报的项目
     *
     * @param research_projects
     * @return
     */
    @Override
    public Research_projects find_by_id_research_projects(int id) {
        return scientific_research_project_dao.find_by_id_research_projects(id);
    }

    /**
     * 修改已经申报的数据
     *
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
    @Override
    public int declare_edit(int id, String project_number, String project_name, String project_leader, String category, String subject, float budget, String start_date, String end_date, byte[] application_file, String approval_status) {
        return scientific_research_project_dao.declare_edit(id, project_number,project_name,project_leader,category,subject,budget,start_date,end_date,application_file,approval_status);
    }

    /**
     * 删除已经申报的数据
     * @param id
     * @return
     */
    @Override
    public int declare_delete(int id) {
        return scientific_research_project_dao.declare_delete(id);
    }

    /**
     * 按项目名称查找 项目
     *
     * @param project_name
     * @return
     */
    @Override
    public List<Research_projects> find_by_project_name_project(String project_name) {
        return scientific_research_project_dao.find_by_project_name_project(project_name);
    }
}
