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
      <h1>All Games</h1>

      <p class="lead">Check  out all game available now!!!</p>
    </div>

    <p><a class="btn btn-lg btn-primary" href="<spring:url value="/admin/gameInventory/addGame"/>" role="button">Add New Game</a></p>

    <table class="table table-striped table-hover">
      <thead>
      <tr class="bg-success">
        <th>Photo Thumb</th>
        <th> Game Name</th>
        <th>Game Version</th>
        <th>Game Maker</th>
        <th></th>
      </tr>
      </thead>
      <c:forEach items="${game}" var="game">
        <tr>
          <td><img src="<c:url value="/resources/images/${game.gameID}.png"/>" alt="image"  style="height: 5%" /></td>
          <td>${game.name}</td>
          <td>${game.version}</td>
          <td>${game.manufacturer}</td>
          <td> <a href="<spring:url value="/gamelist/viewgame/${game.gameID}"/>"

                  > <span class="glyphicon glyphicon-info-sign"></span></a>
            <a href="<spring:url value="/admin/gameInventory/deleteGame/${game.gameID}"/>"

                    > <span class="glyphicon glyphicon-remove-circle "></span></a>


          </td>
        </tr>
      </c:forEach>
    </table>

    <%@include file="/WEB-INF/views/template/footer.jsp"%>
