<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Spring MVC sample application - Music database">
<meta name="author" content="Vlad Evseev">
<link rel="icon" href="../../favicon.ico">

<spring:url value="/resources/css/bootstrap.min.css" var="bootstrapCss"/>
<spring:url value="/resources/css/carousel.css" var="carouselCss"/>
<spring:url value="/resources/css/sb-admin-2.css" var="sbAdminCss"/>
<spring:url value="/resources/css/morris.css" var="morrisCss"/>
<spring:url value="/resources/css/font-awesome.min.css" var="fontAwesomeCss"/>
<spring:url value="/resources/js/jquery.min.js" var="jQueryJs"/>
<spring:url value="/resources/js/bootstrap.min.js" var="bootstrapJs"/>
<spring:url value="/resources/js/sb-admin-2.js" var="sbAdminJs"/>
<spring:url value="/resources/js/metisMenu.min.js" var="metisJs"/>
<spring:url value="/resources/js/script.js" var="script"/>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

<!-- Bootstrap core CSS -->
<link href="${bootstrapCss}" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${carouselCss}" rel="stylesheet">
<link href="${sbAdminCss}" rel="stylesheet">
<link href="${morrisCss}" rel="stylesheet">
<link href="${fontAwesomeCss}" rel="stylesheet" type='text/css'>

<script>window.jQuery || document.write('<script src="${jQueryJs}"><\/script>')</script>
<script src="${bootstrapJs}"></script>
<script src="${metisJs}"></script>
<script src="${sbAdminJs}"></script>
<script src="${script}"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $("body").tooltip({selector: '[data-toggle=tooltip]'});
    });
</script>

