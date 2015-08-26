<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>



<c:forEach items="${showData}" var="user">
    <tr>
        <td>
            ${user.id}
        </td>
        <td>${user.username}</td>
        <td>${user.name}</td>
        <td><fmt:formatDate value="${user.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
        <td>
			<c:choose> 
			  <c:when test="${user.regFrom==0}">   
			   	PC端
			  </c:when> 
			  <c:when test="${user.regFrom==1}">   
			   	手机端
			  </c:when> 
			  <c:when test="${user.regFrom==5}">   
			   	微信推荐
			  </c:when> 
			  <c:when test="${user.regFrom==6}">   
			            链接推荐
			  </c:when> 
			  <c:when test="${user.regFrom==7}">   
			   	线下推广
			  </c:when> 
			  <c:when test="${user.regFrom==7}">   
			   	线下推广
			  </c:when> 
			  <c:when test="${user.regFrom==10}">   
			   	高铁一等座
			  </c:when> 
			  <c:when test="${user.regFrom==11}">   
			   	高铁二等座
			  </c:when> 
			  <c:otherwise>   
			     PC端
			  </c:otherwise> 
			</c:choose> 
		</td>
		<td>${user.rmobileNo}</td>
		<td>${user.rname}</td>
    </tr>

</c:forEach>


