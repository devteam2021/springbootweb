package ${package.ServiceImpl};

import ${package.Entity}.${entity};
import ${package.Mapper}.${table.mapperName};
import ${package.Service}.${table.serviceName};
import ${superServiceImplClassPackage};
import java.util.List;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * ${table.comment!} 服务实现类
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
@Service
<#if kotlin>
open class ${table.serviceImplName} : ${superServiceImplClass}<${table.mapperName}, ${entity}>(), ${table.serviceName} {

}
<#else>
public class ${table.serviceImplName} extends ${superServiceImplClass}<${table.mapperName}, ${entity}> implements ${table.serviceName} {

	@Autowired
	${table.mapperName} ${controllerMappingHyphen}Mapper;
	
	@Override
	public void add(${entity} ${controllerMappingHyphen}) {
		${controllerMappingHyphen}Mapper.add(${controllerMappingHyphen});
	}

	@Override
	public void del(String id) {
		${controllerMappingHyphen}Mapper.del(id);
	}

	@Override
	public void update(${entity} ${controllerMappingHyphen}) {
		${controllerMappingHyphen}Mapper.update(${controllerMappingHyphen});
	}
	
	
	@Override
	public ${entity} getById(String id) {
		return ${controllerMappingHyphen}Mapper.getById(id);
	}

	@Override
	public List<${entity}> get(${entity} ${controllerMappingHyphen}) {
		List<${entity}> ${controllerMappingHyphen}List = ${controllerMappingHyphen}Mapper.get(${controllerMappingHyphen});
		return ${controllerMappingHyphen}List;
	}

	@Override
	public List<${entity}> get(${entity} ${controllerMappingHyphen}, int pageNum, int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<${entity}> ${controllerMappingHyphen}List = ${controllerMappingHyphen}Mapper.get(${controllerMappingHyphen});
		return ${controllerMappingHyphen}List;
	}

}
</#if>

