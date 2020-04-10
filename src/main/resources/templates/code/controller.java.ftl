package ${package.Controller};

import ${package.Entity}.${entity};
import com.github.pagehelper.PageInfo;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import ${package.Service}.${table.serviceName};

<#if restControllerStyle>
import org.springframework.web.bind.annotation.RestController;
<#else>
import org.springframework.stereotype.Controller;
</#if>
<#if superControllerClassPackage??>
import ${superControllerClassPackage};
</#if>

/**
 * <p>
 * ${table.comment!} 前端控制器
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
<#if restControllerStyle>
@RestController
<#else>
@Controller
</#if>
@RequestMapping("/<#if controllerMappingHyphenStyle??>${controllerMappingHyphen}<#else>${table.entityPath}</#if>Controller")
<#if kotlin>
class ${table.controllerName}<#if superControllerClass??> : ${superControllerClass}()</#if>
<#else>
<#if superControllerClass??>
public class ${table.controllerName} extends ${superControllerClass} {
<#else>
public class ${table.controllerName} {
</#if>
	
	@Autowired
	${table.serviceName} ${controllerMappingHyphen}Service;
	
	@RequestMapping("/getByPage")
	@NotNull(str="pageNum,pageSize")
	@LoginRequired
	public Object getByPage(${entity} ${controllerMappingHyphen}, int pageNum, int pageSize) {
		List<${entity}> ${controllerMappingHyphen}List = ${controllerMappingHyphen}Service.get(${controllerMappingHyphen}, pageNum, pageSize);
		PageInfo<${entity}> pageInfo = new PageInfo<>(${controllerMappingHyphen}List);
		return ResultUtil.success(pageInfo);
	}
	
	@RequestMapping("/get")
	@LoginRequired
	public Object get(${entity} ${controllerMappingHyphen}) {
		List<${entity}> ${controllerMappingHyphen}List = ${controllerMappingHyphen}Service.get(${controllerMappingHyphen});
		return ResultUtil.success(${controllerMappingHyphen}List);
	}
	
	@RequestMapping("/add")
	@LoginRequired
	public Object add(${entity} ${controllerMappingHyphen}, @CurrentUser User currentUser) {
		${controllerMappingHyphen}Service.add(${controllerMappingHyphen});
		return ResultUtil.success();
	}
	
	@RequestMapping("/del")
	@LoginRequired
	@NotNull(str="id")
	public Object del(String id, @CurrentUser User currentUser) {
		${controllerMappingHyphen}Service.del(id);
		return ResultUtil.success();
	}
	
	@RequestMapping("/update")
	@LoginRequired
	@NotNull(str="id")
	public Object update(${entity} ${controllerMappingHyphen}, @CurrentUser User currentUser) {
		${controllerMappingHyphen}Service.update(${controllerMappingHyphen});
		return ResultUtil.success();
	}
}
</#if>

