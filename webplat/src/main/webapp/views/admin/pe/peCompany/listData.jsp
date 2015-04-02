<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>



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
        <td>${peCompany.name}</td>
        <td>${peCompany.setupTime}</td>
        <td>${peCompany.managementScale}</td>
        <td>${peCompany.area}</td>
        <td>${peCompany.investmentNumber}</td>
        <td>${peCompany.coreCharacter}</td>
        <td>${peCompany.productLine}</td>
    </tr>

</c:forEach>


