<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.sql.*,javax.servlet.*,java.util.*,com.pojo.*,com.ajava.*"  %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="ISO-8859-1">
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/c795ee9098.js" crossorigin="anonymous"></script>
    <style>
     .hhover:hover {
          color:red;
     }
      .wraping{
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
         
      <ul class="navbar-nav   col-sm-10">        
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
      <ul class="navbar-nav ">
       <li class="nav-item " >
      <img src="testi3.jpg" alt="img" class="rounded-circle border float-left mr-2"  width="25%" height="50px">
      <span style="display: block;"  class="text-white">Admin</span>
      <a class="text-white " href="LogOut" >Log Out</a>
      </li>
       </ul>
     
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
        Phone number <input type="number" class="form-control" placeholder="Enter phone number">
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
                <%if(submit==1||submit==0){System.out.println("in search pill if"); %>    <a href="#search" class="nav-link active " data-toggle="pill">Search Books</a><%} else{System.out.println("in search pill else"); %>
                <a href="#search" class="nav-link  " data-toggle="pill">Search Books</a> <%} %>
                </li>
               <li class="nav-item">
                  <%if(submit==2){ %>   <a href="#display" class="nav-link active " data-toggle="pill">Display books</a><%} else{ %>
                   <a href="#display" class="nav-link " data-toggle="pill">Display books</a><%} %>
               </li>
               <li class="nav-item">
                  <%if(submit==3){System.out.println("in add pill if"); %>   <a href="#add" class="nav-link active" data-toggle="pill">Add Books</a><%} else{System.out.println("in add pill else"); %>
                   <a href="#add" class="nav-link" data-toggle="pill">Add Books</a><%} %>
               </li>
               <li class="nav-item">
                 <%if(submit==4){System.out.println("in update pill if"); %>    <a href="#update" class="nav-link active" data-toggle="pill">Update books</a><%} else{System.out.println("in update pill else"); %>
                    <a href="#update" class="nav-link" data-toggle="pill">Update books</a><%} %>
               </li>
               <li class="nav-item">
                  <%if(submit==5){ %>   <a href="#delete" class="nav-link active" data-toggle="pill">Delete books</a><%} else{ %>
                    <a href="#delete" class="nav-link" data-toggle="pill">Delete books</a><%} %>
               </li>
               <li class="nav-item">
                  <%if(submit==6){ %>   <a href="#manageUser" class="nav-link active" data-toggle="pill"  >Manager user</a><%} else{ %>
                   <a href="#manageUser" class="nav-link" data-toggle="pill">Manage user</a><%} %>
               </li>
              
            </ul>
            <div class="tab-content  flex-grow-1" >
               <%if(submit==0|| submit==1){System.out.println("in search tab if"); %>  <div id="search" class="container tab-pane active "><%} else{System.out.println("in search tab else"); %>
                 <div id="search" class="container tab-pane fade "><%} %>
                    <h4>Search</h4>
                     <form action="SearchBooks" method="post" enctype="multipart/form-data" >
                    <label for=""><b>Please choose from following</b></label>
                   <select id="selectSrch" class="form-group form-control w-25" name="searchSelection" >
                     <option value="null">Select</option>
                     <option value="id">ID</option>
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
                <%if(submit==3){System.out.println("in add tab if"); %> <div id="add" class="container tab-pane active"><%} else{System.out.println("in add tab else"); %>
                 <div id="add" class="container tab-pane fade"><%} %>
                    <h4>Add Book</h4>
                 <% if(submit==3){ %> <div class="container px-5"  id="addedBook">
                  <p id="addp">Book Added Successfully!!!</p>
                	  <%  ArrayList additionList=(ArrayList)request.getAttribute("additionList");
                	  System.out.println("book addition display" +additionList.size());

                	   for(int i=0;i<additionList.size();i++){
                		   DTO dto=(DTO)additionList.get(i);
                		  System.out.println("book addition diaplay" +additionList.size());
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
                                <%} %></div>
                                <% }%>
                                 <script>
                       function hideAdd(){
                        $("#addedBook").slideUp(3000)
                         }
                      $(document).ready(function(){
                         setTimeout("hideAdd()",10000)
                         $("#addp").css({"color": "green"})
                      })
                    </script>
                      <div class="cointainer px-5">
                          <form action="BookAddition" method="post" enctype="multipart/form-data">
                            <div class="row">
                            <div class="col form-group">
                            <label for="">Book Title</label>
                            <input type="text" class="form-control " placeholder="Ex- Gold Heart" name="title">
                            </div>
                            <div class="col form-group">
                              <label for="">Author</label>
                              <input type="text" class="form-control" placeholder="Ex- Laymen Hack" name="author">
                              </div>
                          </div>
                          <div class="row">
                           <div class="form-group col">
                              <label for="">Category</label>
                              <input type="text" class="form-control" placeholder="Ex- fiction,drama, etc" name="category">
                            </div>
                              <div class="form-group col">
                              <label for="">Rating</label>
                              <input type="text" class="form-control" placeholder="Ex- 4.2" name="rating">
                            </div>
                           
                           
                          </div>
                          <div class="row">
                           <div class="form-group col">
                              <label for="">Image</label>
                              <input type="file" class="form-control-file" placeholder="Ex- Any iamge" name="image">
                            </div>
                            <div class="form-group col">
                              <label for="">PDF File</label>
                              <input type="file" class="form-control-file" placeholder="Ex- Gold_Heart.pdf" name="pdf">
                            </div>
                          
                          </div>
                          <div class="form-group">
                            <label for="">Price</label>
                            <input type="text" class="form-control w-25" name="price" id="">
                          </div>
                            <button type="submit" class="btn btn-primary" name="submit" value="3">Submit</button> 
                          </form>
                      </div>

                </div>
               <%if(submit==4){System.out.println("in update tab if"); %>  <div id="update" class="container tab-pane active"><%} else{System.out.println("in update tab if"); %>
                  <div id="update" class="container tab-pane fade"><%} %>
                    <h4>Update Book</h4>
                  <% if(submit==4){ %> <div class="container px-5"  id="updatedBook">
                  <% 
                  long u=(long)request.getAttribute("updateVal");
                  if(u==0){%><p id="updatepr">Book not found</p><%}else{ %>
                  <p id="updatep"><%out.println(u+" ");%>Book/s Updated Successfully!!!</p><%} %>
                   <%  ArrayList aUpdate=(ArrayList)request.getAttribute("aUpdate");
                	   for(int i=0;i<aUpdate.size();i++){
                		   DTO dto=(DTO)aUpdate.get(i);
                		   %>
                           <div class="card m-2" style="width: 150px;">
                             <img src="ImageDisplay?id=<%=dto.getId() %>" height="150px" alt="image">
                             <div class="card-head p-1">
                               <b class="wraping" title="<%= dto.getTitle() %>"><%= dto.getTitle() %></b><i class="fas float-right  fa-heart hhover" title="Add to favorites"></i>
                               <span class="wraping" title="<%=dto.getAuthor() %>"><%=dto.getAuthor() %></span>
                             </div>
                             <div class="card-footer d-flex justify-content-around">
                              <a href="#"> <i class="fas fa-eye" data-toggle="modal" data-target="#pdfU<%=dto.getId() %>" title="Preview"></i></a>
                              <a href="#"> <i class="fas fa-book-medical" title="Add to Book-shelf"></i></a>
                              <a href="PdfDisplay?id=<%=dto.getId() %>" download> <i class="fas fa-download" title="Download"></i></a>
                             </div>
                           </div>
                                <div class="modal fade " id="pdfU<%=dto.getId() %>">
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
                                <% }%>
                                 <script>
                      function hideUpdate(){
                        $("#updatedBook").slideUp(3000)
                         }
                      $(document).ready(function(){
                        setTimeout("hideUpdate()",10000)
                         $("#updatep").css({"color": "green"})
                          $("#updatepr").css({"color": "red"})
                      })
                    </script>
                    <div class="cointainer px-5">
                      <b>Enter fields as per requirement</b><br>
                      <form action="UpdateBooks" method="post" enctype="multipart/form-data">
                        <div class="row">
                          <div class="col form-group">
                          <label for=""> Old Book Title</label>
                          <input type="text" class="form-control " placeholder="Ex- Borken Heart" name="oldTitle">
                          </div>
                          <div class="col form-group">
                            <label for="">Old Author</label>
                            <input type="text" class="form-control" placeholder="Ex- Laymen Shark" name="oldAuthor">
                            </div>
                        </div>
                        <div class="row">
                        <div class="col form-group">
                        <label for=""> New Book Title</label>
                        <input type="text" class="form-control " placeholder="Ex- Gold Heart" name="newTitle">
                        </div>
                        <div class="col form-group">
                          <label for=""> New Author</label>
                          <input type="text" class="form-control" placeholder="Ex- Laymen Hack" name="newAuthor">
                          </div>
                      </div>
                      <div class="row">
                       <div class="form-group col">
                          <label for="">New Category</label>
                          <input type="text" class="form-control" placeholder="Ex- fiction,drama, etc" name="newCategory">
                        </div>
                         <div class="form-group col">
                          <label for="">New Rating</label>
                          <input type="text" class="form-control" placeholder="Ex- 4.5" name="newRating">
                        </div>
                      </div>
                      <div class="row">
                       
                        <div class="form-group col">
                          <label for="">New Image</label>
                          <input type="file" class="form-control-file" placeholder="Ex- Any iamge"name="newImage">
                        </div>
                         <div class="form-group col">
                          <label for="">New PDF File</label>
                          <input type="file" class="form-control-file" placeholder="Ex- Gold_Heart.pdf" name="newPdf">
                        </div>
                       
                      </div>
                      <div class="form-group">
                        <label for="">New Price</label>
                        <input type="text" class="form-control w-25" name="newPrice" id="">
                      </div>
                        <button type="button" class="btn btn-primary"  data-target="#alertUpdate" data-toggle="modal">Submit</button> 
                      <div class="modal fade" id="alertUpdate">
                            <div class="modal-dialog modal-dialog-centered">
                              <div class="modal-content" >
                                <div class="modal-header">
                                  <h4>Alert</h4>
                                  <button type="submit" class="close"data-dismiss="modal" >&times</button>
                                </div>
                                <div class="modal-body"><p> Are you sure you want to update book</p></div>
                                <div class="modal-footer"> 
                                  <button class="btn btn-primary float-right" type="button" data-dismiss="modal">Cancel</button>
                                  <button class="btn btn-primary float-right" type="submit"  name="submit" value="4">Ok</button>
                                </div>
                              </div>
                            </div>
                          </div>
                      </form>
                  </div>
                </div>
                <%if(submit==5){ %> <div id="delete" class="container tab-pane active"><%} else{ %>
                 <div id="delete" class="container tab-pane fade"><%} %>
                    <h4>Delete Book</h4>
                    <div class="container mx-3">
                    <form action="DeleteBooks" method="post" enctype="multipart/form-data">
                     <label for=""><b>Delete Book/s using</b></label>
                      <select name="selection" id="del" class="form-group form-control w-25">
                        <option value="nullDel">Select</option>
                        <option value="delId1">ID</option>
                        <option value="delTitle1">Book Title</option>
                        <option value="delAuthor1">Author</option>
                        <option value="delCategory1">Category</option>
                        <option value="delBookAuthor">Book Title & Author</option>
                      </select>
                      <span id="delSpan"></span>
                        <div class="form-group" id="idDel">
                          <label for="">Enter Book-ID</label>
                          <input type="number" class="form-control w-25" name="delId">
                        </div>
                        <div class="form-group" id="bookTitleDel">
                          <label for="">Enter Book Title</label>
                          <input type="text" class="form-control w-25" name="delTitle">
                        </div>
                        <div class="form-group" id="authorDel">
                          <label for="">Enter Author</label>
                          <input type="text" class="form-control w-25" name="delAuthor">
                        </div>
                        <div class="form-group" id="categoryDel">
                          <label for="">Enter Category</label>
                          <input type="text" class="form-control w-25" name="delCategory">
                        </div>
                        <div class="form-group" id="bookDel">
                          <label for="">Enter Book Title</label>
                          <input type="text" class="form-control w-25" name="delTitle2">
                        </div>
                        <div class="form-group" id="authorBookDel">
                          <label for="">Enter Author</label>
                          <input type="text" class="form-control w-25" name="delAuthor2">
                        </div>
                        <button type="button" id="delBtn"class="btn btn-primary"  data-target="#alertDelete" data-toggle="modal" >Submit</button>
                         <div class="modal fade" id="alertDelete">
                            <div class="modal-dialog modal-dialog-centered">
                              <div class="modal-content" >
                                <div class="modal-header">
                                  <h4>Alert</h4>
                                  <button type="button" class="close"data-dismiss="modal" >&times</button>
                                </div>
                                <div class="modal-body"><p> Are you sure you want delete book</p></div>
                                <div class="modal-footer"> 
                                  <button class="btn btn-primary float-right" type="button" data-dismiss="modal">Cancel</button>
                                  <button class="btn btn-primary float-right" type="submit" name="submit" value="5">Ok</button>
                                </div>
                              </div>
                            </div>
                          </div>
                      </form>
                      
                      <% if(submit==5){ %>
                      
                      <div id="deletedBook"> <%
                      int d=(int)request.getAttribute("deleteVal");
                      if(d==0){
                      %><p id="deletepr">Book not found</p><%} else { %>
                      <p id="deletep"><%out.println(d+" "); %>Book/s Deleted Successfully!!!</p><%} %>
                       </div>
                                <% }%>
                                 <script>
                       function hideDelete(){
                        $("#deletedBook").slideUp(5000)
                         }
                      $(document).ready(function(){
                         setTimeout("hideDelete()",5000)
                         $("#deletep").css({"color": "green"})
                         $("#deletepr").css({"color": "red"})
                      })
                    </script>
                    </div>
                </div>
                <script>
                  $(document).ready(function(){
                    $("#idDel,#bookTitleDel,#authorDel,#categoryDel,#bookDel,#authorBookDel,#delBtn").hide()
                       $("#del").change(function(){
                        var option= $("#del").val()
                        console.log(option)
                        if(option=="nullDel"){
                          $("#idDel,#bookTitleDel,#authorDel,#categoryDel,#bookDel,#authorBookDel,#delBtn").hide()
                           $("#delSpan").text("Please select any one option")
                           $("#delSpan").css({"color":"red"})
                        }
                        if(option=="delId1"){
                          $("#bookTitleDel,#authorDel,#categoryDel,#bookDel,#authorBookDel").hide()
                           $("#idDel,#delBtn").show()
                           $("#delSpan").text("")
                        }
                        if(option=="delTitle1"){
                          $("#idDel,#authorDel,#categoryDel,#bookDel,#authorBookDel").hide()
                           $("#bookTitleDel,#delBtn").show()
                           $("#delSpan").text("")
                        }
                        if(option=="delAuthor1"){
                          $("#idDel,#bookTitleDel,#categoryDel,#bookDel,#authorBookDel").hide()
                           $("#authorDel,#delBtn").show()
                           $("#delSpan").text("")
                        }
                        if(option=="delCategory1"){
                          $("#idDel,#bookTitleDel,#authorDel,#bookDel,#authorBookDel").hide()
                           $("#categoryDel,#delBtn").show()
                           $("#delSpan").text("")
                        }
                        if(option=="delBookAuthor"){
                          $("#idDel,#bookTitleDel,#authorDel,#categoryDel").hide()
                           $("#bookDel,#authorBookDel,#delBtn").show()
                           $("#delSpan").text("")
                        }
                       })
                  })
                </script>
                <%if(submit==6){ %> <div id="manageUser" class="container tab-pane active">
                    <h4>Manage user's</h4>
                     <div class="container">
                      <a href="ManageUsers" class="text-decoration-none" name="submit" value="6">Click here</a> to view all users
                     <div class="container table-responsive">
                      <%HttpSession sessionlog = request.getSession(); 
                      String s1=(String) sessionlog.getAttribute("existsAdmin");
                      String newAdd=(String) sessionlog.getAttribute("added");
                      String updated=(String) sessionlog.getAttribute("updated");
                      String deleted=(String) sessionlog.getAttribute("deletes");
                      String newAddEmail=(String) sessionlog.getAttribute("addedUser");
                      String updatedEmail=(String) sessionlog.getAttribute("updatedUser");
                      String deletedEmail=(String) sessionlog.getAttribute("deletedUser");
                      if("exists".equals(s1)){String display=(String) sessionlog.getAttribute("updatedUserDisplay"); %>
                       <p id="userAddp">This <%= display %> already exist</p>
                        <script>
                        function hideP(){
                        	  $("#userAddp").slideUp(3000)
                        }
                      $(document).ready(function(){
                          $("#userAddp").css({"color":"red"})
                           setTimeout("hideP()",10000)
                      })
                    </script><%}sessionlog.setAttribute("existsAdmin", "notExists");
                    if("addedy".equals(newAdd)){%>
                    <p id="userAddp2"><%=newAddEmail %> User Added Successfully!!!</p>
                     <script>
                     function hideP2(){
                     	  $("#userAddp2").slideUp(3000)
                     }
                   $(document).ready(function(){
                       $("#userAddp2").css({"color":"green"})
                        setTimeout("hideP2()",10000)
                   })
                 </script><%}sessionlog.setAttribute("added", "notAdded");
                  if("updated".equals(updated)){%>
                    <p id="userUpdate"><%=updatedEmail %> User Details Updated Successfully!!!</p>
                     <script>
                     function hideP3(){
                     	  $("#userUpdate").slideUp(3000)
                     }
                   $(document).ready(function(){
                       $("#userUpdate").css({"color":"green"})
                        setTimeout("hideP3()",10000)
                   })
                 </script><%}sessionlog.setAttribute("updated", "notUpdated");
                  if("deleted".equals(deleted)){%>
                    <p id="userDelete"><%=deletedEmail %> User Deleted Successfully!!!</p>
                     <script>
                     function hideP4(){
                     	  $("#userDelete").slideUp(3000)
                     }
                   $(document).ready(function(){
                       $("#userDelete").css({"color":"red"})
                        setTimeout("hideP4()",10000)
                   })
                 </script><%}sessionlog.setAttribute("deletes", "notDeleted"); %>
                    <table class="table table-striped table-hover">
                      <thead>
                      <tr>
                        <th>S.No</th>
                        <th>First name</th>
                        <th>Last name</th>
                        <th>Email</th>
                        <th>Password</th>
                        <th>Phone number</th>
                        <th>DoB</th>
                        <th>Gender</th>
                        <th>Action</th>
                       
                      </tr></thead>
                      <tbody>
                      <% ArrayList l=(ArrayList)request.getAttribute("usersList");%>
                      <tr>
                        <form action="UserAdd" method="post" enctype="multipart/form-data">
                          <td><%= l.size()+1%></td>
                      <td><input type="text" placeholder="Ex- John" name="firstName"></td>
                      <td><input type="text" placeholder="Ex- Deo" name="lastName"></td>
                      <td><input type="email" placeholder="examplae@gmail.com" name="email"></td>
                      <td><input type="text" placeholder="********" name="password"></td>
                      <td><input type="number" placeholder="Ex-999-888-7773" name="phnumber"></td>
                      <td><input type="date" name="dob" id=""></td>
                      <td><input type="text" name="gender" id="" placeholder="Ex- Male"></td>
                      <td><button type="submit" class="btn btn-success" name="submit" value="6">Add</button></td>
                    </form>
                    </tr>
                    <%
                    System.out.println("before for in manage users kk"+l.size());
                        for(int i=0;i<l.size();i++){
                        	DTOusers dtoUsers=(DTOusers)l.get(i);%>
                      <tr id="editBefore<%=dtoUsers.getPhNumber() %>">
                      <td><%=i+1 %></td>
                      <td><%=dtoUsers.getFirstName() %></td>
                      <td><%=dtoUsers.getLastName() %></td>
                      <td><%=dtoUsers.getEmail()%></td>
                      <td><%=dtoUsers.getPassworddb() %></td>
                      <td><%=dtoUsers.getPhNumber() %></td>
                      <td><%=dtoUsers.getDate() %></td>
                      <td><%=dtoUsers.getGender() %></td>
                        <td><div class=" d-flex"><button type="submit" class="btn btn-info mr-1"  id="editBtn<%=dtoUsers.getPhNumber() %>">Edit</button> 
                        <button class="btn btn-danger" data-toggle="modal" data-target="#Delete<%=dtoUsers.getPhNumber() %>" >Delete</button> </div></td>
                         </tr>
                         <div class="modal fade" id="Delete<%=dtoUsers.getPhNumber() %>">
                            <div class="modal-dialog modal-dialog-centered">
                              <div class="modal-content" >
                                <div class="modal-header">
                                  <h4>Alert</h4>
                                  <button type="button" class="close"data-dismiss="modal" >&times</button>
                                </div>
                                <div class="modal-body"><p> Are you sure you want delete <%=dtoUsers.getEmail()%> user</p></div>
                                <div class="modal-footer"> 
                                  <button class="btn btn-primary float-right" type="button" data-dismiss="modal">Cancel</button>
                                  <a href="DeleteUser?id=<%=dtoUsers.getEmail() %>"class="btn btn-danger" >Ok</a>
                                </div>
                              </div>
                            </div>
                          </div>                   
                     <tr id="edit3<%=dtoUsers.getPhNumber() %>">
                      <td><%=i+1 %></td>
                      <form action="UpdateUsers" method="post" enctype="multipart/form-data">
                      <td><input type="text" name="firstName"  value="<%=dtoUsers.getFirstName() %>" id="firstname1Input"></td>
                      <td><input type="text" name="lastName"  value="<%=dtoUsers.getLastName() %>" id="latname1Input"></td>
                      <td><input type="text" name="email" value="<%=dtoUsers.getEmail()%>" id="email1Input"></td>
                      <td><input type="text" name="password"  value="<%=dtoUsers.getPassworddb() %>" id="password1Input"></td>
                      <td><input type="text" name="phoneNumber"  value="<%=dtoUsers.getPhNumber() %>" id="phnumber1Input"></td>
                      <td><input type="date" name="dob"  value="<%=dtoUsers.getDate() %>" id="date1Input"></td>
                      <td><input type="text" name="gender"  value="<%=dtoUsers.getGender() %>" id="gender1Input"></td>
                      <td><div class=" d-flex"><button type="submit" name="submit" value="6"  class="btn btn-success mr-1 " id="">Save</button> <a class="btn btn-secondary " href="##" id="cancel<%=dtoUsers.getPhNumber() %>">Cancel</a> </div></td>
                         <td><input type="text" name="emailOrginal" value="<%=dtoUsers.getEmail()%>" id="emailHide"></td>
                          <td><input type="text" name="phoneNumberOrginal"  value="<%=dtoUsers.getPhNumber() %>" id="phnumberHide"></td>
                              
                     </form>
                    </tr>
                    <script>
                      $(document).ready(function(){
                    	  $("#emailHide,#phnumberHide").hide()
                           console.log("in varr completed")
                           console.log("<%=dtoUsers.getPhNumber() %>")
                           var sometext="<%=dtoUsers.getPhNumber() %>"
                        	   console.log(typeof sometext+" print")
                           $("#edit3"+sometext).hide()
                           
                          $("#editBtn"+sometext).click(function(){
                              $("#edit3"+sometext).show()  
                             $("#editBefore"+sometext).hide()
                            
                          })
                           $("#cancel"+sometext).click(function(){
                            $("#edit3"+sometext).hide()  
                              $("#editBefore"+sometext).show()
                           })
                      })

                    </script>
                      <% }%>
                  </tbody>
                    </table>
                    </div>
                  </div>
                    </div>   <%} else{ %>
                 <div id="manageUser" class="container tab-pane fade">
                  <h4>Manage user's</h4>
                   <div class="container">
                      <a href="ManageUsers" class="text-decoration-none" name="submit" value="6">Click here</a> to view all users
                      </div>
                 
                </div><%} %>
               
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