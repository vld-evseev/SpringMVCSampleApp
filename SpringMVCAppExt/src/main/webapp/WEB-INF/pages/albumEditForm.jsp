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

        <spring:url value="/artistProfile/${artistId}/addAlbum" var="albumProfile"/>

        <div id="page-wrapper" style="min-height: 626px;">
            <c:choose>
                <c:when test="${albumForm['new']}">
                    <h2>Add new album</h2>
                </c:when>
                <c:otherwise>
                    <h2>Edit</h2>
                </c:otherwise>
            </c:choose>
            <br/>

            <form:form method="post" modelAttribute="albumForm" action="${albumProfile}">
                <form:hidden path="id"/>

                <form:hidden path="artist_id"/>

                <spring:bind path="name">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label>Name</label>
                        <div>
                            <form:input path="name" type="text" class="form-control" id="name" placeholder="Name"/>
                            <form:errors path="name" class="control-label"/>
                        </div>
                    </div>
                </spring:bind>

                <spring:bind path="year">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label>Year</label>
                        <div>
                            <form:input path="year" type="number" min="1900" class="form-control" id="year"
                                        placeholder="Year"/>
                            <form:errors path="year" class="control-label"/>
                        </div>
                    </div>
                </spring:bind>

                <spring:bind path="length">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label>Length</label>
                        <div>
                            <form:input path="length" type="text" class="form-control" id="length"
                                        placeholder="Length"/>
                            <form:errors path="length" class="control-label"/>
                        </div>
                    </div>
                </spring:bind>

                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <c:if test="${!empty albumForm.tracks}">
                        <div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Tracklist
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover" id='tracklistTable'>
                                            <thead>
                                            <tr>
                                                    <%--<th></th>--%>
                                                <th>N</th>
                                                <th>Title</th>
                                                <th>Length</th>
                                            </tr>
                                            </thead>
                                            <tbody>

                                            <c:forEach items="${albumForm.tracks}" var="track" varStatus="status">
                                                <c:set var="tracksCount" scope="session" value="${status.count}"/>
                                                <c:set var="currentStatusValue" scope="session"
                                                       value="${status.index}"/>
                                                <tr id="trackTr${status.index}" class="removable">
                                                    <form:hidden path="tracks[${status.index}].id"/>
                                                    <td class="col-md-1">
                                                        <form:input path="tracks[${status.index}].position"
                                                                    value="${track.position}"/>
                                                    </td>
                                                    <td class="col-md-1">
                                                        <form:input path="tracks[${status.index}].name"
                                                                    value="${track.name}"/>
                                                    </td>
                                                    <td class="col-md-1">
                                                        <form:input path="tracks[${status.index}].length"
                                                                    value="${track.length}"/>
                                                    </td>

                                                    <td class="col-md-1">
                                                        <button type="button"
                                                                class="btn btn-danger btn-circle removeButton"
                                                                style="display: none;" id="Tr${status.index}">
                                                            <i class="fa fa-times"></i>
                                                        </button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>

                                        <button type="button" class="btn btn-success" id='addButton'>
                                                <%--<i class="fa fa-plus-circle"/>--%> Add track
                                        </button>
                                    </div>
                                    <!-- /.table-responsive -->
                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                        </div>
                    </c:if>
                </div>

                <button type="submit" class="btn btn-primary" id="submitRow">
                    <i class="fa fa-check" aria-hidden="true"></i> Save
                </button>
            </form:form>
        </div>
    </div>

</div>

<script type="text/javascript">
    $(document).ready(function () {
        $(document).on('mouseenter', '.removable', function () {
            $(this).find(".removeButton").show();
        }).on('mouseleave', '.removable', function () {
            $(this).find(".removeButton").hide();
        });
    });
</script>

<script type="text/javascript">
    $(document).ready(function () {
        var counter = ${tracksCount};

        $("#addButton").click(function () {
            counter++;

            var currentStatusValue = ${currentStatusValue};
            currentStatusValue++;

            var newTrackRow = $(document.createElement('tr'))
                    .attr("id", 'trackTr' + counter).attr('class', 'removable');

            $.get("<%=request.getContextPath()%>/appendTrackInputFragment", {
                        fieldId: counter,
                        status: currentStatusValue,
                        albumId: ${albumId},
                        artistId: ${albumForm.artist.id}
                    },
                    function (data) {
                        newTrackRow.append(data);
                    });

            newTrackRow.appendTo("#tracklistTable");
        });

        $(".removeButton").click(function () {
            if ($("#tracklistTable tr").not("thead tr").length > 1) {
                $.get("<%=request.getContextPath()%>/removeTrackInputFragment",
                        {fieldId: this.id, albumId: ${albumId}, artistId: ${albumForm.artist.id}});
                $("#track" + this.id).remove();
            } else {
                return false;
            }
        });
    });
</script>

</body>
</html>