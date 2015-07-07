<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>



<c:forEach items="${showData}" var="peizi">
    <tr>
        <td class="data-operator">
            <a data-id="${peizi.dataId}" href="" class="edit invisible" title="修改">
                <span class="glyphicon glyphicon-edit"></span> 修改
            </a>
        </td> 
        <td>${peizi.dataId}</td>     
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
                 <c:when test="${peizi.dataType=='50'}">  
                  		免息配资
                </c:when>    
                <c:otherwise>  
                     	错误
                </c:otherwise>  
            </c:choose>                 
        </td>
        <td>${peizi.dataUserName}  </td>
        <td>${peizi.dataUserTel}  </td>
        <td>
              <c:choose>  
                <c:when test="${peizi.dataOperaStatus=='1'}">  
                  		待支付
                </c:when>
                 <c:when test="${peizi.dataOperaStatus=='10'}">  
                  		验资中
                </c:when>
                 <c:when test="${peizi.dataOperaStatus=='20'}">  
                  		  操盘中
                </c:when>
                 <c:when test="${peizi.dataOperaStatus=='30'}">  
                  		已完结
                </c:when>          
                <c:otherwise>  
                     	异常
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
           <c:choose>  
                <c:when test="${peizi.dataTypeSylx=='10'}">  
                  		${peizi.dataZjsyqx}天
                </c:when>
                 <c:when test="${peizi.dataTypeSylx=='20'}">  
                  		${peizi.dataZjsyqx}个月
                </c:when>
                 <c:when test="${peizi.dataTypeSylx=='30'}">  
                  		${peizi.dataZjsyqx}个月
                </c:when>                
                <c:otherwise>  
                     	错误
                </c:otherwise>  
            </c:choose>  
                     
        </td>
        <td>
              <c:choose>  
                <c:when test="${peizi.dataTypeSylx=='10'}">  
                  		${peizi.dataZfglf==null?0:peizi.dataZfglf}元/天
                </c:when>
                 <c:when test="${peizi.dataTypeSylx=='20'}">  
                  		月利率:${peizi.dataYll}% 
                </c:when>
                 <c:when test="${peizi.dataTypeSylx=='30'}">  
                  		年利率:${peizi.dataNll}%
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
              <c:choose>  
                <c:when test="${peizi.dataJyksDate=='1'}">  
                  		提交配资申请当天
                </c:when>
                 <c:when test="${peizi.dataJyksDate=='2'}">  
                  		提交配资申请下一个交易日
                </c:when>                               
                <c:otherwise>  
                     	提交配资申请下一个交易日
                </c:otherwise>  
            </c:choose>         
        </td>
        
        <td title="${peizi.dataRemark}">
             ${peizi.dataRemark}     
        </td>       
    </tr>

</c:forEach>


