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
      <h1>Game Details</h1>

      <p class="lead">here are the details of the game</p>
    </div>


        <div class="container">

              <div class="row">
                     <div class="col-md-5">
                           <img src="<c:url value="/resources/images/${game.gameID}.png"/>" alt="image" style=" width:100%; height:300px" />
                     </div>
                     <div class="col-md-5">
                       <h3>${game.name}</h3>
                       <h4>
                         <strong>Game Maker :</strong>
                       ${game.manufacturer}</h4>
                       <h4>
                       <strong>System Requirements  :</strong>
                       ${game.requirements}</h4>
                       <h4> <strong>Game Trailer :</strong>
                         ${game.trailer_location}</h4>
                       <h4>
                       <strong>Game Version :</strong>
                       ${game.version}</h4>
                       <p><a class="btn btn-lg btn-primary" href="<spring:url value="${game.download_link}"/>" role="button">Click Here To Download</a></p>

                     </div>


              </div>
          </div>
      <div class="container">


          <div class="row">,
              <h3>Comments</h3>

                  <c:if test="${comment !=null}"  >
                       <c:forEach  items="${commentList}" var="cmt" >


                               <blockquote>
                                     <h3>  ${cmt.content}</h3>
                                   <footer>${cmt.commentorName}</footer>



                               </blockquote>


                  </c:forEach>
                  </c:if>

              </div>
              <p></p>
              <div class="col-md-5">
                  <h3>Enter Your Comment Below</h3>

                  <form:form action="${pageContext.request.contextPath}/gamelist/viewgame/${game.gameID}/addcomment" method="post"
                             commandName="comment">
                      <div class="form-group">
                      <label for="commentorName">Enter a Name</label>
                      <form:input path="commentorName" id="commentorName" class="form-control"/>
                      </div>
                      <div class="form-group">
                          <label for="email">Enter your  email</label>
                          <form:input path="email" id="email" class="form-control"/>
                      </div>
                      <div class="form-group">
                          <label for="Content">Content</label>
                          <form:textarea path="Content" id="Content"  class="form-control"/>
                      </div>

                      <input type="submit" value="submit" class=" btn btn-success"/>
                  </form:form>

              </div>

          </div>
      </div>


    <%@include file="/WEB-INF/views/template/footer.jsp"%>
