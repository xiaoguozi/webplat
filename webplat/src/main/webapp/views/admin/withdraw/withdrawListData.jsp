<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>



<c:forEach items="${showData}" var="withdraw">
    <tr>
        <td class="data-operator">
        	<label class="checkbox-inline">
                <input type="checkbox" name="data-id" value="${withdraw.withrowId}"> 
                &nbsp;&nbsp;&nbsp;
            </label>
            <a data-id="${withdraw.withrowId}" href="" class="edit invisible" title="修改">
                <span class="glyphicon glyphicon-edit"></span> 修改
            </a>
        </td>
        <td> ${withdraw.createBy}</td>
        <td>          
             ${withdraw.bankName}             
        </td>        
        <td>${withdraw.cardNo}</td>
        <td>
         <fmt:formatDate value="${withdraw.createTime}" pattern="yyyy-MM-dd HH:mm"/>
                       
        </td>
        <td>${withdraw.auditBy}</td> 
        <td> <fmt:formatDate value="${withdraw.auditTime}" pattern="yyyy-MM-dd HH:mm"/></td>       
        <td>${withdraw.checkBy}
              
        </td>        
         <td><fmt:formatDate value="${withdraw.checkTime}" pattern="yyyy-MM-dd HH:mm"/></td>
         <td>
         	<c:choose>  
                <c:when test="${withdraw.status==0}">  
                  		待审核
                </c:when>
                 <c:when test="${withdraw.status==1}">  
                  		待确定
                </c:when>
                 <c:when test="${withdraw.status==2}">  
                  		完成
                </c:when> 
                 <c:when test="${withdraw.status==3}">  
                  		取消
                </c:when>                    
                <c:otherwise>  
                     	异常
                </c:otherwise>  
           </c:choose> 
         </td>
         
         <td>${withdraw.auditDesc}</td>               
    </tr>

</c:forEach>


