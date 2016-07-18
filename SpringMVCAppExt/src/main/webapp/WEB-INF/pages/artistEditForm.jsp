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

        <spring:url value="/artist/new" var="artistProfile"/>

        <div id="page-wrapper" style="min-height: 626px;">
            <h1>${artist.id}</h1>
            <c:choose>
                <c:when test="${artistForm['new']}">
                    <h2>Add artist</h2>
                </c:when>
                <c:otherwise>
                    <h2>Edit</h2>
                </c:otherwise>
            </c:choose>
            <br/>

            <form:form method="post" modelAttribute="artistForm" action="${artistProfile}">
                <form:hidden path="id"/>

                <spring:bind path="name">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label>Name</label>
                        <div>
                            <form:input path="name" type="text" class="form-control" id="name" placeholder="Name"/>
                            <form:errors path="name" class="control-label"/>
                        </div>
                    </div>
                </spring:bind>

                <spring:bind path="type">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label>Type</label>
                        <form:select path="type">
                            <form:options items="${types}"/>
                        </form:select>
                    </div>
                </spring:bind>

                <spring:bind path="gender">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label>Gender</label>
                        <div>
                            <form:select path="gender" class="form-control">
                                <form:options items="${genders}"/>
                            </form:select>
                            <form:errors path="gender" class="control-label"/>
                        </div>
                    </div>
                </spring:bind>

                <button type="submit" class="btn btn-primary">
                    <i class="fa fa-check" aria-hidden="true"></i> Save
                </button>
            </form:form>
        </div>
    </div>

</div>
</body>
</html>