<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>



<c:forEach items="${showData}" var="peManager">
    <tr>
        <td class="data-operator">
            <label class="checkbox-inline">
                <input type="checkbox" name="data-id" value="${peManager.id}"> 
                &nbsp;&nbsp;&nbsp;
            </label>
            <a data-id="${peManager.id}" href="" class="edit invisible" title="修改">
                <span class="glyphicon glyphicon-edit"></span> 修改
            </a>
        </td>
        <td>
            <a data-id="${peManager.id}" href="" class="view" title="查看">
                ${peManager.id}
            </a>
        </td>
        <td>${peManager.name}</td>
        <td>${peManager.companyName}</td>
        <td>${peManager.education}</td>
        <td>${peManager.workYear}</td>
        <td>${peManager.manageFund}</td>
        <td>${peManager.profitProduct}</td>
        <td>
        	<c:choose>  
                <c:when test="${peManager.level =='1'}">一级</c:when>
                <c:when test="${peManager.level =='2'}">二级</c:when>
                <c:when test="${peManager.level =='3'}">三级</c:when>
                <c:when test="${peManager.level =='4'}">四级</c:when>
                <c:when test="${peManager.level =='5'}">五级</c:when>
            </c:choose>  
        </td>
        <td>
        	<c:choose>  
                <c:when test="${peManager.status =='1'}">未上线</c:when>
                <c:when test="${peManager.status =='2'}">上线</c:when>
                <c:otherwise>下线</c:otherwise>  
            </c:choose>  
        </td>
    </tr>

</c:forEach>


