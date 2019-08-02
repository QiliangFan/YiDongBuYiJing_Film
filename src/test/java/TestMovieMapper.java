import com.movie.dao.MovieMapper;
import com.movie.domain.po.Movie;
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
import java.io.Reader;
import java.util.List;

/**
 * @author chentaijie
 * @version 1.0
 * @date 2019/8/2 2:10
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/spring-config.xml")
public class TestMovieMapper {

    @Resource
    private MovieMapper movieMapper;

//    @Before
//    public void setUp() throws Exception {
//        String resource = "spring/mybatis-config.xml";
//        Reader reader = Resources.getResourceAsReader(
//                TestMovieMapper.class.getClassLoader(), resource
//        );
//        SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(reader);
//        session = sessionFactory.openSession();
//    }



    @Test
    public void add() {
        Movie movie = new Movie("test","1998-07-05","test","test","test","test",0,0,0,"test","test","test");
        int result = movieMapper.add(movie);
        System.out.println(result);
    }

    @Test
    public void selectAll() {
        List<Movie> list = movieMapper.selectAll();
        System.out.println(list);
    }

    @Test
    public void selectByName() {
        Movie movie = new Movie("test2","1998-07-05","test","test","test","test",0,0,0,"test","test","test");
        List<Movie> movies= movieMapper.selectByName(movie.getMovieName(),0,1);
        System.out.println(movies);
    }

    @Test
    public void deleteByID() {
        int result = movieMapper.deleteById(365);
        System.out.println(result);
    }

    @Test
    public void update() {
        Movie movie = new Movie(366,"test2","1998-07-05","test","test","test","test",0,0,0,"test","test","test");
        int result = movieMapper.update(movie);
        System.out.println(result);
    }

    @Test
    public void count() {
        int result = movieMapper.count();
        System.out.println(result);
    }

//    @After
//    public void tearDown() throws Exception {
//        session.close();
//    }
}