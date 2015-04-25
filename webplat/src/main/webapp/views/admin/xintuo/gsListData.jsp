<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>



<c:forEach items="${showData}" var="xintuogs">
    <tr>
        <td class="data-operator">
            <label class="checkbox-inline">
                <input type="checkbox" name="data-id" value="${xintuogs.xtgsId}"> 
                &nbsp;&nbsp;&nbsp;
            </label>
            <a data-id="${xintuogs.xtgsId}" href="" class="edit invisible" title="修改">
                <span class="glyphicon glyphicon-edit"></span> 修改
            </a>
        </td>
        <td>
            <a data-id="${xintuogs.xtgsId}" href="" class="view" title="查看">
                ${xintuogs.xgtsSplname}
            </a>
        </td>
        <td>${xintuogs.xgtsPjsyl}%</td>
        <td>${xintuogs.xgtsCpdfbl}%</td>
        <td><fmt:formatNumber value="${xintuogs.xgtsZczb}" pattern="#00.####"/></td>
        <td>${xintuogs.xgtsGsxz}</td>
        <td>${xintuogs.xgtsFrdb}</td>
        <td>${xintuogs.xgtsCity}</td>
        <td><fmt:formatDate value="${xintuogs.xgtsCreatedate}" pattern="yyyy-MM-dd"/></td>        
    </tr>

</c:forEach>


