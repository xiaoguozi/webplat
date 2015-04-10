<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>



<c:forEach items="${showData}" var="peProductNet">
    <tr>
        <td class="data-operator">
            <label class="checkbox-inline">
                <input type="checkbox" name="data-id" value="${peProductNet.id}"> 
                &nbsp;&nbsp;&nbsp;
            </label>
            <a data-id="${peProductNet.id}" href="" class="edit invisible" title="修改">
                <span class="glyphicon glyphicon-edit"></span> 修改
            </a>
        </td>
        <td>
            <a data-id="${peProductNet.id}" href="" class="view" title="查看">
                ${peProductNet.id}
            </a>
        </td>
        <td>
        	<fmt:formatDate value="${peProductNet.netTime}" pattern="yyyy-MM-dd"/>
        </td>
        <td>${peProductNet.unitNet}</td>
        <td>${peProductNet.totalNet}</td>
        <td>${peProductNet.increaseRate}</td>
        <td>${peProductNet.productName}</td>
    </tr>

</c:forEach>


