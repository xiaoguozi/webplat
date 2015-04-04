<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>



<c:forEach items="${showData}" var="xintuocp">
    <tr>
        <td class="data-operator">
            <label class="checkbox-inline">
                <input type="checkbox" name="data-id" value="${xintuocp.xtcpId}"> 
                &nbsp;&nbsp;&nbsp;
            </label>
            <a data-id="${xintuocp.xtcpId}" href="" class="edit invisible" title="修改">
                <span class="glyphicon glyphicon-edit"></span> 修改
            </a>
        </td>
        <td>
            <a data-id="${xintuocp.xtcpId}" href="" class="view" title="查看">
                ${xintuocp.xtcpId}
            </a>
        </td>
        <td>${xintuocp.xtcpFullname}</td>
        <td>${xintuocp.xtcpGszhname}</td>
        <td>${xintuocp.xtcpSysm}</td>
        <td>
              <c:choose>  
                <c:when test="${xintuocp.xtcpFb=='1'}">  
                  		  已发布
                </c:when>  
                <c:otherwise>  
                     	未发布
                </c:otherwise>  
            </c:choose>                 
        </td>
        <td>
          <c:choose>  
                <c:when test="${xintuocp.xtcpInshow=='1'}">  
                  		  首页显示
                </c:when>  
                <c:otherwise>  
                     	首页不显示
                </c:otherwise>  
            </c:choose>   
        
        
        </td>
    </tr>

</c:forEach>


