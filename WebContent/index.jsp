<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/c795ee9098.js" crossorigin="anonymous"></script>

    <style>
      .carousel-inner img{
          width: 100%;
          height: 300px;
      }
      /* .carousel-inner one img{
          width: 100%;
          height: 200px;
      } */
      .spanintesti{
        display: inline-block;
        width: 100px;
        height: 100px;
        margin: 6px;
       background-image: url(test4.jpeg);
       background-size:cover;
      }
       .warping{
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
       <a href="#contactUs" class="btn btn-info">Contact Us</a>
       </li>
      </ul>
   <% HttpSession sessionlog3 = request.getSession();
   int log=(int)sessionlog3.getAttribute("logInSubmit");
   String s7=(String)sessionlog3.getAttribute("users");
   if(log==0){%>
      <ul class="navbar-nav  pl-4">
       <li class="nav-item " >
       <a href="#" class="btn btn-info ml-1 " data-toggle="modal" data-target="#myModal">Login</a></li>
       <li class="nav-item">
       <a href="#" class="btn btn-info ml-1" data-toggle="modal" data-target="#myModal1">Sign Up</a></li>
       </ul>
       <% } else if(log==1&&"admin".equals(s7)){%>
        <ul class="navbar-nav ">
       <li class="nav-item " >
      <img src="testi3.jpg" alt="img" class="rounded-circle border float-left mr-2"  width="25%" height="50px">
      <span style="display: block;"  class="text-white">Admin</span>
      <a class="text-white " href="LogOut" >Log Out</a>
      </li></ul>
      <%} else if(log==1&&"user".equals(s7)){ %>
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
       </ul></div><%} %>
          </div>  
         
    </nav>
    
    <% HttpSession sessionlog2 = request.getSession();
    int se5=(int)sessionlog2.getAttribute("forgotSubmit");
    System.out.println("foegotSumit " +se5);
    if(se5==1){%>
    <script>
   
    $(document).ready(function(){
    	$("#newPass").modal("show")
    })
    </script><%}sessionlog2.setAttribute("forgotSubmit", 0); 
    int notlog=(int)sessionlog2.getAttribute("notLogin");
    if(notlog==1){%>
     <script>
    $(document).ready(function(){
    	$("#myModal").modal("show")
    })
    </script><%}sessionlog2.setAttribute("notLogin", 0);%>
    
    
    
    <div class="container">
      <div class="modal fade" id="myModal">
        <div class=" modal-dialog  ">
          <div class="modal-content">
       <div class="modal-header">
         <h4>Login</h4>
         <button type="button" class="close"  data-dismiss="modal">&times;</button>
        
       </div>
     
      <div class="modal-body">
      <%  
       
       HttpSession sessionlog = request.getSession();
      int submitUp=(int)sessionlog.getAttribute("submitUp");
      if(submitUp==1){ %>
      <div class="container " id="slogin">
       <center> <p id="loginp" class="p-2">You are Successfully Registered! <br>Please login to acess your Profile</p></center>
        </div>
      <script>
      function hide1(){
          $("#slogin").slideUp(3000)
        }
        $(document).ready(function(){
        	$("#myModal").modal("show")
          $("#loginp").css({"color": "green"})
          $("#slogin").css({"background-color":"lightgreen"})
          setTimeout("hide1()",10000)
        })
      </script><%}sessionlog.setAttribute("submitUp", 0);
     String s=(String) sessionlog.getAttribute("inCorrectl");
     System.out.print(s);
     if("inCorrect".equals(s)){
      %><div id="userPassCheck">
       <span id="loginp2">Please check your Username/Password</span>
     </div>
     <script>
     function hide2(){
         $("#userPassCheck").slideUp(3000)
       }
         $(document).ready(function(){
          $("#myModal").modal("show")
          $("#loginp2").css({"color": "red"})
          setTimeout("hide2()",10000)
         })
     </script><%}sessionlog.setAttribute("inCorrectl", "correct"); 
     int newPassSubmit=(int)sessionlog.getAttribute("newPassSubmit");
     if(newPassSubmit==1){%>
     <div id="slogin2">
        <center> <p id="loginp2">Password updated Successfully! <br> Please login to acess your Profile</p></center>
       </div>
       <script>
       function hide3(){
           $("#slogin2").slideUp(3000)
         }
        $(document).ready(function(){
          $("#myModal").modal("show")
          $("#loginp2").css({"color": "green"})
          $("#slogin2").css({"background-color":"lightgreen"})
          setTimeout("hide3()",10000)
        })
      </script><%}sessionlog.setAttribute("newPassSubmit", 0); %>
        <form action="LoginIn" method="post" enctype="multipart/form-data">
           <div  class="form-group">
            <label for=""> Username </label>
              <input type="text" class="form-control"placeholder="Enter email or phone number" name="userName">
           </div>
           <label for=""> Password </label>
           <div  class="form-group input-group">
           <input type="password" name="passwordl" class="form-control"placeholder="Enter password" id="loginPass">
           <div class="input-group-append">
            <i class="fas fa-eye-slash p-2 input-group-text form-control" id="eyeSlashl"></i>
            <i class="fas fa-eye p-2 input-group-text form-control" id="eyel"></i>
          </div>
          </div>
          <div class="form-group form-check">
            <input type="checkbox" class="form-check-input" name="remember">Remember me
            <a href="" class="float-right" data-toggle="modal" data-target="#forgotPass" data-dismiss="modal">Forgot Password</a>
          </div>
          <div class="form-group form-check">
           
            <input type="radio" class="form-check-input" name="users"  value="admin">Admin &nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" class="form-check-input"  name="users" checked value="user">User
          </div>
          <div>
          </div>
          <div class="form-group">
          <button type="submit" class="btn btn-primary" name="logInSubmit" value="1">Login</button>
          <p  class="float-right">New to SPA?<a href=""  data-toggle="modal" data-target="#myModal1"  data-dismiss="modal"> create account</a></p>
        </div>
        </form>
      </div>
      </div>
      </div>  
    </div>
    </div>
    <script>
      $(document).ready(function(){
        $("#eyel").hide()
        $("#eyeSlashl").click(function(){
          var newPass1=document.getElementById("loginPass")
          if(newPass1.type==="password"){
            newPass1.type="text"
            $("#eyeSlashl").hide()
            $("#eyel").show()
          }
          else{
            newPass1.type="password"
            $("#eyeSlashl").show()
            $("#eyel").hide()
          }
         })
         $("#eyel").click(function(){
          var newPass1=document.getElementById("loginPass")
          if(newPass1.type==="text"){
           
            newPass1.type="password"
           
               $("#eyeSlashl").show()
            $("#eyel").hide()
          }
          else{
            newPass1.type="text"
              $("#eyeSlashl").hide()
            $("#eyel").show()
          }
         })
      })
    </script>
    <div class="container">
    <div class="modal fade" id="forgotPass">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
         <div class="modal-header">
           <h4 >Forgot Password?</h4>
          <button class="close" type="button" data-dismiss="modal">&times</button>
         </div>
         <div class="modal-body">
         <%String s3=(String)session.getAttribute("dbemail");
         int s4=(int)session.getAttribute("forgotSubmit");
         if("noEmail".equals(s3)||s4==2){%>
          <div id="forgotPassDiv">
             <p id="forgotPassP">This email/phone number does not exists <a href="" data-toggle="modal" data-target="#myModal1" data-dismiss="modal"  class="text-decoration-none">Click here</a> to Sign Up</p>
           </div>
          <script>
          function hide4(){
              $("#forgotPassDiv").slideUp(3000)
            }

            $(document).ready(function(){
              $("#forgotPass").modal("show")
              $("#forgotPassP").css({"color":"red"})
            setTimeout("hide4()",10000)
            })
          </script><%}session.setAttribute("dbemail", "email");
          session.setAttribute("dbemail2", "email");
          %>
         <form action="ForgotPassword" method="post" enctype="multipart/form-data">
        
           <p>Enter your Email-Id or Phone Number</p>
          <div class="input-group m-1 ">
          <input type="text" name="email" id="" class="form-control" placeholder="Ex- example@gmail.com (or) 9999-159-759">
          <div class="input-group-append">
            <button type="submit" name="forgotSubmit" value="1" class="btn btn-primary"  >Go</button>
          </div>
          </div>
           </form>
        </div>
         </div>
      </div>
    </div>
  </div>
  <div class="container">
    <div class="modal fade" id="newPass">
      <div class="modal-dialog ">
        <div class="modal-content">
         <div class="modal-header">
           <h4 >Change Password</h4>
          <button class="close" type="button" data-dismiss="modal">&times</button>
         </div>
         <div class="modal-body">
          <form action="UpdatePassword" method="post" enctype="multipart/form-data">
            <label for="">New Password</label>
            <div class="form-group input-group">
              <input type="password" class="form-control" id="newPass1">
              <div class="input-group-append">
                <i class="fas fa-eye-slash p-2 input-group-text form-control" id="eyeSlash"></i>
                <i class="fas fa-eye p-2 input-group-text form-control" id="eye"></i>
              </div>
            </div>
            <label for="">Confirm Password</label>
            <div class="form-group input-group">
              <input type="password" class="form-control" id="confirmPass" name="newPass">
              <div class="input-group-append">
                <i class="fas fa-eye-slash p-2 input-group-text form-control" id="eyeSlashCon"></i>
                <i class="fas fa-eye p-2 input-group-text form-control" id="eyeCon"></i>
              </div>
            </div>
            <div class="form-group">
            <span id="conSpan"></span>
          </div>
            <button type="submit" class="btn btn-primary" name="newPassSubmit" value="1">Change Password</button>
          </form>
          </div>
          </div>
        </div>
         </div>
        </div>
        <script>
          $(document).ready(function(){
            $("#eye").hide()
            $("#eyeCon").hide()
            var newPass;
            $("#newPass1").keyup(function(){
              newPass=$("#newPass1").val()
              var confirmPass=$("#confirmPass").val()
              if(newPass==confirmPass){
                 $("#conSpan").text("Passwords match")
                 $("#conSpan").css({"color":"green"})
              }
              else{
                if(confirmPass==""){
                 $("#conSpan").text("")
                }
                else{
               $("#conSpan").text("Passwords dosen't match")
                 $("#conSpan").css({"color":"red"})
                 console.log("in else "+confirmPass)
                }
              }
        })
         $("#confirmPass").keyup(function(){
           var confirmPass=$("#confirmPass").val()
           if(newPass==confirmPass){
              $("#conSpan").text("Passwords match")
              $("#conSpan").css({"color":"green"})
           }
           else{
             if(confirmPass==""){
              $("#conSpan").text("")
             }
             else{
            $("#conSpan").text("Passwords dosen't match")
              $("#conSpan").css({"color":"red"})
              console.log("in else "+confirmPass)
             }
           }
         })
         $("#eyeSlash").click(function(){
          var newPass1=document.getElementById("newPass1")
          if(newPass1.type==="password"){
            newPass1.type="text"
            $("#eyeSlash").hide()
            $("#eye").show()
          }
          else{
            newPass1.type="password"
            $("#eyeSlash").show()
            $("#eye").hide()
           
          }
         })
         $("#eye").click(function(){
          var newPass1=document.getElementById("newPass1")
          if(newPass1.type==="text"){
            newPass1.type="password"
               $("#eyeSlash").show()
            $("#eye").hide()
          }
          else{
            newPass1.type="text"
              $("#eyeSlash").hide()
            $("#eye").show()
          }
         })
         $("#eyeCon").click(function(){
           var confirmPass=  document.getElementById("confirmPass")
           if(confirmPass.type==="text"){
            confirmPass.type="password"
               $("#eyeSlashCon").show()
              $("#eyeCon").hide()
          }
          else{
            newPass1.type="text"
              $("#eyeSlashCon").hide()
            $("#eyeCon").show()
          }
           })
           $("#eyeSlashCon").click(function(){
           var confirmPass=document.getElementById("confirmPass")
           if(confirmPass.type==="password"){
            confirmPass.type="text"
               $("#eyeSlashCon").hide()
              $("#eyeCon").show()
          }
          else{
            newPass1.type="password"
              $("#eyeSlashCon").show()
            $("#eyeCon").hide()
          }
           })
          })
        </script>
    <div class="cointainer">
      <div class="modal fade" id="myModal1">
        <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
          <div class="modal-header">
            <h4>Sign Up</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          <div class="modal-body">
          <%  String s1=(String) sessionlog.getAttribute("exists");
          if("exists".equals(s1)){%>
           <div id="existsEmail">
              <p id="existEmail">This Email/Phone Number already exist <a href="" class="text-decoration-none " data-dismiss="modal" data-toggle="modal" data-target="#forgotPass">Click here</a> to reset your password or <a href="" class="text-decoration-none" data-dismiss="modal" data-toggle="modal" data-target="myModal">Click here</a> to login</p>
            </div>
            <script>
            function hide5(){
                $("#existsEmail").slideUp(3000)
              }
              $(document).ready(function(){
                $("#myModal1").modal("show")
                $("#existEmail").css({"color":"red"})
              setTimeout("hide5()",10000)
              })
            </script><%}sessionlog.setAttribute("exists", "notExists"); %>
      <form action="SignUp" method="post" enctype="multipart/form-data">
     
      <div class="row">
      <div class="col"> First name <input type="text" class="form-control" placeholder="Enter  First name" name="firstName"></div>
      <div class="col">Last name <input type="text" class="form-control" placeholder="Enter last name" name="lastName"></div>
      </div> <br>
      <div class="form-group">
        Email <input type="email" class="form-control" placeholder="Enter email" name="email">
      </div>
      <label for="">Password</label>
            <div class="form-group input-group">
              <input type="password" class="form-control" id="passS">
              <div class="input-group-append">
                <i class="fas fa-eye-slash p-2 input-group-text form-control" id="eyeSlashS"></i>
                <i class="fas fa-eye p-2 input-group-text form-control" id="eyeS"></i>
              </div>
            </div>
      <label for="">Confirm Password</label>
            <div class="form-group input-group">
              <input type="password" class="form-control" id="confirmPassS" name="password">
              <div class="input-group-append">
                <i class="fas fa-eye-slash p-2 input-group-text form-control" id="eyeSlashConS"></i>
                <i class="fas fa-eye p-2 input-group-text form-control" id="eyeConS"></i>
              </div>
            </div>
            <div class="form-group">
              <span id="conSpanS"></span>
            </div>
      <div class="form-group">
        Phone number <input type="number" class="form-control" placeholder="Enter phone number" name="phnumber">
      </div>
      <div class="form-group">
        DOB <input type="date" class="form-control" name="dob">
      </div>
     
      <div class="form-group form-check">
        <label for="" class="ml-n3">Gender</label>
        <br> <input type="radio" class="form-check-input" name="gender" value="male" >Male&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="radio" class="form-check-input" name="gender" value="female" >Female&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="radio" class="form-check-input" name="gender" value="custom" >Custom
      </div>
      <div class="form-group">
        <button type="submit" class="btn btn-primary" name="submitUp" value="1">Sign Up</button>
        <p  class="float-right"><a href=""  data-toggle="modal" data-target="#myModal"  data-dismiss="modal"> Already have an account?</a></p>
      </div>
      </form>
    </div>
    </div>
  </div>
</div>
    </div>
     <script>

          $(document).ready(function(){
            $("#eyeS").hide()
            $("#eyeConS").hide()
            var newPass;
            $("#passS").keyup(function(){
              newPass=$("#passS").val()
              var confirmPass=$("#confirmPassS").val()
              if(newPass==confirmPass){
                 $("#conSpanS").text("Passwords match")
                 $("#conSpanS").css({"color":"green"})
              }
              else{
                if(confirmPass==""){
                 $("#conSpanS").text("")
                }
                else{
               $("#conSpanS").text("Passwords dosen't match")
                 $("#conSpanS").css({"color":"red"})
                 console.log("in else "+confirmPass)
                }
              }
        })
         $("#confirmPassS").keyup(function(){
           var confirmPass=$("#confirmPassS").val()
           if(newPass==confirmPass){
              $("#conSpanS").text("Passwords match")
              $("#conSpanS").css({"color":"green"})
           }
           else{
             if(confirmPass==""){
              $("#conSpanS").text("")
             }
             else{
            $("#conSpanS").text("Passwords dosen't match")
              $("#conSpanS").css({"color":"red"})
              console.log("in else "+confirmPass)
             }
           }
         })
         $("#eyeSlashS").click(function(){
          var newPass1=document.getElementById("passS")
          if(newPass1.type==="password"){
            newPass1.type="text"
            $("#eyeSlashS").hide()
            $("#eyeS").show()
          }
          else{
            newPass1.type="password"
            $("#eyeSlashS").show()
            $("#eyeS").hide()
           
          }
         })
         $("#eyeS").click(function(){
          var newPass1=document.getElementById("passS")
          if(newPass1.type==="text"){
            newPass1.type="password"
               $("#eyeSlashS").show()
            $("#eyeS").hide()
          }
          else{
            newPass1.type="text"
              $("#eyeSlashS").hide()
            $("#eyeS").show()
          }
         })
         $("#eyeConS").click(function(){
           var confirmPass=  document.getElementById("confirmPassS")
           if(confirmPass.type==="text"){
            confirmPass.type="password"
               $("#eyeSlashConS").show()
              $("#eyeConS").hide()
          }
          else{
            newPass1.type="text"
              $("#eyeSlashConS").hide()
            $("#eyeConS").show()
          }
           })
           $("#eyeSlashConS").click(function(){
           var confirmPass=  document.getElementById("confirmPassS")
           if(confirmPass.type==="password"){
            confirmPass.type="text"
               $("#eyeSlashConS").hide()
              $("#eyeConS").show()
          }
          else{
            newPass1.type="password"
              $("#eyeSlashConS").show()
            $("#eyeConS").hide()
          }
           })
          })
       

   </script>
    <section>
        <!-- required bootstrap js -->
        <!-- add 'carousel-slider' snippet in css -->
        <div id="demo" class="carousel slide border mx-5" data-ride="carousel" >
          <ul class="carousel-indicators">
            <li data-target="#demo" data-slide-to="0" class="active"></li>
            <li data-target="#demo" data-slide-to="1"></li>
            <li data-target="#demo" data-slide-to="2"></li>
          </ul>
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img src="libimg.jpg" alt="library image 1" >
              <div class="carousel-caption">
                <h3>Title</h3>
                <p>Caption</p>
              </div>
            </div>
            <div class="carousel-item">
              <img src="libimg2.jpg" alt="library image 2">
              <div class="carousel-caption">
                <h3>Title</h3>
                <p>Caption</p>
              </div>
            </div>
            <div class="carousel-item">
              <img src="libimg6.jpg" alt="library image 3">
              <div class="carousel-caption">
                <h3>Title</h3>
                <p>Caption</p>
              </div>
            </div>
          </div>
          <a class="carousel-control-prev" href="#demo" data-slide="prev">
            <span class="carousel-control-prev-icon"></span>
          </a>
          <a class="carousel-control-next" href="#demo" data-slide="next">
            <span class="carousel-control-next-icon"></span>
          </a>
        </div>
        <br>
        <div class="container-fluid">
            <h4 >Most popular</h4>
        <div class=" card-group">   
       <div class="card  m-1"  >
        <img class="card-img-top"src="richdad.jpg"height="250px" alt="book image">
           <div class="card-body display-4">
         <h6>Rich Dad Poor Dad</h6>
           </div>
        </div>
        <div class="card  m-1"  >
         <img class="card-img-top"src="1984.jpg" height="250px"alt="book image">
            <div class="card-body display-4">
          <h6>1984</h6>
            </div>
        </div>
        <div class="card  m-1"  >
         <img class="card-img-top"src="410714f480fd3c96aad7af27ddb64e18.jpg"height="250px" alt="book image">
            <div class="card-body display-4">
          <h6>Sherlock Holmes</h6>
            </div>
        </div>
        <div class="card  m-1"  >
         <img class="card-img-top"src="71KzdO9n5uL.jpg"height="250px" alt="book image">
            <div class="card-body display-4">
          <h6>The Famous Five</h6>
            </div>
        </div>
        <div class="card  m-1"  >
         <img class="card-img-top"src="9781472255099.jpg" height="250px"alt="book image">
            <div class="card-body display-4">
          <h6>The Girl in the Letter</h6>
            </div>
        </div>
        <div class="card  m-1"  >
         <img class="card-img-top"src="Cover-Final-Photograph-the-Night-Sky-copy2.jpg" height="250px"alt="book image">
            <div class="card-body display-4">
          <h6>Photograph the Night Sky</h6>
            </div>
        </div>
        <div class="card  m-1"  >
            <img class="card-img-top"src="why-we-sleep-9781501144325_lg.jpg"height="250px" alt="book image">
               <div class="card-body display-4">
             <h6>why we sleep</h6>
               </div>
           </div>
    </div>
    </div>
    <br>
    <!-- <div class="container text-center ">
      
        <h3>Subscribe Now</h3>
        <p class="text-secondary">Be the first to know about discounts and offers</p>
        <div class="input-group  "style="padding-left:380px">
        <input  type="email" name="" id="" placeholder="Ex-example@gmail.com" style="width:300px; border-radius:10px 0px 0px 10px;">
        <div class="input-group-append">
         <button class="btn btn-success" type="submit" style="border-radius:0px 10px 10px 0px;">Subscribe</button>  
         </div>
        
   </div>
    </div> -->
    <div class="container">
        <h4>News & Events</h4>
        <div class="d-flex ">
        <div class="border w-25 m-1 flex-fill bg-success "><h5>Coronavirus: Libraries in Sheffield close due to transmission fears and volunteer shortages</h5>
        <p>Sheffield City Council announced that a number of libraries in the city would be closing until further notice due to a lack of volunteer availability.The libraries included in the list of closures were: Frecheville, Gleadless, Newfield Green, Totley library, Upperthorpe Library and Stannington Library.</p>
        </div>
        <div class="border w-25 m-1 flex-fill  bg-white"><h5>The act of hoarding books now has a word for it; find out</h5>
        <p>There are text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p></div>
        <div class="border w-25 m-1 flex-fill bg-success"><h5>'Parents should read to their child daily,' says educator Dalbir Kaur Madan</h5><p>There are text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p></div>
        <div class="border w-25 m-1 flex-fill bg-warning"><h5>Karnataka University develops ‘Green’ library to motivate reading among students</h5><p>There are text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p></div>
        </div>
    </div>
    <br>
    <div class="container">
      <h4>Pricing</h4>
    <div class="card-deck">     
           <div class="card text-center ">
              <div class="card-head "><h3>Monthly plan</h3></div>
              <div class="card-body display-4 ">300 <sub>INR</sub></div>
              <div class="card-footer"><a class="text-decoration-none" href="#card-deck">Purchase</a></div>
           </div>
           <div class="card text-center ">
            <div class="card-head "><h3>Quaterly plan</h3></div>
            <div class="card-body display-4 ">999 <sub>INR</sub></div>
            <div class="card-footer"><a class="text-decoration-none" href="#card-deck">Purchase</a></div>
         </div>
          <div class="card text-center ">
            <div class="card-head "><h3>Yearly plan</h3></div>
            <div class="card-body display-4 ">2999 <sub>INR</sub></div>
            <div class="card-footer "><a class="text-decoration-none" href="#card-deck">Purchase</a></div>
          </div>     
    </div>
  </div>
  <br>
  <div class="container">
     <h4>Testimonials</h4>
     <div id="demo1" class="carousel slide" data-ride="carousel">
      <ul class="carousel-indicators">
        <li data-target="#demo1" data-slide-to="0" class="active"></li>
        <li data-target="#demo1" data-slide-to="1"></li>
        <li data-target="#demo1" data-slide-to="2"></li>
        <li data-target="#demo1" data-slide-to="3"></li>
      </ul>
      <div class="carousel-inner one">
        <div class="bg-light shadow-lg p-4  carousel-item active"> <span class="rounded-circle spanintesti" style="background-image:url(testi3.jpg);"></span><p>“I just received my first reminder and I'm so happy that it works! My library's new system change was causing me to owe dues every time I checked out books so I stopped using the library. Now we can enjoy checking out books again!”</p><h6>Allen</h6></div>
        <div class="bg-light  shadow-lg p-4  carousel-item"> <span class="rounded-circle spanintesti" style="background-image:url(test4.jpeg);"></span> <p>“I just received my first reminder and I'm so happy that it works! My library's new system change was causing me to owe dues every time I checked out books so I stopped using the library. Now we can enjoy checking out books again!”</p><h6>Jessy</h6></div>
        <div class="bg-light carousel-item shadow-lg p-4"> <span class="rounded-circle spanintesti" style="background-image:url(test123.jpg);"></span><p>“I just received my first reminder and I'm so happy that it works! My library's new system change was causing me to owe dues every time I checked out books so I stopped using the library. Now we can enjoy checking out books again!”</p><h6>Kevin</h6></div>
        <div class="bg-light carousel-item shadow-lg p-4"> <span class="rounded-circle spanintesti" style="background-image:url(testi2.jpg);"></span><p>“I just received my first reminder and I'm so happy that it works! My library's new system change was causing me to owe dues every time I checked out books so I stopped using the library. Now we can enjoy checking out books again!”</p><h6>Stacy</h6></div>
      </div>
      <a class="carousel-control-prev" href="#demo1" data-slide="prev">
        <span class="carousel-control-prev-icon"></span>
      </a>
      <a class="carousel-control-next" href="#demo1" data-slide="next">
        <span class="carousel-control-next-icon"></span>
      </a>
     </div>
  </div>
  <br>
  <div class="container text-center">
    <h3>Subscribe Now</h3>
    <p class="text-secondary">Be the first to know about discounts and offers</p>
    <div class="input-group  "style="padding-left:380px">
    <input  type="email" name="" id="" placeholder="Ex-example@gmail.com" style="width:300px; border-radius:10px 0px 0px 10px;">
    <div class="input-group-append">
     <button class="btn btn-success" type="submit" style="border-radius:0px 10px 10px 0px;">Subscribe</button>  
     </div>
     </div>
  </div>
  <br>
     <div class="container" id="contactUs" >
       <h4>Contact Us</h4>
       <form action="#">
         <div class="row">
           <div class="col">First name<input class="form-control"type="text" placeholder="Enter First name"></div>
           <div class="col">Last name<input class="form-control"type="text" placeholder="Enter Last name"></div>
         </div><br>
        
         <div class="row">
          <div class="col">Email<input class="form-control"type="email" placeholder="Enter email"></div>
          <div class="col">Phone number<input class="form-control"type="number" placeholder="Enter Phone number"></div>
         </div><br>
         <div class="row w-50">
          <div class="col">Subject<textarea class="form-control" type="text" style="height:100px" placeholder="Message"></textarea></div>
        </div>
        <button type="submit" class="btn btn-primary mt-3">Submit</button>
       </form>
     </div>
    </section>
    <br>
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


