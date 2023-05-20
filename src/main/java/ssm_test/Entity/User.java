package ssm_test.Entity;

/**
 * 用户实体类
 */
public class User {
    /**
     * CREATE TABLE user (
     *     id INT AUTO_INCREMENT PRIMARY KEY,
     *     account VARCHAR(255) NOT NULL,
     *     password VARCHAR(255) NOT NULL,
     *     role ENUM('教师', '研究生', '管理员') NOT NULL
     * );
     */
    //id
    private int id;

    // 账号
    private String account;

    // 密码
    private String password;

    // 角色  (教师、研究生、管理员等角色的权限管理、账号管理、信息管理等)
    private String role;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
