<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>私信 ${user.name}的在浙里 在浙里——分享你我的社交</title>
	
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/zaizheli-base.css" />" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/zaizheli-theme.css" />" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.css" />" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/validationEngine.bootstrap.css" />" />
	<script type="text/javascript" src="<c:url value="/resources/js/jquery.1.7.1.js" />" ></script>
	<script type="text/javascript" src="<c:url value="/resources/js/zaizheli.init.js" />" ></script>
	<script type="text/javascript" src="<c:url value="/resources/js/zaizheli.op.js" />" ></script>
	<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.js" />" ></script>
	<script type="text/javascript" src="<c:url value="/resources/js/bootstrap-paginator.js" />" ></script>
</head>
<body class="front">
	<jsp:include page="/WEB-INF/views/comp/header.jsp">
		<jsp:param name="tab" value="none"/>
	</jsp:include>
	<div class="main-wrapper mt-20 mb-30">
		<div class="main block-h-c content-wrapper row-fluid p-r">
			<div class="span8 board">
				<div class="pl-30 pr-30 pt-20">
				    <ul id="profile-nav-tabs" class="nav nav-tabs fs-14" 
				    	style="margin-left: -30px; margin-right: -30px;  margin-bottom:0px">
			    		<li class="cmt-me active" style="margin-left:30px;">
			    			<a data-toggle="tab" href="#cmt-me-act-list">我的收信</a></li>
			    		<li class="my-cmt">
			    			<a data-toggle="tab" href="#my-cmt-act-list" 
			    				data-action="<c:url value="/message/pm/from/view/${no}"/>">我的发信</a></li>
				    </ul>
			    </div>
			    <div id="act-list-wrapper"  class="tab-content bg-white p-20" >
				    <div id="cmt-me-act-list" class="tab-pane active">
				    	<c:import url="/message/pm/to/view/${no}"></c:import>
				    </div>
				    <div id="my-cmt-act-list" class="tab-pane">
				    	
				    </div>
				</div> 
				  
			</div>
			<div class="span4">
				<jsp:include page="/WEB-INF/views/message/info.jsp" />					
				<jsp:include page="/WEB-INF/views/message/nav.jsp">
					<jsp:param name="tab" value="pm"/>
				</jsp:include>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		adjustWebWidth();
	</script>

<script type="text/javascript" src="<c:url value="/resources/js/jquery.timeago.js" />" ></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-ui-1.8.18.custom.min.js" />" ></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.scrollTo.js" />" ></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.form.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.imagesloaded.js" />" ></script>
<script type="text/javascript">
	$(function(){	
		$('#profile-nav-tabs .my-cmt a').click(function(){
			var $this = $(this);
			if(! $(this).data('first-load')){
				var data_action = $(this).attr('data-action');
				var c = $('#my-cmt-act-list');
				var loading_box = c.find('.loading-box');
				$.ajax({
					url: data_action,
					beforeSend: function(){
						loading_box.show();
					},
					success: function(data) {
						if($.trim(data)){
							var act = $(data).prependTo(c);
							act.each(function(){
								op.act_bind_event($(this));
							});
						}
					},
					complete: function(){
						loading_box.hide();
						$this.data('first-load', true);
					}
				});
			}
		});		
	});
</script>
</body>
</html>