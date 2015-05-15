<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>



<c:forEach items="${showData}" var="order">
    <tr>
        <td class="data-operator">
            <label class="checkbox-inline">
                <input type="checkbox" name="data-id" value="${order.id}"> 
                &nbsp;&nbsp;&nbsp;
            </label>
            <a data-id="${order.id}" href="" class="edit invisible" title="修改">
                <span class="glyphicon glyphicon-edit"></span> 修改
            </a>
        </td>
        <td> ${order.userName}</td>
        <td>
            <a data-id="${order.id}" href="" class="view" title="查看">
               ${order.telphone}             
            </a>
        </td>        
        <td>${order.productName}</td>
        <td>
         <c:choose>  
                <c:when test="${order.productType=='10'}">  
                  		信托
                </c:when>
                 <c:when test="${order.productType=='20'}">  
                  		私募
                </c:when>
                 <c:when test="${order.productType=='30'}">  
                  		  配资
                </c:when> 
                 <c:when test="${order.productType=='40'}">  
                  		海外保险      
                </c:when> 
                    
                <c:otherwise>  
                     	其他
                </c:otherwise>  
            </c:choose>    
                       
        </td>
        <td><fmt:formatDate value="${order.createDate}" pattern="yyyy-MM-dd HH:mm"/></td> 
        <td>${order.operateName}</td>       
        <td>
        
        <c:choose>  
                <c:when test="${order.operateStatus=='10'}">  
                  		未处理
                </c:when>
                 <c:when test="${order.operateStatus=='20'}">  
                  		处理中
                </c:when>
                 <c:when test="${order.operateStatus=='30'}">  
                  		已处理
                </c:when>                                    
                <c:otherwise>  
                     	其他
                </c:otherwise>  
            </c:choose> 

        
        
        </td>             
    </tr>

</c:forEach>


