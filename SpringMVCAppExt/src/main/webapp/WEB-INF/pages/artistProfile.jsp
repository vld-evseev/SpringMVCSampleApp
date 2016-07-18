<!doctype html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<jsp:include page="head.jsp"/>

<body>
<div class="container">
    <div class="wrapper">

        <jsp:include page="menubar.jsp"/>

        <div id="page-wrapper" style="min-height: 626px;">
            <div class="row" style="position: relative;">
                <c:if test="${!empty artist}">
                    <h2>${artist.name}</h2>

                    <c:choose>
                        <c:when test="${!empty albums}">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h3>Albums</h3>
                                        </div>
                                        <!-- .panel-heading -->
                                        <div class="panel-body">
                                            <div class="panel-group" id="accordion">
                                                <c:forEach items="${albums}" var="album">


                                                    <div class="panel panel-default">
                                                        <div class="panel-heading">
                                                            <h4 class="panel-title">
                                                                <a data-toggle="collapse" data-parent="#accordion"
                                                                   href="#${album.id}" aria-expanded="false"
                                                                   class="collapsed">
                                                                        ${album.year} - ${album.name}
                                                                    <div class="pull-right">
                                                                        <spring:url
                                                                                value="/artistProfile/${artist.id}/editAlbum/${album.id}"
                                                                                var="editAlbumUrl"/>
                                                                        <button type="button"
                                                                                class="btn btn-warning btn-circle"
                                                                                onclick="location.href='${editAlbumUrl}'">
                                                                            <i class="fa fa-list"></i>
                                                                        </button>

                                                                        <spring:url
                                                                                value="/artistProfile/${artist.id}/deleteAlbum/${album.id}"
                                                                                var="deleteAlbumUrl"/>
                                                                        <button type="button"
                                                                                class="btn btn-danger btn-circle"
                                                                                onclick="this.disabled=true; post('${deleteAlbumUrl}')">
                                                                            <i class="fa fa-times"></i>
                                                                        </button>
                                                                    </div>
                                                                </a>
                                                            </h4>
                                                        </div>
                                                        <div id="${album.id}" class="panel-collapse collapse"
                                                             aria-expanded="false" style="height: 0px;">
                                                            <div class="panel-body">
                                                                <c:if test="${!empty album.tracks}">
                                                                    <c:forEach items="${album.tracks}" var="track">
                                                                        <li>${track.position}. ${track.name}
                                                                            (${track.length})
                                                                        </li>
                                                                    </c:forEach>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </c:forEach>
                                            </div>
                                        </div>
                                        <!-- .panel-body -->
                                    </div>
                                    <!-- /.panel -->
                                </div>
                                <!-- /.col-lg-12 -->
                            </div>

                        </c:when>
                        <c:otherwise>
                            <p class="text-warning">
                            <h3>No albums found yet</h3></p>
                        </c:otherwise>
                    </c:choose>

                    <spring:url value="/artistProfile/${artist.id}/addAlbum" var="addAlbumUrl"/>
                    <button type="submit" class="btn btn-primary" onclick="location.href='${addAlbumUrl}'">
                        <i class="fa fa-plus-circle" aria-hidden="true"></i> Add album
                    </button>

                    <spring:url value="/delete/${artist.id}" var="deleteArtistUrl"/>
                    <spring:url value="/artistProfile/${artist.id}/update" var="editArtistUrl"/>
                    <div class="pull-right">
                        <button class="btn btn-warning" onclick="location.href='${editArtistUrl}'">
                            Edit
                        </button>
                        <button class="btn btn-danger" onclick="this.disabled=true; post('${deleteArtistUrl}')">
                            Delete
                        </button>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>
</body>
</html>