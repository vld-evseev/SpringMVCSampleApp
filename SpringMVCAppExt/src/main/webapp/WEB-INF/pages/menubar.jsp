<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="<c:url value="/" />">Music collection</a>
    </div>

    <!-- /.navbar-header -->
    <ul class="nav navbar-top-links navbar-right">
        <!-- /.dropdown -->
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li>
                    <a href="#" data-toggle="tooltip" data-placement="left" title="Not implemented yet"><i
                            class="fa fa-user fa-fw"></i>
                        User Profile
                    </a>
                </li>
                <li>
                    <a href="#" data-toggle="tooltip" data-placement="left" title="Not implemented yet"><i
                            class="fa fa-gear fa-fw"></i>
                        Settings
                    </a>
                </li>
                <li class="divider"></li>
                <li>
                    <a href="<c:url value="/" />" data-toggle="tooltip" data-placement="left"
                       title="Not implemented yet"><i class="fa fa-sign-out fa-fw"></i>
                        Logout
                    </a>
                </li>
            </ul>
            <!-- /.dropdown-user -->
        </li>
        <!-- /.dropdown -->
    </ul>
    <!-- /.navbar-top-links -->

    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
                <li class="sidebar-search">
                    <div class="input-group">
                        <spring:url value="/artist/new" var="newArtist"/>
                        <button type="submit" class="btn btn-primary" onclick="location.href='${newArtist}'">
                            <i class="fa fa-plus-circle" aria-hidden="true"></i> Add artist
                        </button>
                    </div>
                    <!-- /input-group -->
                </li>

                <c:if test="${!empty artists}">
                    <c:forEach items="${artists}" var="artist">
                        <li>
                            <a href="<c:url value="/artistProfile/${artist.id}" />">${artist.name}</a>
                        </li>
                    </c:forEach>
                </c:if>
            </ul>
        </div>
        <!-- /.sidebar-collapse -->
    </div>
    <!-- /.navbar-static-side -->
</nav>


