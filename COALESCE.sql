SELECT nombre,apellido,
	--coalesce(telefono_oficina,' --No Tel--') || 'ext' || ext
	coalesce(telefono_oficina || 'Ext.' || ext, ' ** Sin Tel **') as telefono
	from empleados
	order by empleado_id
	
select empleado_id,nombre,apellido,telefono_oficina,ext
from empleados
order by empleado_id

update empleados set ext ='123' where empleado_id = 1

select coalesce(null,3,null,5,7,8)