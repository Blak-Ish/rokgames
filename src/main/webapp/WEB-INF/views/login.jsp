<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Dare
  Date: 11/03/2016
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@include file="/WEB-INF/views/template/header.jsp"%>





<div class="container-wrapper">

  <div  class="container">


    <div class="page-header">
      <h1>Admin Login Page</h1>

      <p class="lead">Enter Login Details Below</p>
      <c:if test="${not empty  msg}">
        <div class="msg">
          ${msg}
        </div>
      </c:if>
    </div>
   <div id="login-box">

     <form name="loginForm" action="<c:url value="/j_spring_security_check" />" method="post">
        <div class="form-group">

          <c:if test="${not empty error}">
            <div class="error" style="color: red">
            ${error}</div>
          </c:if>
          <label for="username">Username</label>
          <input id="username" type="text" name="username" class="form-control"/>
        </div>

       <div class="form-group">
         <label for="password">Password</label>
         <input id="password" type="password" name="password" class="form-control"/>
       </div>

       <input type="submit" value="Submit" class="btn btn-default" />

       <input  type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

     </form>
     </div>





    <%@include file="/WEB-INF/views/template/footer.jsp"%>
