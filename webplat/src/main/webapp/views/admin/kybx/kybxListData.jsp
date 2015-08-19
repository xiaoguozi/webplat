<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>



<c:forEach items="${showData}" var="kybx">
    <tr>
        <td class="data-operator">
            <label class="checkbox-inline">
                <input type="checkbox" name="data-id" value="${kybx.kybxId}"> 
                &nbsp;&nbsp;&nbsp;
            </label>
            <a data-id="${kybx.kybxId}" href="" class="edit invisible" title="修改">
                <span class="glyphicon glyphicon-edit"></span> 修改
            </a>
        </td>
        <td>${kybx.kybxName}</td>
        <td>${kybx.kybxChoose}</td>
        <td>${kybx.kybxAge}</td>
        <td>${kybx.kybxAge}</td>
        <td>
          <c:choose>  
                <c:when test="${kybx.kybxClass=='10'}">  
                  		寿险
                </c:when>
                 <c:when test="${kybx.kybxClass=='20'}">  
                  		医疗
                </c:when>
                 <c:when test="${kybx.kybxClass=='30'}">  
                  		 保费隔资   
                </c:when>     
                <c:otherwise>  
                     	其他
                </c:otherwise>  
            </c:choose>    
        </td>
        <td>${kybx.kybxSubclass}</td>
    </tr>

</c:forEach>


