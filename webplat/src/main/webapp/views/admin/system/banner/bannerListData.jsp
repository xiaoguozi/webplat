<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>



<c:forEach items="${showData}" var="banner">
    <tr>
        <td class="data-operator">
            <label class="checkbox-inline">
                <input type="checkbox" name="data-id" value="${banner.homeId}"> 
                &nbsp;&nbsp;&nbsp;
            </label>
            <a data-id="${banner.homeId}" href="" class="edit invisible" title="修改">
                <span class="glyphicon glyphicon-edit"></span> 修改
            </a>
        </td>
        <td>
              ${banner.title}
        </td>
        <td>${banner.homeUrl}</td>
        <td>${banner.orderIndex}</td>
               
    </tr>

</c:forEach>


