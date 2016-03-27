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
      <h1>Admin Home Page</h1>

      <p class="lead">This id the Admin Home page</p>
      <c:if test="${pageContext.request.userPrincipal.name!=null}">

        <h2>
          Welcome : ${pageContext.request.userPrincipal.name}
        </h2>
      </c:if>
      <p><a href="<c:url value="/j_spring_security_logout"/>">Logout</a> </p>
    </div>

    <h3>

       <a href="<c:url value="/admin/gameInventory" />">Game Inventory</a>
    </h3>








    <%@include file="/WEB-INF/views/template/footer.jsp"%>
