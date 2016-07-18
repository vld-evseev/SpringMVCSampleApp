<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="page-wrapper" style="min-height: 626px;">
    <div class="row">


        <c:if test="${!empty artists}">
            <h3>Artists</h3>
            <table class="table table-bordered table-striped">
                <tbody>
                <c:forEach items="${artists}" var="artist">
                    <tr>
                        <div class="col-lg-12">
                            <td>${artist.name}</td>
                            <td>
                                <form:form action="delete/${artist.id}" method="post"><input type="submit"
                                                                                             class="btn btn-danger btn-mini"
                                                                                             value="Delete"/>
                                </form:form>
                            </td>
                        </div>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>

    </div>
</div>
