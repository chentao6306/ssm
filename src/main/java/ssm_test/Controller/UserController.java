package ssm_test.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import ssm_test.Entity.User;
import ssm_test.Service.UserService;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * 用户类的相关操作 (增, 删, 改, 查)
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;


    /**
     * 查询所有用户信息 user_All
     * @return
     */
    @GetMapping("/")
    public String user_All(HttpSession session){
        List<User> users = userService.user_all();
        session.setAttribute("users",users);
        return "redirect:/user.jsp";
    }

    /**
     * 用户登录操作
     * @param user
     * @return
     */
    @PostMapping("/login")
    public String user_login(User user, HttpSession session){
        User user1 = userService.user_login(user);

        if (user1 == null){
            session.setAttribute("login_msg","账号或密码错误!");
            return "redirect:/login.jsp";
        } else {
            session.setAttribute("user_role", user1.getRole());
            return "redirect:/user/";
        }
    }


    /**
     * 增加用户
     * @param user
     * @return
     */
    @PostMapping("/register")
    public String user_register(User user, HttpSession session){

        int user_register = userService.user_register(user);
        if (user_register >= 1){
            session.setAttribute("register_msg","注册成功 请登录!");
            return "redirect:/login.jsp";
        } else {
            System.out.println("注册失败");
            return null;
        }

    }

    /**
     * 根据id查询用户
     * @param id
     * @return
     */
    @GetMapping("/select")
    public String user_Select(int id, HttpSession session){
        User user = userService.user_select(id);
        session.setAttribute("user",user);
        return "redirect:/user_edit.jsp";
    }


    /**
     * 根据id删除用户
     * @param id
     * @return
     */
    @GetMapping("/delete")
    public String user_delete(int id){
        int i = userService.user_delete(id);
        if (i >= 1){
//            System.out.println("删除用户成功");
            return "redirect:/user/";
        } else {
            System.out.println("删除失败");
            return "redirect:/user/";
        }

    }


    /**
     * 修改用户信息
     * @param user
     * @return
     */
    @PostMapping("/update")
    public String user_update(User user){
        int i = userService.user_update(user.getId(),user.getAccount(),user.getPassword(),user.getRole());
        if (i >= 1){
//            System.out.println("修改用户信息成功");
            return "redirect:/user/";
        } else {
            System.out.println("修改用户信息失败");
            return "redirect:/user/";
        }

    }

    @GetMapping("/select_user")
    public String find_user_by_account(String account, HttpSession session, HttpServletResponse response) throws IOException {
        User userByAccount = userService.find_user_by_account(account);
        session.setAttribute("user_by_account", userByAccount);
        return "redirect:/user_select.jsp";

    }


}
