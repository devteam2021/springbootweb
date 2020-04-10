package ${package.Mapper};

import java.util.List;
import ${package.Entity}.${entity};
import ${superMapperClassPackage};

/**
 * <p>
 * ${table.comment!} Mapper 接口
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
<#if kotlin>
interface ${table.mapperName} : ${superMapperClass}<${entity}>
<#else>
public interface ${table.mapperName} extends ${superMapperClass}<${entity}> {

	public void add(${entity} ${controllerMappingHyphen});
	public void update(${entity} ${controllerMappingHyphen});
	public void del(String id);
	public ${entity} getById(String id);
	public List<${entity}> get(${entity} ${controllerMappingHyphen});

}
</#if>

