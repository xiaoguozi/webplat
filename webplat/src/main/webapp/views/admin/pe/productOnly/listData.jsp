<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>



<c:forEach items="${showData}" var="peProduct">
    <tr>
        <td class="data-operator">
            <label class="radio-inline">
                <input type="radio" name="data-id" value="${peProduct.id}" <c:if test="${peProduct.isShow == '1'}">checked</c:if>> 
                &nbsp;&nbsp;&nbsp;
            </label>
             <a data-id="${peProduct.id}" href="" class="view" title="查看">
                <span class="glyphicon glyphicon-edit"></span> 修改
            </a>
        </td>
        <td>
            <a data-id="${peProduct.id}" href="" class="view" title="查看">
                ${peProduct.id}
            </a>
        </td>
        <td>${peProduct.simpleName}</td>
        <td>${peProduct.pecompanyName}</td>
        <td>
        	<c:choose>  
                <c:when test="${peProduct.productLevel =='1'}">一级</c:when>
                <c:when test="${peProduct.productLevel =='2'}">二级</c:when>
                <c:when test="${peProduct.productLevel =='3'}">三级</c:when>
                <c:when test="${peProduct.productLevel =='4'}">四级</c:when>
                <c:when test="${peProduct.productLevel =='5'}">五级</c:when>
            </c:choose>  
        </td>
        <td>${peProduct.accumulatedIncome}</td>
        <td>${peProduct.nowRate}</td>
        <td>${peProduct.oneRate}</td>
        <td>${peProduct.towRate}</td>
        <td><fmt:formatDate value="${peProduct.netWorthTime}" pattern="yyyy-MM-dd" /></td>
        <td><fmt:formatDate value="${peProduct.setupTime}" pattern="yyyy-MM-dd" /></td>
        <td>
        	 <c:choose>  
                <c:when test="${peProduct.status =='1'}">未上线</c:when>
                <c:when test="${peProduct.status =='2'}">上线</c:when>
                <c:otherwise>下线</c:otherwise>  
            </c:choose>   
        
        </td>
    </tr>

</c:forEach>


