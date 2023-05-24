package ssm_test.Service;


import ssm_test.Entity.User;

import java.util.List;

public interface UserService {
    int user_register(User user);

    User user_login(User user);

    List<User> user_all();

    int user_delete(int id);

    User user_select(int id);

    int user_update(int id,String account, String password, String role);

    User find_user_by_account(String account);


}
