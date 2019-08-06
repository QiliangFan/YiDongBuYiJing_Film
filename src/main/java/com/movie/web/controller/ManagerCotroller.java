package com.movie.web.controller;

import com.movie.biz.*;
import com.movie.domain.po.*;
import com.movie.utils.Page;
import com.movie.utils.Select;
import com.movie.utils.SelectType;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * @author zyr
 * @Date
 **/
@Controller
public class ManagerCotroller {

    @Autowired
    private MovieService movieService;
    @Autowired
    private UserService userService;
    @Autowired
    private FilmReviewService filmReviewService;
    @Autowired
    private ReplyService replyService;
    @Autowired
    private HistoryService historyService;
    @Autowired
    private MessageService messageService;

    @Autowired
    private HttpServletRequest request;

    @RequestMapping("/managerToAddMovie")
    public String toAddMovie() {
        return "manageraddmovie";
    }

    @PostMapping("/managerAddMovie")
    public String addMovie(Movie movie, MultipartFile image) throws IOException {

        String fileName=movie.getMovieName()+".jpg";
        String path=request.getRealPath(".");
        path+="/filesUpload/";
        File file=new File(path+fileName);
        FileUtils.copyInputStreamToFile(image.getInputStream(),file);
        System.out.println(path+fileName);
        movie.setImg("/Movies/filesUpload/"+fileName);
        boolean judge = movieService.add(movie);
     System.out.println(judge);
        return "redirect:/managerToShowAllMovies";
    }

    @RequestMapping("/managerToShowAllMovies")
    public ModelAndView toShowAllMovies(Integer pageIndex) {
        ModelAndView mv = new ModelAndView();
        if (pageIndex == null) {
            pageIndex = 1;
        }
        Page<Movie> page = movieService.select(Select.SelectType.All, "", Select.SortType.Time , Select.OrderBy.DESC, pageIndex,25);
        List<Movie> movies = page.getList();
        mv.addObject("movies", movies);
        Integer totalPage = page.getTotalPage();
        mv.addObject("totalPage", totalPage);//总页数
        mv.setViewName("managershowallmovies");
        Integer currentPage = page.getCurrentPage();//当前页
        mv.addObject("currentPage", currentPage);
        return mv;
    }


    @RequestMapping("/managerShowMovieDetails")
    public ModelAndView toShowMovieDetails(Integer movieId)
    {
        ModelAndView mv=new ModelAndView();
         Movie movie=movieService.findMovieById(movieId);
         mv.addObject("movie",movie);
         mv.setViewName("managershowmoviedetail");
        return mv;

    }
    @RequestMapping("/managerDeleteMovie")
    public String deleteMovie(Integer movieId)
    {
        ModelAndView mv=new ModelAndView();
        movieService.delete(movieId);

        return "redirect:/managerToShowAllMovies";
    }
    @RequestMapping(value="/managerUpdateMovie",method= RequestMethod.GET)
    public ModelAndView toUpdateMovie(Integer movieId)
    {
        ModelAndView mv=new ModelAndView();
        Movie movie=movieService.findMovieById(movieId);
        mv.addObject("movie",movie);
        mv.setViewName("managerupdatemovie");
        return mv;
    }
    @RequestMapping(value="/managerUpdateMovie",method= RequestMethod.POST)
    public String UpdateMovie(Movie movie,MultipartFile image) throws IOException {

        String fileName=movie.getMovieName()+".jpg";
        String path=request.getRealPath(".");
        path+="/filesUpload/";
        File file=new File(path+fileName);
        FileUtils.copyInputStreamToFile(image.getInputStream(),file);
        System.out.println(path+fileName);
        movie.setImg("/Movies/filesUpload/"+fileName);

        boolean judge = movieService.update(movie);
        System.out.println(judge);
        return "redirect:/managerToShowAllMovies";
    }
    @RequestMapping("/managerToAddUser")
    public String toAddUser() {
        return "manageradduser";
    }

@PostMapping("/managerAddUser")
public String addUser(User user,MultipartFile img) throws IOException {
    String fileName=user.getUserName()+".jpg";
    String path=request.getRealPath(".");
    path+="/filesUpload/";
    File file=new File(path+fileName);
    FileUtils.copyInputStreamToFile(img.getInputStream(),file);
    System.out.println(path+fileName);
   user.setImage("/Movies/filesUpload/"+fileName);
    boolean judge = userService.register(user);
    System.out.println(judge);
    return "redirect:/managerToShowAllUsers";
}

@RequestMapping("/managerToShowAllUsers")
    public ModelAndView toShowAllMovies()
{
    ModelAndView mv=new ModelAndView();
    List<User> users=userService.findAll();
    mv.addObject("users",users);
    mv.setViewName("managershowallusers");
    return mv;

}
@RequestMapping(value="/managerUpdateUser" ,method = RequestMethod.GET)
public ModelAndView toUpdateUser(Integer userId)
{
    ModelAndView mv=new ModelAndView();
    User user=userService.findUserById(userId);
    mv.addObject("user",user);
    mv.setViewName("managerupdateuser");
    return mv;
}
    @RequestMapping(value="/managerUpdateUser" ,method = RequestMethod.POST)
    public String UpdateUser(User user,MultipartFile img) throws IOException {
        String fileName=user.getUserName()+".jpg";
        String path=request.getRealPath(".");
        path+="/filesUpload/";
        File file=new File(path+fileName);
        FileUtils.copyInputStreamToFile(img.getInputStream(),file);
        System.out.println(path+fileName);
        user.setImage("/Movies/filesUpload/"+fileName);
        boolean judge = userService.update(user);
        System.out.println(judge);
        return "redirect:/managerToShowAllUsers";
    }
    @RequestMapping("/managerDeleteUser")
    public String deleteUser(Integer userId)
    {
        ModelAndView mv=new ModelAndView();
        System.out.println(userService.delete(userId));

        return "redirect:/managerToShowAllUsers";
    }
    @RequestMapping("/managerToShowAllFilmReviews")
    public ModelAndView toShowAllFilmReviews()
    {
        ModelAndView mv=new ModelAndView();
        List<FilmReview> filmReviews=filmReviewService.findAllFilmReviews(1,100);
        mv.addObject("filmReviews",filmReviews);
        mv.setViewName("managershowallfilmreviews");
        return mv;

    }
    @RequestMapping("/managerDeleteFilmReview")
    public String deleteFilmReview(Integer filmReviewId)
    {
        ModelAndView mv=new ModelAndView();
        filmReviewService.deleteFilmReviewById(filmReviewId);

        return "redirect:/managerToShowAllFilmReviews";
    }
    @RequestMapping("/managerToShowAllHistories")
    public ModelAndView toShowAllHistories()
    {
        ModelAndView mv=new ModelAndView();
        List<History> histories=historyService.showAll(0,100);
        mv.addObject("histories",histories);
        mv.setViewName("managershowallhistories");
        return mv;

    }
    @RequestMapping("managerDeleteHistory")
    public String deleteHistory(Integer historyId)
    {
        ModelAndView mv=new ModelAndView();
        historyService.deleteById(historyId);

        return "redirect:/managerToShowAllHistories";
    }
    @RequestMapping("/managerToShowAllReplies")
    public ModelAndView toShowAllReplies()
    {
        ModelAndView mv=new ModelAndView();
        List<Reply> replies=replyService.showAll();
        mv.addObject("replies",replies);
        mv.setViewName("managershowallreplies");
        return mv;

    }
    @RequestMapping("managerDeleteReply")
    public String deleteReply(Integer replyId)
    {

      replyService.delete(replyId);

        return "redirect:/managerToShowAllReplies";
    }
    @RequestMapping("/managerToShowAllMessages")
    public ModelAndView toShowAllMessages()
    {
        ModelAndView mv=new ModelAndView();
        List<Message> messages=messageService.selectAllMessage(1,100);
        mv.addObject("messages",messages);
        mv.setViewName("managershowallmessages");
        return mv;

    }
}


