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
@RequestMapping("<#if package.ModuleName??>/${package.ModuleName}</#if>/<#if controllerMappingHyphenStyle??>${controllerMappingHyphen}<#else>${table.entityPath}</#if>")
<#if kotlin>
class ${table.controllerName}<#if superControllerClass??> : ${superControllerClass}()</#if>
<#else>
<#if superControllerClass??>
public class ${table.controllerName} extends ${superControllerClass} {
<#else>
public class ${table.controllerName} {
</#if>
	
	@Autowired
	${table.serviceName} ${package.ModuleName}Service;
	
	@RequestMapping("/getByPage")
	@NotNull(str="pageNum,pageSize")
	@LoginRequired
	public Object getByPage(${entity} ${package.ModuleName}, int pageNum, int pageSize) {
		List<${entity}> ${package.ModuleName}List = ${package.ModuleName}Service.get(${package.ModuleName}, pageNum, pageSize);
		PageInfo<${entity}> pageInfo = new PageInfo<>(${package.ModuleName}List);
		return ResultUtil.success(pageInfo);
	}
	
	@RequestMapping("/get")
	@LoginRequired
	public Object get(${entity} ${package.ModuleName}) {
		List<${entity}> ${package.ModuleName}List = ${package.ModuleName}Service.get(${package.ModuleName});
		return ResultUtil.success(${package.ModuleName}List);
	}
	
	@RequestMapping("/add")
	@LoginRequired
	public Object add(${entity} ${package.ModuleName}, @CurrentUser User currentUser) {
		${package.ModuleName}Service.add(${package.ModuleName});
		return ResultUtil.success();
	}
	
	@RequestMapping("/del")
	@LoginRequired
	@NotNull(str="${package.ModuleName}_id")
	public Object del(String ${package.ModuleName}_id, @CurrentUser User currentUser) {
		${package.ModuleName}Service.del(${package.ModuleName}_id);
		return ResultUtil.success();
	}
	
	@RequestMapping("/update")
	@LoginRequired
	@NotNull(str="${package.ModuleName}_id")
	public Object update(${entity} ${package.ModuleName}, @CurrentUser User currentUser) {
		${package.ModuleName}Service.update(${package.ModuleName});
		return ResultUtil.success();
	}
}
</#if>

