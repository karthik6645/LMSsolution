<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.io.*,java.sql.*,javax.servlet.*,java.util.*,com.pojo.*,com.ajava.*"  %>s
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/c795ee9098.js" crossorigin="anonymous"></script>
    <style>
     .warping,.wraping{
     width:120px;
     display: inline-block;
     white-space: nowrap;
     overflow: hidden;
     text-overflow: ellipsis;
    word-wrap:break-word;
     }
    </style>
</head>
<body>
    <header class="container"><h1>SPA Online Library <sub>Be Unicron</sub></h1></header>
    <nav class="navbar navbar-expand-sm navbar-light bg-info sticky-top ">
      <a href="home.html" class="navbar-brand"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse  " id="collapsibleNavbar">
         
      <ul class="navbar-nav  col-sm-10">        
      <li class="nav-item">
       <a href="index.jsp" class="btn btn-info">Home</a></li>
      <li class="nav-item">
       <a href="aboutus.jsp" class="btn btn-info">About us</a></li>
      <li class="nav-item">
       <a href="AdminVal" class="btn btn-info">Dashboard</a></li>
       <li class="nav-item">
       <a href="index.jsp#contactUs" class="btn btn-info">Contact Us</a>
       </li>
      </ul>
      <div class="dropdown">
      <ul class="navbar-nav  pl-4">
       <li class="nav-item " >
       <img src="ias.jpg" alt="img" class="rounded-circle border float-left mr-1"  width="25%" height="50px">
       <a class="text-white warping dropdown-toggle  dropdown-toggle-split  pt-2" data-toggle="dropdown"> karthik </a>
       <div class="dropdown-menu">
         <a href="LogOut" class="dropdown-item">Log Out</a>
         <a href="" class="dropdown-item warping2">Sign In with different <br> account</a>
         <a href="" class="dropdown-item warping2">Delete my account</a>
       </div>
      </li>
       </ul>
      </div>
          </div>  
         
    </nav>
    <div class="container">
      <div class="modal fade" id="myModal">
        <div class=" modal-dialog  ">
          <div class="modal-content">
       <div class="modal-header">
         <h4>Login</h4>
         <button type="button" class="close"  data-dismiss="modal">&times;</button>
        
       </div>
     
      <div class="modal-body">
        <form action="#">
           <div  class="form-group">
             Username <input type="text" name="user" class="form-control"placeholder="Enter email or phone number">
           </div>
           <div  class="form-group">
            Password <input type="text" name="pass" class="form-control"placeholder="Enter password">
          </div>
          <div class="form-group form-check">
            <input type="checkbox" class="form-check-input" name="remember">Remember me
            <a href="" class="float-right">Forgot Password</a>
          </div>
          <div class="form-group form-check">
           
            <input type="radio" class="form-check-input" name="users" >Admin &nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" class="form-check-input"  name="users" checked>User
          </div>
          <div>
          </div>
          <div class="form-group">
          <button type="submit" class="btn btn-primary">Login</button>
          <p  class="float-right">New to SPA?<a href=""  data-toggle="modal" data-target="#myModal1"  data-dismiss="modal"> create account</a></p>
        </div>
        </form>
      </div>
      </div>
      </div>  
    </div>
    </div>
    <div class="cointainer">
      <div class="modal fade" id="myModal1">
        <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h4>Sign Up</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          <div class="modal-body">
      <form action="">
      <div class="row">
      <div class="col"> First name <input type="text" class="form-control" placeholder="Enter  First name"></div>
      <div class="col">Last name <input type="text" class="form-control" placeholder="Enter last name"></div>
      </div> <br>
      <div class="form-group">
        Email <input type="email" class="form-control" placeholder="Enter email">
      </div>
      <div class="form-group">
        Password <input type="password" class="form-control" placeholder="Enter password">
      </div>
      <div class="form-group">
        Phonre number <input type="number" class="form-control" placeholder="Enter phone number">
      </div>
      <div class="form-group">
        DOB <input type="date" class="form-control" >
      </div>
     
      <div class="form-group form-check">
        <label for="" class="ml-n3">Gender</label>
        <br> <input type="radio" class="form-check-input" name="gender" >Male&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="radio" class="form-check-input" name="gender" >Female&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="radio" class="form-check-input" name="gender" >Custom
      </div>
      <div class="form-group">
        <button type="submit" class="btn btn-primary">Sign Up</button>
        <p  class="float-right"><a href=""  data-toggle="modal" data-target="#myModal"  data-dismiss="modal"> Already have an account?</a></p>
      </div>
      </form>
    </div>
    </div>
  </div>
</div>
    </div>
    <section>
        <div class="container-fluid  d-flex" >
          <%
         
          HttpSession session1=request.getSession();
        int submit=(int)session1.getAttribute("submit");
               System.out.println("in jsp"+submit);
            
                     %>
            <ul class="nav nav-pills flex-column align-self-strech border" role="tablist" style="width: 200px;" >
             <li class="nav-item">
                   <%if(submit==1||submit==0){System.out.println("in search pill if"); %>     <a href="#search" class="nav-link active " data-toggle="pill">Search Books</a><%} else{System.out.println("in search pill else"); %>
                     <a href="#search" class="nav-link  " data-toggle="pill">Search Books</a><%} %>
                </li>
               <li class="nav-item">
                  <%if(submit==2){System.out.println("in display pill if"); %>   <a href="#display" class="nav-link active" data-toggle="pill">Display books</a><%} else{System.out.println("in display pill else"); %>
                   <a href="#display" class="nav-link" data-toggle="pill">Display books</a><%} %>
               </li>
               <li class="nav-item">
                   <%if(submit==3){System.out.println("in myBooks pill if"); %> <a href="#myBooks" class="nav-link active" data-toggle="pill">My books</a><%} else{System.out.println("in myBooks pill else"); %>
                   <a href="#myBooks" class="nav-link" data-toggle="pill">My books</a><%} %>
                   
               </li>
               <li class="nav-item">
                 <%if(submit==4){System.out.println("in profile pill if"); %>   <a href="#profile" class="nav-link active" data-toggle="pill">Profile</a><%} else{System.out.println("in profile pill else"); %>
                     <a href="#profile" class="nav-link" data-toggle="pill">Profile</a><%} %>
               </li>
               <li class="nav-item">
                  <%if(submit==5){System.out.println("in favorites pill if"); %>  <a href="#favorite" class="nav-link active" data-toggle="pill">Favorites user</a><%} else{System.out.println("in favorites pill else"); %>
                   <a href="#favorite" class="nav-link" data-toggle="pill">Favorites user</a><%} %>
               </li>
               
            </ul>
            <div class="tab-content  flex-grow-1" >
                <%if(submit==1||submit==0){System.out.println("in search tab if"); %>  <div id="search" class="container tab-pane  active"><%} else{System.out.println("in search tab else"); %>
                 <div id="search" class="container tab-pane  fade"><%} %>
                    <h4>Search</h4>
                     <form action="SearchBooks" method="post" enctype="multipart/form-data" >
                    <label for=""><b>Please choose from following</b></label>
                   <select id="selectSrch" class="form-group form-control w-25" name="searchSelection" >
                     <option value="null">Select</option>
                    <!-- <option value="id">ID</option>-->
                     <option value="book_title">Book Title</option>
                     <option value="author">Author</option>
                     <option value="category">Category</option>
                   </select>
                   <span id="selectOne"></span>
                  
                     <div class="form-group" id="id">
                       <label for="">Enter Book-ID </label>
                     <input type="text" name="searchId" class="form-control w-25" placeholder="Ex-3"></div>
                     <div class="form-group" id="title">
                       <label for="">Enter Book-Title</label>
                     <input type="text" name="searchTitle"  class="form-control w-25" placeholder="Ex-Tricky girl"></div>
                     <div class="form-group"  id="author">
                       <label for="">Enter Author Name</label>
                     <input type="text" name="searchAuthor"  class="form-control w-25" placeholder="Ex-Stephen"></div>
                     <div class="form-group"  id="category">
                       <label for="">Enter Category</label>
                     <input type="text" name="searchCategory"  class="form-control w-25" placeholder="Ex-Business "></div>
                    <button class="btn btn-primary" type="submit" id="subBtn"name="submit" value="1"  >Submit</button>
                   </form>
                 
                   <script>
                   function hideSearch(){
                       $("#searchr").slideUp(3000)
                        }
                     $(document).ready(function(){
                    	 $("#searchr").css({"color":"red"})
                    	 setTimeout("hideSearch()",10000)
                              $("#addp").css({"color": "green"})
                       $("#id,#title,#author,#category,#subBtn").hide()
                       $("#selectSrch").change(function(){
                         var opn=$("#selectSrch").val()
                         if(opn=="null"||opn==""){
                          $("#id,#title,#author,#category,#subBtn").hide()
                            $("[id=selectOne]").text("Please select any one option")
                            $("[id=selectOne]").css({"color":"red"})
                         }
                        if(opn=="id"){
                          $("#id").show()
                          $("#title,#author,#category").hide()
                          $("#subBtn").show()
                          $("[id=selectOne]").text("")
                         }
                         if(opn=="book_title"){
                         $("#title").show()
                         $("#id,#author,#category").hide()
                          $("#subBtn").show()
                          $("[id=selectOne]").text("")
                         }
                         if(opn=="author"){ 
                          $("#id,#title,#category").hide()
                           $("#author").show()
                          $("#subBtn").show()
                          $("[id=selectOne]").text("")
                          }
                         if(opn=="category"){
                          $("#id,#title,#author").hide()
                          $("#category").show()
                          $("#subBtn").show()
                          $("[id=selectOne]").text("")
                         }
                        })
                     })
                   </script>
                   <% if(submit==1){ %> <div class="d-flex flex-wrap align-content-around">
                	  <%  ArrayList searchList=(ArrayList)request.getAttribute("searchList");
                	  System.out.println("id in search jsp before for"+searchList.size());
                			  
                	   for(int i=0;i<searchList.size();i++){
                		   DTO dto=(DTO)searchList.get(i);
                		   
                		   if(dto.getEmpty()==1){%><p id="searchr" >Book not found</p><% }else{
                		   %>
                           <div class="card m-2" style="width: 150px;">
                             <img src="ImageDisplay?id=<%=dto.getId() %>" height="150px" alt="image">
                             <div class="card-head p-1">
                               <b class="wraping" title="<%= dto.getTitle() %>"><%= dto.getTitle() %></b><i class="fas float-right  fa-heart hhover" title="Add to favorites"></i>
                               <span class="wraping" title="<%=dto.getAuthor() %>"><%=dto.getAuthor() %></span>
                             </div>
                             <div class="card-footer d-flex justify-content-around">
                              <a href="#"> <i class="fas fa-eye" data-toggle="modal" data-target="#pdf<%=dto.getId() %>" title="Preview"></i></a>
                              <a href="#"> <i class="fas fa-book-medical" title="Add to Book-shelf"></i></a>
                              <a href="PdfDisplay?id=<%=dto.getId() %>" download> <i class="fas fa-download" title="Download"></i></a>
                             </div>
                           </div>
                                <div class="modal fade " id="pdf<%=dto.getId() %>">
                                  <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                      <div class="modal-header">
                                        <h4><%= dto.getTitle() %></h4>
                                        <button type="button" class="close" data-dismiss="modal">&times</button>
                                      </div>
                                      <div class="modal-body">
                                        <embed src="PdfDisplay?id=<%=dto.getId() %>" type="application/pdf" width="100%" height="450px"/>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                                <%} }%></div>
                                <% }%>
                </div>
                  <%if(submit==2){%><div id="display" class="container tab-pane active">
             <h4>Book Collection List</h4>
                    <div class="container">
                      <a href="DisplayBooks" class="text-decoration-none" name="displayselect" value="2">Click here</a> to view all books  
                      <div class="d-flex flex-wrap align-content-around">
                      <% ArrayList list1=(ArrayList)request.getAttribute("list");
            	for(int i=0;i<list1.size();i++){
            	       DTO dto=(DTO)list1.get(i);
            	 %>
                      <div class="card m-2" style="width: 150px;">
                        <img src="ImageDisplay?id=<%=dto.getId() %>" height="150px" alt="image">
                        <div class="card-head p-1">
                          <b class="wraping wraping" title="<%= dto.getTitle() %>"><%= dto.getTitle() %></b><i class="fas float-right  fa-heart hhover" title="Add to favorites"></i>
                          <span class="wraping wraping" title="<%=dto.getAuthor() %>"><%=dto.getAuthor() %></span>
                        </div>
                        <div class="card-footer d-flex justify-content-around">
                         <a href="#"> <i class="fas fa-eye" data-toggle="modal" data-target="#pdf<%=dto.getId() %>" title="Preview"></i></a>
                         <a href="#"> <i class="fas fa-book-medical" title="Add to Book-shelf"></i></a>
                         <a href="PdfDisplay?id=<%=dto.getId() %>" download> <i class="fas fa-download" title="Download"></i></a>
                        </div>
                      </div>
                           <div class="modal fade " id="pdf<%=dto.getId() %>">
                             <div class="modal-dialog modal-lg">
                               <div class="modal-content">
                                 <div class="modal-header">
                                   <h4><%= dto.getTitle() %></h4>
                                   <button type="button" class="close" data-dismiss="modal">&times</button>
                                 </div>
                                 <div class="modal-body">
                                   <embed src="PdfDisplay?id=<%=dto.getId() %>" type="application/pdf" width="100%" height="450px"/>
                                 </div>
                               </div>
                             </div>
                           </div>
                           <%} %>
                      </div>
                    </div>
                </div>
                <%} else{ %>
                 <div id="display" class="container tab-pane fade">
                   <h4>Book Collection List</h4>
                    <div class="container">
                      <a href="DisplayBooks" class="text-decoration-none" name="displayselect" value="2">Click here</a> to view all books
                      </div>
                 </div><%} %>
                <%if(submit==3){System.out.println("in myBooks tab if"); %> <div id="myBooks" class="container tab-pane active"><%} else{System.out.println("in myBooks tab else"); %>
                 <div id="myBooks" class="container tab-pane fade"><%} %>
                    <h4>My Books</h4>
                </div>
                <%if(submit==4){System.out.println("in porfile tab if"); %> <div id="profile" class="container tab-pane active"><%} else{System.out.println("in profile tab else"); %>
                <div id="profile" class="container tab-pane fade"><%} %>
                    <h4>Profile</h4>
                </div>
               <%if(submit==5){System.out.println("in favorites tab if"); %> <div id="favorite" class="container tab-pane active"><%} else{System.out.println("in favorites tab else"); %>
                 <div id="favorite" class="container tab-pane fade"><%} %>
                    <h4>Favorites</h4>
                </div>
               
            </div>
        </div><br>
    </section>
    <footer class="bg-light">
        <div class="container " >
    <div class="d-flex ">
    <div class="flex-fill"><h4>About SPA Online Library</h4>
    <a href="" style="display: block;" class=" text-decoration-none">Privacy Policy</a>
    <a href=""style="display: block;" class=" text-decoration-none">Terms of Use</a>
    <a href="" style="display: block;"  class="e text-decoration-none">Cookies</a>
    <a href="" style="display: block;"  class=" text-decoration-none">Accessibility</a>
    </div>
    <div class="flex-fill"><h4>Help & Support</h4><a href=""style="display: block;"  class="text-decoration-none">Contact Us</a></div>
    <div class="flex-fill"><h4>Opportunities</h4>
      <a href=""style="display: block;"  class=" text-decoration-none">Subscription Agents</a>
      <a href=""style="display: block;"  class=" text-decoration-none">Advertisers & Corporate Partners</a>
    </div>
    <div class="flex-fill"><h4>Connect with SPA</h4>
      <a href=""  class=" text-decoration-none"><i class="fab fa-3x fa-facebook-square"></i></a>
      <a href=""  class=" text-decoration-none"><i class="fab fa-3x fa-twitter"></i></a>
      <a href=""  class=" text-decoration-none"><i class="fab  fa-3x fa-google-plus-g"></i></a>
      <a href=""  class=" text-decoration-none"><i class="fab fa-3x  fa-linkedin"></i></a>
    </div>
    </div>
        </div>
        <div class="container ">
          <p class="float-left"style="display: inline-block;">Copyright &copy; 1999-2019 Suna & pras, Inc. All rights reserve</p>
          <h4 class="float-right"style="display: inline-block;">SPA</h4>
        </div>
      
      </footer>
</body>
</html>