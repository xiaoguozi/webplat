<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>



<c:forEach items="${showData}" var="peProductIncome">
    <tr>
        <td class="data-operator">
            <label class="checkbox-inline">
                <input type="checkbox" name="data-id" value="${peProductIncome.id}"> 
                &nbsp;&nbsp;&nbsp;
            </label>
            <a data-id="${peProductIncome.id}" href="" class="edit invisible" title="修改">
                <span class="glyphicon glyphicon-edit"></span> 修改
            </a>
        </td>
        <td>
            <a data-id="${peProductIncome.id}" href="" class="view" title="查看">
                ${peProductIncome.id}
            </a>
        </td>
        <td>${peProductIncome.year}</td>
        <td>${peProductIncome.durationIncome}</td>
        <td>${peProductIncome.industryAverage}</td>
        <td>${peProductIncome.hs300}</td>
        <td>${peProductIncome.rank}</td>
        <td>${peProductIncome.rankInterval}</td>
        <td>${peProductIncome.productName}</td>
    </tr>

</c:forEach>


