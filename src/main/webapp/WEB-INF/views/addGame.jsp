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
<%@include file="/WEB-INF/views/template/header.jsp" %>


<div class="container-wrapper">

    <div class="container">


        <div class="page-header">
            <h1>Add New Game</h1>

            <p class="lead">Enter Information for the new game</p>
        </div>


        <form:form action="${pageContext.request.contextPath}/admin/gameInventory/addGame" method="post"
                   commandName="game"  enctype="multipart/form-data">
        <div class="form-group" >

            <label for="name">Game Name</label>
            <form:input path="Name" id="name" class="form-control"/>
        </div>

        <div class="form-group">

            <label for="manufacturer">Game Maker</label>
            <form:input path="Manufacturer" id="manufacturer" class="form-control"/>
        </div>
        <div class="form-group">

            <label for="version">Game Version</label>
            <form:input path="Version" id="version" class="form-control"/>
        </div>

        <div class="form-group">

            <label for="description">Game Description</label>
            <form:textarea path="Description" id="description" class="form-control"/>
        </div>
        <div class="form-group">

            <label for="category">Game Category</label>
            <form:select path="Category" id="category" class="form-control">
                <form:option value="Strategy">Strategy</form:option>
                <form:option value="Action">Action</form:option>
                <form:option value="Shooting">Shooting</form:option>
                <form:option value="Arcade">Arcade</form:option>
                <form:option value="Sports">Sports</form:option>
                <form:option value="Adventure">Adventure</form:option>
                <form:option value="Fighting">Fighting</form:option>
                <form:option value="Mystery">Mystery</form:option>
                <form:option value="Simulation">Simulation</form:option>
                <form:option value="Racing">Racing</form:option>
                <form:option value="Fantasy">Fantasy</form:option>
            </form:select>

        </div>

        <div class="form-group">

            <label for="gameImage">Game Image</label>
            <form:input path="gameImage" id="gameImage" type="file" class="form-control"/>
        </div>
        <div class="form-group">

            <label for="trailer">Game Trailer Location</label>
            <form:input path="Trailer_location" id="trailer" class="form-control"/>
        </div>
        <div class="form-group">

            <label for="download_link">Game Download Link</label>
            <form:input path="Download_link" id="download_link" class="form-control"/>
        </div>
        <br><br>

        <input type="submit" value="submit" class=" btn btn-success"/>

        <a href="<c:url value="/admin/gameInventory" />" class=" btn btn-danger">Cancel</a>


        </form:form>

        <%@include file="/WEB-INF/views/template/footer.jsp" %>
