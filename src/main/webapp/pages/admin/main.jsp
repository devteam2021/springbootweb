<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/commons/meta.jsp"%>
<%@ include file="/pages/commons/taglibs.jsp"%>
<link rel="stylesheet" type="text/css"
	href="../static/h-ui.admin/skin/blue/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="../static/h-ui.admin/css/style.css" />
<title>极上动漫后台管理</title>
</head>
<body>
	<jsp:include page="commons/commHead.jsp"></jsp:include>

	<aside class="Hui-aside"> <input runat="server"
		id="divScrollValue" type="hidden" value="" />
	<div class="menu_dropdown bk_2">
	<!-- <dl id="menu-member">
			<dt>
				<i class="Hui-iconfont">&#xe62b;</i>&nbsp;会员管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a
						data-href="/Yuyuan/pages/Member/memberList.jsp"
						data-title="会员管理" href="javascript:void(0)">会员管理</a></li>
				</ul>
			</dd>
		</dl>
		
		<dl id="menu-product">
			<dt>
				<i class="Hui-iconfont">&#xe6c6;</i>&nbsp;产品管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
				<li><a
						data-href="/Yuyuan/pages/ProductClass/productClassList.jsp"
						data-title="分类管理" href="javascript:void(0)">分类管理</a></li>
				<li><a
						data-href="/Yuyuan/pages/Product/productList.jsp"
						data-title="产品管理" href="javascript:void(0)">产品管理</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-orderinfo">
			<dt>
				<i class="Hui-iconfont">&#xe6c6;</i>&nbsp;订单管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a
						data-href="/Yuyuan/pages/Orderinfo/orderinfoList.jsp"
						data-title="订单管理" href="javascript:void(0)">订单管理</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-ad">
			<dt>
				<i class="Hui-iconfont">&#xe654;</i>&nbsp;广告管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a
						data-href="/Yuyuan/pages/Ad/adList.jsp"
						data-title="广告管理" href="javascript:void(0)">广告管理</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-store">
			<dt>
				<i class="Hui-iconfont">&#xe66a;</i>&nbsp;门店管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a
						data-href="/Yuyuan/pages/Store/storeList.jsp"
						data-title="门店管理" href="javascript:void(0)">门店管理</a></li>
					<li><a
						data-href="/Yuyuan/pages/Store/storePvgList.jsp"
						data-title="门店权限" href="javascript:void(0)">门店权限</a></li>
					<li><a
						data-href="/Yuyuan	"
						data-title="收货地址" href="javascript:void(0)">收货地址</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-project">
			<dt>
				<i class="Hui-iconfont">&#xe6c6;</i>&nbsp;项目管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a
						data-href="/Yuyuan/pages/Project/projectList.jsp"
						data-title="项目管理" href="javascript:void(0)">项目管理</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-employee">
			<dt>
				<i class="Hui-iconfont">&#xe6c6;</i>&nbsp;员工管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a
						data-href="/Yuyuan/pages/userDir/userDir.jsp"
						data-title="员工管理" href="javascript:void(0)">员工管理</a></li>
						<li><a
						data-href="/Yuyuan/pages/BeauticianLevel/beauticianLevelList.jsp"
						data-title="等级管理" href="javascript:void(0)">等级管理</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-business">
			<dt>
				<i class="Hui-iconfont">&#xe6c6;</i>&nbsp;商家管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a
						data-href="/Yuyuan/pages/Business/businessList.jsp"
						data-title="商家管理" href="javascript:void(0)">商家管理</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-dict">
			<dt>
				<i class="Hui-iconfont">&#xe6c6;</i>&nbsp;系统参数管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a
						data-href="/Yuyuan/pages/Dict/dictList.jsp"
						data-title="系统参数管理" href="javascript:void(0)">系统参数管理</a></li>
				</ul>
			</dd>
		</dl> -->
		<!-- <dl id="menu-product">
			<dt>
				<i class="Hui-iconfont">&#xe6c6;</i>&nbsp;商品采购<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
				<li><a data-href="/Yuyuan/pages/Product/purchase.jsp"
						data-title="商品采购" href="javascript:void(0)">商品采购</a>
				</li>
				
				</ul>
			</dd>
		</dl> -->
		
		<%-- <c:forEach items="${currAuth}" varStatus="i" var="item">
			<c:if test="${item.parentId == sessionScope.currSystem}" >  
			<c:if test="${item.parentId == sessionScope.currSystem}">
				<dl>
					<dt>
						<i class="Hui-iconfont">${item.colIcon}</i>&nbsp;${item.name }<i
							class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
					</dt>
					<dd>
						<ul>
							<c:forEach items="${currAuth}" varStatus="j" var="subitem">
								<c:if test="${subitem.parentId == item.code}">
									<c:if test="${!fn:startsWith(subitem.requestUrl, 'http')}">
										<c:set var="startUrl" value="${ctx }" />
									</c:if>
									<li><a class="a_submenu"
										data-href="${startUrl }${subitem.requestUrl }"
										data-title="${subitem.name }" href="javascript:void(0)">${subitem.name }</a></li>
								</c:if>
							</c:forEach>
						</ul>
					</dd>
				</dl>
			</c:if>
		</c:forEach> --%>
		<%-- <c:if test="${'SYSTEM' == sessionScope.currSystem}">
			<dl id="menu-help">
				<dt>
					<i class="Hui-iconfont">&#xe633;</i>&nbsp;帮助中心<i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a class="a_submenu"
							data-href="http://apizza.cc/console/project/e1c762a8bd3503aebfeb4c500a94be4c/browse"
							data-title="接口文档" href="javascript:void(0)">接口文档</a></li>
					</ul>
				</dd>
			</dl>
		</c:if> --%>
		
		
		
	</div>
	</aside>
	<!-- <div class="dislpayArrow hidden-xs">
		<a id="a_pngfix" class="pngfix" href="javascript:void(0);"
			onClick="displaynavbar(this)"></a>
	</div> -->
	<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<!-- <li class="active"><span title="我的桌面" data-href="welcome.html">我的桌面</span><em></em></li> -->
				<li class="active"><span title="我的桌面" data-href="../lib/Hui-iconfont/1.0.8/demo.html">图标</span><em></em></li>
			</ul>
		</div>
		<div class="Hui-tabNav-more btn-group">
			<a id="js-tabNav-prev" class="btn radius btn-default size-S"
				href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a
				id="js-tabNav-next" class="btn radius btn-default size-S"
				href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a>
		</div>
	</div>
	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
			<div style="display: none" class="loading"></div>
			<!-- <iframe scrolling="yes" frameborder="0" src="/Yuyuan/pages/welcome.jsp"></iframe> -->
			<iframe scrolling="yes" frameborder="0" src="../lib/Hui-iconfont/1.0.8/demo.html"></iframe>
		</div>
	</div>
	</section>

	<script type="text/javascript" src="../static/h-ui/js/H-ui.js"></script>
	<script type="text/javascript"
		src="../static/h-ui.admin/js/H-ui.admin.js"></script>
	
	<script type="text/javascript">
$(function(){
	$("#menu-ad dt").addClass("selected");$("#menu-ad dd").show();
	$("#menu-orderinfo dt").addClass("selected");$("#menu-orderinfo dd").show();
	$("#menu-member dt").addClass("selected");$("#menu-member dd").show();
	$("#menu-product dt").addClass("selected");$("#menu-product dd").show();
	$("#menu-store dt").addClass("selected");$("#menu-store dd").show();
	$("#menu-project dt").addClass("selected");$("#menu-project dd").show();
	$("#menu-employee dt").addClass("selected");$("#menu-employee dd").show();
	$("#menu-business dt").addClass("selected");$("#menu-business dd").show();
	$("#menu-dict dt").addClass("selected");$("#menu-dict dd").show();
	
});
</script>
	
</body>
</html>