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
        <td> ${xintuocp.xtcpGszhname}</td>
        <td>
            <a data-id="${xintuocp.xtcpId}" href="" class="view" title="查看">
               ${xintuocp.xtcpFullname}             
            </a>
        </td>
        
        <td>${xintuocp.xtcpNsyl}</td>
        <td>${xintuocp.xtcpHd}</td>
        <td><fmt:formatNumber value="${xintuocp.xtcpZdrgje}" pattern="#00.####"/></td> 
        <td>${xintuocp.xtcpCxq}</td>
        <td>
           <c:choose>  
                <c:when test="${xintuocp.xtcpLxfp=='10'}">  
                  		不限按月付息
                </c:when>
                 <c:when test="${xintuocp.xtcpLxfp=='20'}">  
                  		  按季付息
                </c:when>
                 <c:when test="${xintuocp.xtcpLxfp=='30'}">  
                  		  半年付息 
                </c:when> 
                 <c:when test="${xintuocp.xtcpLxfp=='40'}">  
                  		 按年付息
                </c:when> 
                 <c:when test="${xintuocp.xtcpLxfp=='50'}">  
                  		 到期付息
                </c:when>     
                <c:otherwise>  
                     	其他
                </c:otherwise>  
            </c:choose>                              
        </td>
        <td>${xintuocp.xtcpTzly}</td>      
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
    </tr>

</c:forEach>


