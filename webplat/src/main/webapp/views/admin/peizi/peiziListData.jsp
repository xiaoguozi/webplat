<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>



<c:forEach items="${showData}" var="peizi">
    <tr>
        <td class="data-operator">
            <label class="checkbox-inline">
                <input type="checkbox" name="data-id" value="${peizi.dataId}"> 
                &nbsp;&nbsp;&nbsp;
            </label>
            <a data-id="${peizi.dataId}" href="" class="edit invisible" title="修改">
                <span class="glyphicon glyphicon-edit"></span> 修改
            </a>
        </td>      
        <td>
              <c:choose>  
                <c:when test="${peizi.dataType=='10'}">  
                  		免费配资
                </c:when>
                 <c:when test="${peizi.dataType=='20'}">  
                  		  天天配
                </c:when>
                 <c:when test="${peizi.dataType=='30'}">  
                  		  月月配  
                </c:when>
                 <c:when test="${peizi.dataType=='40'}">  
                  		低息配   
                </c:when>    
                <c:otherwise>  
                     	错误
                </c:otherwise>  
            </c:choose>                 
        </td>
        <td>
           ${peizi.dataZcpzj}              
        </td>
        <td>
           ${peizi.dataTzbzj}             
        </td>
        <td>
           ${peizi.dataJjx}          
        </td>
         <td>
           ${peizi.dataPcx}                 
        </td>
        
         <td>
           ${peizi.dataJklxTotal}                    
        </td>
        <td>
            ${peizi.dataZjsyqx}          
        </td>
        <td>
              <c:choose>  
                <c:when test="${peizi.dataTypeSylx=='10'}">  
                  		${peizi.dataZfglf}元/天
                </c:when>
                 <c:when test="${peizi.dataTypeSylx=='20'}">  
                  		月利率:${peizi.dataYll}% 
                </c:when>
                 <c:when test="${peizi.dataTypeSylx=='30'}">  
                  		年利率:${peizi.datanll}%
                </c:when>                
                <c:otherwise>  
                     	错误
                </c:otherwise>  
            </c:choose>               
        </td>
        <td>
          <fmt:formatDate value="${peizi.dataSubmitDate}" pattern="yyyy-MM-dd HH:mm"/>        
        </td>
        
        <td>
                  
        </td>       
    </tr>

</c:forEach>


