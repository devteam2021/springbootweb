package ${package.Service};

import java.util.List;
import ${package.Entity}.${entity};
import ${superServiceClassPackage};

/**
 * <p>
 * ${table.comment!} 服务类
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
<#if kotlin>
interface ${table.serviceName} : ${superServiceClass}<${entity}>
<#else>
public interface ${table.serviceName} extends ${superServiceClass}<${entity}> {

	public void add(${entity} ${controllerMappingHyphen});
	public void update(${entity} ${controllerMappingHyphen});
	public void del(String id);
	public ${entity} getById(String id);
	public List<${entity}> get(${entity} ${controllerMappingHyphen});
	public List<${entity}> get(${entity} ${controllerMappingHyphen}, int pageNum, int pageSize);

}
</#if>

