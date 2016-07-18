<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<td class="col-md-1">
    <form:input path="albumForm.tracks[${fieldId}].position" value="${track.position}"/>
</td>
<td class="col-md-1">
    <form:input path="albumForm.tracks[${fieldId}].name" value="${track.name}"/>
</td>
<td class="col-md-1">
    <form:input path="albumForm.tracks[${fieldId}].length" value="${track.length}"/>
</td>
<td class="col-md-1">
    <button type="button" class="btn btn-danger btn-circle removeButton" style="display: none;" id=Tr${tracksCount}>
        <i class="fa fa-times"></i>
    </button>
</td>

