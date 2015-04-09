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
                <c:when test="${xintuocp.xtcpStatus=='10'}">  
                  		未上线
                </c:when>
                 <c:when test="${xintuocp.xtcpStatus=='20'}">  
                  		  已上线
                </c:when>    
                <c:otherwise>  
                     	已下线
                </c:otherwise>  
            </c:choose>                 
        </td>
        <td>
          <c:choose>  
                <c:when test="${xintuocp.xtcpTjw=='10'}">  
                  		  首页
                </c:when> 
                <c:when test="${xintuocp.xtcpTjw=='20'}">  
                  		板块头     
                </c:when>  
                <c:otherwise>  
                     	板块头中
                </c:otherwise>  
            </c:choose>   
        
        
        </td>
    </tr>

</c:forEach>


