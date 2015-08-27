<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@page language="java" import="com.tjs.admin.order.constants.ProductTypeEnum" pageEncoding="utf-8"%>
<%@page language="java" import="com.tjs.admin.constants.OperateStatusEnum"%>
<%@page language="java" import="com.tjs.core.util.*"%>


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
          <c:set var="classKey"  value="${order.productType}" scope="request"/> 
          <%=EnumUtils.getValue((IEnum[])ProductTypeEnum.values(), (String)request.getAttribute("classKey")) %>                                     
        </td>
        <td><fmt:formatDate value="${order.createDate}" pattern="yyyy-MM-dd HH:mm"/></td> 
        <td>${order.operateName}</td>       
        <td>
        	 <c:set var="operateKey"  value="${order.operateStatus}" scope="request"/> 
          <%=EnumUtils.getValue((IEnum[])OperateStatusEnum.values(), (String)request.getAttribute("operateKey")) %>                                         
        </td>             
    </tr>

</c:forEach>


