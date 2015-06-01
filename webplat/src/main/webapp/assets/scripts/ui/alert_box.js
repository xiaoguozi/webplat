function alertMsg(productId,productType, mode) { //mode为空，即只有一个确认按钮，mode为1时有确认和取消两个按钮	 
	var msg="<form id='orderform'><div class='capacity'>预约</div><div class='alert_in_box'>";	
	msg=msg+"<p><input name='productId' id='productId'  type='hidden' value='"+productId+"'/><input name='productType' id='productType'  type='hidden' value='"+productType+"'/></p>";
	msg=msg+"<p>姓名：<input name='alert_name' id='alert_name' placeholder='请输入中文姓名' type='text'/></p>";
	msg=msg+"<p id='tip_01' style='height:20px'></p>";
	msg=msg+"<p id='tip_02' style='padding-top:0px;padding-bottom:3px;padding-left:opx;color: red;font-size:13px;text-align:left;display:none'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请输入2-5字中文姓名</p>";				
	msg=msg+"<p>电话：<input name='alert_tel' id='alert_tel' placeholder='请输入联系电话' type='text'/></p>";	
	msg=msg+"<p id='tip_03' style='padding-top:0px;padding-bottom:3px;padding-left:opx;color: red;font-size:13px;text-align:left;display:none'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请输入11位手机号</p>";	
	msg=msg+"</div><div class='remark'>淘金山专业投资顾问将在24小时以内与您联系</div></form>";
	
    mode = mode || 0;
    var top = document.body.scrollTop || document.documentElement.scrollTop;
    var isIe = (document.all) ? true : false;
    var isIE6 = isIe && !window.XMLHttpRequest;
    var sTop = document.documentElement.scrollTop || document.body.scrollTop;
    var sLeft = document.documentElement.scrollLeft || document.body.scrollLeft;
    var winSize = function () {
        var xScroll, yScroll, windowWidth, windowHeight, pageWidth, pageHeight;
        // innerHeight获取的是可视窗口的高度，IE不支持此属性
        if (window.innerHeight && window.scrollMaxY) {
            xScroll = document.body.scrollWidth;
            yScroll = window.innerHeight + window.scrollMaxY;
        } else if (document.body.scrollHeight > document.body.offsetHeight) { // all but Explorer Mac
            xScroll = document.body.scrollWidth;
            yScroll = document.body.scrollHeight;
        } else { // Explorer Mac...would also work in Explorer 6 Strict, Mozilla and Safari
            xScroll = document.body.offsetWidth;
            yScroll = document.body.offsetHeight;
        }

        if (self.innerHeight) {    // all except Explorer
            windowWidth = self.innerWidth;
            windowHeight = self.innerHeight;
        } else if (document.documentElement && document.documentElement.clientHeight) { // Explorer 6 Strict Mode
            windowWidth = document.documentElement.clientWidth;
            windowHeight = document.documentElement.clientHeight;
        } else if (document.body) { // other Explorers
            windowWidth = document.body.clientWidth;
            windowHeight = document.body.clientHeight;
        }

        // for small pages with total height less then height of the viewport
        if (yScroll < windowHeight) {
            pageHeight = windowHeight;
        } else {
            pageHeight = yScroll;
        }

        // for small pages with total width less then width of the viewport
        if (xScroll < windowWidth) {
            pageWidth = windowWidth;
        } else {
            pageWidth = xScroll;
        }

        return {
            'pageWidth': pageWidth,
            'pageHeight': pageHeight,
            'windowWidth': windowWidth,
            'windowHeight': windowHeight
        }
    }();
    //alert(winSize.pageWidth);
    //遮罩层
    var styleStr = 'top:0;left:0;position:fixed;z-index:10000;width:100%;height:100%;';
    styleStr += (isIe) ? "filter:alpha(opacity=10);background:none;" : "opacity:0.1;background:#000;"; //遮罩层DIV
    var shadowDiv = document.createElement('div'); //添加阴影DIV
    shadowDiv.style.cssText = styleStr; //添加样式
    shadowDiv.id = "shadowDiv";
    //如果是IE6则创建IFRAME遮罩SELECT
    if (isIE6) {
        var maskIframe = document.createElement('iframe');
        maskIframe.style.cssText = 'width:' + winSize.pageWidth + 'px;height:' + (winSize.pageHeight + 30) + 'px;position:absolute;visibility:inherit;z-index:-1;filter:alpha(opacity=0);';
        maskIframe.frameborder = 0;
        maskIframe.src = "about:blank";
        shadowDiv.appendChild(maskIframe);
    }
    document.body.insertBefore(shadowDiv, document.body.firstChild); //遮罩层加入文档
    //弹出框
    var styleStr1 = 'display:block;position:fixed;_position:absolute;left:' + (winSize.windowWidth / 2 - 200) + 'px;top:' + (winSize.windowHeight / 2 - 200) + 'px;_top:' + (winSize.windowHeight / 2 + top - 150) + 'px;'; //弹出框的位置
    var alertBox = document.createElement('div');
    alertBox.id = 'alertMsg';
    alertBox.style.cssText = styleStr1;
    //创建弹出框里面的内容div标签
    var alertMsg_info = document.createElement('div');
    alertMsg_info.id = 'alertMsg_info';
    alertMsg_info.innerHTML = msg;
    alertBox.appendChild(alertMsg_info);
    //创建按钮
    var btn1 = document.createElement('a');
    btn1.id = 'alertMsg_btn1';
    btn1.href = 'javascript:void(0)';
    btn1.innerHTML = '<cite>我要预约</cite>';
    btn1.onclick = function () {
    	if(document.getElementById("alert_name").value==document.getElementById("alert_name").getAttribute("placeholder")||document.getElementById("alert_tel").value==document.getElementById("alert_tel").getAttribute("placeholder")
    	    	  ||document.getElementById("alert_name").value==""||document.getElementById("alert_tel").value==""||!(/^1[3|4|5|7|8]\d{9}$/.test(document.getElementById("alert_tel").value.replace(/^\s+|\s+$/g, '')))){
			$("#tip_01").css('display',"none");
			$("#tip_02").css('display',"block");
			$("#tip_03").css('display',"block");   		
			return ;
    	}  
    	      			 
	  $.post(IndexPage.orderProductUrl, 
        $('#orderform').formSerialize(),
        function(data){		  
         document.body.removeChild(alertBox);
         document.body.removeChild(shadowDiv);
         alertTip("<div class='capacity'>预约</div><div class='alert_in_box' style='text-align: center; width: 320px;height:300px'><p>恭喜,预约成功！</p></div><div class='remark'>淘金山专业投资顾问将在24小时以内与您联系</div>",1);
                                   
      });
        
        return true;
    };
    alertBox.appendChild(btn1);
    if (mode === 1) {
        var btn2 = document.createElement('a');
        btn2.id = 'alertMsg_btn2';
        btn2.href = 'javas' + 'cript:void(0)';
        btn2.innerHTML = '<i></i>';
        btn2.onclick = function () {
            document.body.removeChild(alertBox);
            document.body.removeChild(shadowDiv);
            return false;
        };
        alertBox.appendChild(btn2);
    }
    document.body.appendChild(alertBox);

}

