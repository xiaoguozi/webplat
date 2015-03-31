<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>



<c:forEach items="${showData}" var="user">
    <tr>
        <td class="data-operator">
            <label class="checkbox-inline">
                <input type="checkbox" name="data-id" value="${user.id}"> 
                &nbsp;&nbsp;&nbsp;
            </label>
            <a data-id="${user.id}" href="" class="edit invisible" title="修改">
                <span class="glyphicon glyphicon-edit"></span> 修改
            </a>
        </td>
        <td>
            <a data-id="${user.id}" href="" class="view" title="查看">
                ${user.id}
            </a>
        </td>
        <td>${user.username}</td>
        <td>${user.password}</td>
    </tr>

</c:forEach>


