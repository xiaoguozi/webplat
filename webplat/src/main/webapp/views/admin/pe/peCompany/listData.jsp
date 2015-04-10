<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>


<%int index = 1;%>
<c:forEach items="${showData}" var="peCompany">
    <tr>
        <td class="data-operator">
            <label class="checkbox-inline">
                <input type="checkbox" name="data-id" value="${peCompany.id}"> 
                &nbsp;&nbsp;&nbsp;
            </label>
            <a data-id="${peCompany.id}" href="" class="edit invisible" title="修改">
                <span class="glyphicon glyphicon-edit"></span> 修改
            </a>
        </td>
        <td>
        	<a data-id="${peCompany.id}" href="" class="view" title="查看">
                ${peCompany.id}
            </a>
        </td>
        <td>
        	${peCompany.name}
        </td>
        <td><fmt:formatDate value="${peCompany.setupTime}" pattern="yyyy-MM-dd" /></td>
        <td>${peCompany.managementScale}</td>
        <td>${peCompany.area}</td>
        <td>${peCompany.investmentNumber}</td>
        <td>${peCompany.coreCharacter}</td>
        <td>${peCompany.productLine}</td>
        <td>
        	 <c:choose>  
                <c:when test="${peCompany.status =='1'}">未上线</c:when>
                <c:when test="${peCompany.status =='2'}">上线</c:when>
                <c:otherwise>下线</c:otherwise>  
            </c:choose>   
        </td>
    </tr>

</c:forEach>


