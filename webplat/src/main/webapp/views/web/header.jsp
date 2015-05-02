<%@page contentType= "text/html;charset=UTF-8" %>

<div class="header_top">
<div class="tjs_1108px center">
     <span class="time">欢迎您来到淘金山，投资有风险，选择需谨慎！</span>
     <div class="topservice">400-888-896</div>
    <div class="toplinks">
<c:if test="${empty sessionScope.userInfo.username}">  
     <a href="rest/web/login" class="log_link">登录</a> | <a href="rest/web/passport/reg">注册</a> 
</c:if>  
<c:if test="${not empty sessionScope.userInfo.username}">  
     <a href="rest/web/userCenter/index" class="log_link">欢迎您：${sessionScope.userInfo.username }</a> | <a href="rest/web/passport/logout">退出</a> | <a href="rest/admin/index" target="_blank">管理后台</a> 
</c:if>      
    
    
    </div>    
  </div>
</div>
<!-- /header_top -->