<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>



<c:forEach items="${showData}" var="rule">
    <tr>
        <td class="data-operator">
            <label class="checkbox-inline">
                <input type="checkbox" name="data-id" value="${rule.ruleId}"> 
                &nbsp;&nbsp;&nbsp;
            </label>
            <a data-id="${rule.ruleId}" href="" class="edit invisible" title="修改">
                <span class="glyphicon glyphicon-edit"></span> 修改
            </a>
        </td>      
        <td>
              <c:choose>  
                <c:when test="${rule.ruleType=='10'}">  
                  		免费配资
                </c:when>
                 <c:when test="${rule.ruleType=='20'}">  
                  		  天天配
                </c:when>
                 <c:when test="${rule.ruleType=='30'}">  
                  		  月月配  
                </c:when>
                 <c:when test="${rule.ruleType=='40'}">  
                  		低息配   
                </c:when>    
                <c:otherwise>  
                     	错误
                </c:otherwise>  
            </c:choose>                 
        </td>
         <td>
           ${rule.ruleJjx}%              
        </td>
        
         <td>
           ${rule.rulePcx}%                   
        </td>
        <td>
              <c:choose>  
                <c:when test="${rule.ruleGlsyType=='10'}">  
                  		${rule.ruleZhglf}元/天
                </c:when>
                 <c:when test="${rule.ruleGlsyType=='20'}">  
                  		月利率:${rule.ruleYll}% 
                </c:when>
                 <c:when test="${rule.ruleGlsyType=='30'}">  
                  		年利率:${rule.ruleNll}%
                </c:when>                
                <c:otherwise>  
                     	错误
                </c:otherwise>  
            </c:choose>                 
        </td>      
    </tr>

</c:forEach>


