<%@ include file="/views/admin/include.jsp"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@page language="java" import="com.tjs.admin.kybx.constants.KybxClassEnum" pageEncoding="utf-8"%>
<%@page language="java" import="com.tjs.core.util.*"%>


<c:forEach items="${showData}" var="kybx" >
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
        <td>${kybx.kybxAmont}</td>
        <td>
          <c:set var="classKey"  value="${kybx.kybxClass}" scope="request"/> 
          <%=EnumUtils.getValue((IEnum[])KybxClassEnum.values(), (String)request.getAttribute("classKey")) %>
        </td>
        <td>${kybx.kybxSubclass}</td>
    </tr>

</c:forEach>


