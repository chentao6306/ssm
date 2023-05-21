package ssm_test.Dao;

import org.apache.ibatis.annotations.*;
import ssm_test.Entity.Research_projects;

import java.util.List;


/**
 * 科研项目的相关操作的dao层(面向数据库)
 */
public interface Scientific_research_project_Dao {
    /**
     * 科研项目申报 insert操作
     * @return
     */
    @Insert("insert into research_projects values (null, #{project_number}, #{project_name}, #{project_leader}, #{category}, #{subject}, #{budget}, #{start_date}, #{end_date}, #{application_file}, #{approval_status}, '无', #{reporting_of_results})")
    int declare(@Param("project_number") String project_number, @Param("project_name") String project_name, @Param("project_leader") String project_leader, @Param("category") String category, @Param("subject") String subject, @Param("budget") float budget, @Param("start_date") String start_date, @Param("end_date") String end_date, @Param("application_file") byte[] application_file, @Param("approval_status") String approval_status, @Param("reporting_of_results") String reporting_of_results);

    /**
     * 查询所有已经申报的数据  ---> 按照最早开始时间排序
     * @return
     */
    @Select("select * from research_projects ORDER BY start_date DESC")
    List<Research_projects> declare_list();


    /**
     * 根据id查询已经申报的数据
     * @param id
     * @return
     */
    @Select("select * from research_projects where id=(#{id})")
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
    @Update("update research_projects set project_number=#{project_number},project_name=#{project_name}," +
            "project_leader=#{project_leader},category=#{category},subject=#{subject},budget=#{budget},start_date=#{start_date},end_date=#{end_date},application_file=#{application_file},approval_status=#{approval_status},reporting_of_results=#{reporting_of_results} where id=#{id}")
    int declare_edit(@Param("id") int id, @Param("project_number") String project_number, @Param("project_name") String project_name, @Param("project_leader") String project_leader, @Param("category") String category, @Param("subject") String subject, @Param("budget") float budget, @Param("start_date") String start_date, @Param("end_date") String end_date, @Param("application_file") byte[] application_file, @Param("approval_status") String approval_status, @Param("reporting_of_results") String reporting_of_results);

    /**
     * 删除已申报的数据
     * @param id
     * @return
     */
    @Delete("delete from research_projects where id=(#{id})")
    int declare_delete(int id);


    /**
     * 按项目名称查找 项目 ---> 模糊查询
     * @param project_name
     * @return
     */
    @Select("select * from research_projects where project_name like CONCAT('%', #{project_name}, '%')")
    List<Research_projects> find_by_project_name_project(String project_name);

}
