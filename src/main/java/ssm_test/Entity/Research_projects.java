package ssm_test.Entity;

import java.util.Date;

/**
 * 科研项目申报的实体类字段
 */
public class Research_projects {
    /**
     * // 科研项目申报表
     * CREATE TABLE research_projects (
     *   id INT PRIMARY KEY AUTO_INCREMENT,
     *   project_number VARCHAR(50) NOT NULL,
     *   project_name VARCHAR(100) NOT NULL,
     *   project_leader VARCHAR(100) NOT NULL,
     *   category VARCHAR(20) NOT NULL,
     *   subject VARCHAR(100) NOT NULL,
     *   budget DECIMAL(10, 2) NOT NULL,
     *   start_date DATE NOT NULL,
     *   end_date DATE NOT NULL,
     *   application_file LONGBLOB NOT NULL,
     *   approval_status VARCHAR(5) NOT NULL,
     *   reporting_of_results VARCHAR(255)
     * );
     */
    private int id;

    // 项目编号
    private String project_number;

    // 项目名称
    private String project_name;

    // 项目负责人
    private String project_leader;

    // 项目类别
    private String category;

    // 项目主题
    private String subject;

    // 项目预算
    private float budget;

    // 开始时间
    private String start_date;

    // 结束时间
    private String end_date;

    // 上传申请书
    private byte[] application_file;

    // 项目审批状态
    private String approval_status;

    // 成果汇报
    private String reporting_of_results;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProject_number() {
        return project_number;
    }

    public void setProject_number(String project_number) {
        this.project_number = project_number;
    }

    public String getProject_name() {
        return project_name;
    }

    public void setProject_name(String project_name) {
        this.project_name = project_name;
    }

    public String getProject_leader() {
        return project_leader;
    }

    public void setProject_leader(String project_leader) {
        this.project_leader = project_leader;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public float getBudget() {
        return budget;
    }

    public void setBudget(float budget) {
        this.budget = budget;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    public byte[] getApplication_file() {
        return application_file;
    }

    public void setApplication_file(byte[] application_file) {
        this.application_file = application_file;
    }

    public String getApproval_status() {
        return approval_status;
    }

    public void setApproval_status(String approval_status) {
        this.approval_status = approval_status;
    }

    public String getReporting_of_results() {
        return reporting_of_results;
    }

    public void setReporting_of_results(String reporting_of_results) {
        this.reporting_of_results = reporting_of_results;
    }
}
