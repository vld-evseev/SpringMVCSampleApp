<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="page-wrapper" style="min-height: 626px;">
    <div class="row">
        <div class="col-lg-6" style="padding-top: 15px;">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Summary
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="alert alert-info">
                        Artists: ${artistCount}.
                    </div>

                    <div class="alert alert-info">
                        Albums: ${albumCount}.
                    </div>

                    <div class="alert alert-info">
                        Tracks: ${trackCount}.
                    </div>
                </div>
                <!-- .panel-body -->
            </div>
            <!-- /.panel -->
        </div>
    </div>
</div>