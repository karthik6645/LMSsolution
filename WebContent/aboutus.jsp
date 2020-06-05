<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/c795ee9098.js" crossorigin="anonymous"></script>
<style>
    p{
        text-indent: 100px;
        text-align: justify;
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
    <%
    HttpSession sessionlog2=request.getSession();
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
        <div class="container-fluid w-75 text-indent"><br>
        <h2 class="mx-auto" style="width: 150px;" >About Us</h2>
       
        <img src="aboutus.jpg" class="rounded my-5 mr-5" alt="photo" style="float: left;"width="504" height="436">
        <h4>Who We Are</h4>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce at porta mi. Maecenas magna elit, vulputate sed egestas sed, iaculis a dui. In sit amet ante id leo hendrerit efficitur ac eu ipsum. Cras varius dolor dolor, vitae ultrices dui blandit sit amet. Duis fermentum nulla quis nibh posuere mattis. Cras id blandit purus. Praesent malesuada augue sit amet lobortis vestibulum. Cras risus ex, sagittis non turpis vitae, blandit aliquam tellus. Proin eget semper libero. Interdum et malesuada fames ac ante ipsum primis in faucibus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla nisl turpis, consectetur eu nisi in, pharetra viverra lectus. Vivamus dapibus massa a dui accumsan cursus. Aenean hendrerit varius magna, lacinia vehicula purus gravida sed. Praesent semper odio vitae ex sollicitudin, quis cursus ipsum dictum.</p><br>
        <img src="aboutus2.png" alt="photo"  class="rounded ml-5 mb-5" style="float: right;"width="504" height="436"><br>
       <h4 class="">Why Does Book Access Matter?</h4>
        <p>Duis vel sagittis nunc. Donec ut sem mi. Aenean cursus nibh in ex dapibus aliquet. Nam sagittis, nisi ac venenatis tristique, eros nunc tempus felis, at pharetra turpis neque tempus nisl. Maecenas mollis hendrerit eros, et cursus urna congue sed. Fusce eget augue arcu. Duis pharetra dui vitae augue tempor viverra. Praesent maximus arcu nec laoreet commodo. Pellentesque tincidunt, purus vel fringilla consectetur, sem felis tempus leo, a aliquet orci tellus id enim. Fusce tincidunt turpis purus, sit amet cursus purus maximus vel. Vivamus lacinia volutpat orci, quis viverra diam varius a. Integer luctus, ex eget luctus malesuada, tortor leo mollis augue, quis convallis orci orci eget arcu. Nulla nulla sem, hendrerit in hendrerit a, bibendum nec mi. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque cursus elit sed pharetra consequat. Phasellus interdum nisi orci, a rhoncus nunc pharetra ut.</p>
        <h4>More information</h4>
        <p>Duis volutpat volutpat ligula quis porta. Aliquam et gravida lacus. Nulla ornare facilisis ligula vitae aliquet. Morbi condimentum orci dolor, a suscipit metus sodales quis. Sed justo elit, mattis non sagittis non, consequat non diam. Nunc sit amet porttitor ligula. Duis facilisis tellus a purus consectetur, non ultricies libero aliquet. Sed bibendum ornare est non aliquet. In nec lectus eleifend, lobortis neque sed, dictum ipsum. Quisque at tortor orci.</p>
        <p>Sed nec augue in diam fermentum dapibus nec non orci. Aenean commodo nisi ut est molestie placerat. Morbi non pulvinar lacus, eu lobortis enim. Quisque pulvinar mauris varius auctor pellentesque. Maecenas sollicitudin venenatis est, non aliquam libero tristique vel. Sed erat diam, porta eget sapien vel, vulputate malesuada dolor. Fusce ullamcorper elit sem, ac congue dui ultricies in. Fusce vehicula, ligula eget ultrices sodales, mauris sem vestibulum nibh, in dapibus lacus tellus non neque. Maecenas iaculis, diam at finibus cursus, elit neque vestibulum massa, sed blandit nibh erat id leo. Quisque mollis ipsum quis finibus scelerisque.</p><br>
    </div>
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