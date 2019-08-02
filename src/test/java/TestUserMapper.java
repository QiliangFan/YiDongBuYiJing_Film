
import com.movie.dao.UserMapper;
import com.movie.domain.po.Movie;
import com.movie.domain.po.User;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import javax.annotation.Resource;
import javax.sql.rowset.serial.SerialBlob;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.List;


/**
 * @author chentaijie
 * @version 1.0
 * @date 2019/8/2 0:38
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/spring-config.xml")
public class TestUserMapper {

    @Resource
    private UserMapper userMapper;
//    @Before
//    public void setup() throws Exception {
//        String resource = "spring/mybatis-config.xml";
//        Reader reader = Resources.getResourceAsReader(
//                TestUserMapper.class.getClassLoader(), resource
//        );
//        SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(reader);
//        session = sessionFactory.openSession();
//    }

    @Test
    public void testAdd() throws UnsupportedEncodingException, SQLException {

        User user = new User("1","1","1","1998-07-05","1","1", new SerialBlob("00".getBytes("GBK")));
//        Movie movie = new Movie("test","1998-07-05","test","test","test","test",0,0,0,"test","test","test");
//        int result = movieMapper.add(movie);
//        System.out.println(result);
        int result = userMapper.add(user);
        System.out.println(result);
    }

    @Test
    public void testSelectByName() throws UnsupportedEncodingException, SQLException {
        User user = new User("1","1","1","1998-07-05","1","1", new SerialBlob("00".getBytes("GBK")));
        User user2 = userMapper.selectByName(user.getUserName());
        System.out.println(user2);
    }

    @Test
    public void testSelectAll(){
        List<User> list = userMapper.selectAll(0,2);
        System.out.println(list);
    }

    @Test
    public void testDeleteById(){
        int result = userMapper.deleteById(1);
        System.out.println(result);
    }

    @Test
    public void testUpdate() throws UnsupportedEncodingException, SQLException {
        User user = new User(2,"12","1","1","1998-07-05","1","1", new SerialBlob("00".getBytes("GBK")));
        int result = userMapper.update(user);
        System.out.println(result);
    }

    @Test
    public void testCount(){
        int result = userMapper.count();
        System.out.println(result);
    }

    @Test
    public void testSelectAllPreferMovie() throws UnsupportedEncodingException, SQLException {
        User user = new User("12","1","1","1998-07-05","1","1", new SerialBlob("00".getBytes("GBK")));
        List<Movie> movies = userMapper.selectAllPreferMovie(user);
        System.out.println(movies);
    }

//    @After
//    public void tear() {
//        //在所有测试方法执行结束后执行完成资源的释放
//        session.close();
//    }
}
