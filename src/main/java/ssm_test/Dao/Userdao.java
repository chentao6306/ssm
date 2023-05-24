package ssm_test.Dao;


import org.apache.ibatis.annotations.*;
import ssm_test.Entity.User;

import java.util.List;

public interface Userdao {

    /**
     * 查询所有用户
     * @return
     */
    @Select("select * from user")
    List<User> user_all();

    /**
     * 添加用户
     * @param user
     * @return
     */
    @Insert("insert into user values (null, #{account}, #{password}, #{role})")
    int user_register(User user);

    /**
     * 根据账号和密码查询用户返回user对象
     * @param user
     * @return
     */
    @Select("select * from user where account=(#{account}) and password=(#{password})")
    User user_login(User user);

    /**
     * 根据id删除用户信息
     * @param id
     * @return
     */
    @Delete("delete from user where id=(#{id})")
    int user_delete(int id);

    /**
     * 根据id查询用户信息
     * @param id
     * @return
     */
    @Select("select * from user where id=(#{id})")
    User user_select(int id);

    /**
     * 修改用户信息
     * @param id
     * @return
     */
    @Update("UPDATE user SET account = #{account}, password = #{password}, role = #{role} WHERE id = #{id}")
    int user_update(@Param("id") int id, @Param("account") String account, @Param("password") String password, @Param("role") String role);

    /**
     * 根据账号查询用户
     * @param account
     * @return
     */
    @Select("select * from user where account=#{account}")
    User find_user_by_account(String account);
}
