<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@ page import="com.tjs.core.zhifu.*" %>
<%! String formatString(String text) {
		return (text == null) ? "" : text.trim();
	}
%>
<%
	request.setCharacterEncoding("GBK");

	String p1_MerId				= formatString(request.getParameter("p1_MerId"));
	String r0_Cmd               = formatString(request.getParameter("r0_Cmd"));
	String r1_Code              = formatString(request.getParameter("r1_Code"));
	String r2_TrxId             = formatString(request.getParameter("r2_TrxId"));
	String r3_Amt               = formatString(request.getParameter("r3_Amt"));
	String r4_Cur               = formatString(request.getParameter("r4_Cur"));
	String r5_Pid               = formatString(request.getParameter("r5_Pid"));
	String r6_Order             = formatString(request.getParameter("r6_Order"));
	String r7_Uid               = formatString(request.getParameter("r7_Uid"));
	String r8_MP                = formatString(request.getParameter("r8_MP"));
	String r9_BType             = formatString(request.getParameter("r9_BType"));
	String rb_BankId            = formatString(request.getParameter("rb_BankId"));
	String ro_BankOrderId       = formatString(request.getParameter("ro_BankOrderId"));
	String rp_PayDate           = formatString(request.getParameter("rp_PayDate"));
	String rq_CardNo            = formatString(request.getParameter("rq_CardNo"));
	String ru_Trxtime           = formatString(request.getParameter("ru_Trxtime"));
	String rq_SourceFee         = formatString(request.getParameter("rq_SourceFee"));
	String rq_TargetFee         = formatString(request.getParameter("rq_TargetFee"));
	String hmac		            = formatString(request.getParameter("hmac"));

	String[] strArr	= {p1_MerId, r0_Cmd, r1_Code, r2_TrxId, r3_Amt, r4_Cur, r5_Pid, r6_Order, r7_Uid, r8_MP, r9_BType };

	boolean hmacIsCorrect = YeepayService.verifyCallbackHmac(strArr, hmac);

	if(hmacIsCorrect) {
		if(r9_BType.equals("2")) {
			out.println("SUCCESS");
			return;
		}
	} else {
		out.println("Hmac Not Correction!");
		return;
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>֪ͨ�ص�</title>
</head>
	<body>
		<br /> <br />
		<table width="70%" border="0" align="center" cellpadding="5" cellspacing="0" style="border:solid 1px #107929">
			<tr>
		  		<th align="center" height="30" colspan="5" bgcolor="#6BBE18">
					֪ͨ�ص����
				</th>
		  	</tr>
			
			<tr >
				<td width="25%" align="left">&nbsp;�̻����</td>
				<td width="5%"  align="center"> : </td> 
				<td width="45"  align="left"> <%=p1_MerId%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="30%" align="left">p1_MerId</td> 
			</tr>

			<tr >
				<td width="25%" align="left">&nbsp;ҵ������</td>
				<td width="5%"  align="center"> : </td> 
				<td width="45"  align="left"> <%=r0_Cmd%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="30%" align="left">r0_Cmd</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;֧�����</td>
				<td width="5%"  align="center"> : </td> 
				<td width="35%" align="left"> <%=r1_Code%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="30%" align="left">r1_Code</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;�ױ���ˮ��</td>
				<td width="5%"  align="center"> : </td> 
				<td width="35%" align="left"> <%=r2_TrxId%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="30%" align="left">r2_TrxId</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;֧�����</td>
				<td width="5%"  align="center"> : </td> 
				<td width="35%" align="left"> <%=r3_Amt%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="30%" align="left">r3_Amt</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;���ױ���</td>
				<td width="5%"  align="center"> : </td> 
				<td width="35%" align="left"> <%=r4_Cur%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="30%" align="left">r4_Cur</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;��Ʒ����</td>
				<td width="5%"  align="center"> : </td> 
				<td width="35%" align="left"> <%=r5_Pid%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="30%" align="left">r5_Pid</td> 
			</tr> 

			<tr>
				<td width="25%" align="left">&nbsp;�̻�������</td>
				<td width="5%"  align="center"> : </td> 
				<td width="35%" align="left"> <%=r6_Order%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="30%" align="left">r6_Order</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;�ױ���ԱID</td>
				<td width="5%"  align="center"> : </td> 
				<td width="35%" align="left"> <%=r7_Uid%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="30%" align="left">r7_Uid</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;��չ��Ϣ</td>
				<td width="5%"  align="center"> : </td> 
				<td width="35%" align="left"> <%=r8_MP%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="30%" align="left">r8_MP</td> 
			</tr>


			<tr>
				<td width="25%" align="left">&nbsp;֪ͨ����</td>
				<td width="5%"  align="center"> : </td> 
				<td width="35%" align="left"> <%=r9_BType%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="30%" align="left">r9_BType</td> 
			</tr> 

			<tr>
				<td width="25%" align="left">&nbsp;֧��ͨ������</td>
				<td width="5%"  align="center"> : </td> 
				<td width="35%" align="left"> <%=rb_BankId%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="30%" align="left">rb_BankId</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;���ж�����</td>
				<td width="5%"  align="center"> : </td> 
				<td width="35%" align="left"> <%=ro_BankOrderId%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="30%" align="left">ro_BankOrderId</td> 
			</tr>


			<tr>
				<td width="25%" align="left">&nbsp;֧���ɹ�ʱ��</td>
				<td width="5%"  align="center"> : </td> 
				<td width="35%" align="left"> <%=rp_PayDate%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="30%" align="left">rp_PayDate</td> 
			</tr> 

			<tr>
				<td width="25%" align="left">&nbsp;�����г�ֵ����</td>
				<td width="5%"  align="center"> : </td> 
				<td width="35%" align="left"> <%=rq_CardNo%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="30%" align="left">rq_CardNo</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;֪ͨʱ��</td>
				<td width="5%"  align="center"> : </td> 
				<td width="35%" align="left"> <%=ru_Trxtime%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="30%" align="left">ru_Trxtime</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;�û�������</td>
				<td width="5%"  align="center"> : </td> 
				<td width="35%" align="left"> <%=rq_SourceFee%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="30%" align="left">rq_SourceFee</td> 
			</tr>


			<tr>
				<td width="25%" align="left">&nbsp;�̻�������</td>
				<td width="5%"  align="center"> : </td> 
				<td width="35%" align="left"> <%=rq_TargetFee%> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="30%" align="left">rq_TargetFee</td> 
			</tr> 

		</table>

	</body>
</html>
