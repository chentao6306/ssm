package ssm_test.Service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ssm_test.Dao.Userdao;
import ssm_test.Entity.User;
import ssm_test.Service.UserService;

import java.util.List;


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private Userdao userdao;

    // 添加用户方法
    @Override
    public int user_register(User user) {
        System.out.println("haha");
        return userdao.user_register(user);

    }

    @Override
    public List<User> user_all() {
        return userdao.user_all();
    }

    @Override
    public User user_user_login(User user) {
        return userdao.user_login(user);
    }

    /**
     * @param id
     * @return
     */
    @Override
    public int user_delete(int id) {
        return userdao.user_delete(id);
    }

    /**
     * 根据id查询用户
     * @param id
     * @return
     */
    @Override
    public User user_select(int id) {
        return userdao.user_select(id);
    }

    /**
     * 修改用户信息
     * @param id
     * @return
     */
    @Override
    public int user_update(int id,String account, String password, String role) {
        return userdao.user_update(id,account,password,role);
    }

    /**
     * 按帐户查找用户
     * @param account
     * @return
     */
    @Override
    public User find_user_by_account(String account) {
        return userdao.find_user_by_account(account);
    }
}
