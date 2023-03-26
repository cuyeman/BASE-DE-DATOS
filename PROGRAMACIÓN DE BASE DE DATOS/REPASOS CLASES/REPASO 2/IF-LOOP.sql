SET SERVEROUTPUT ON;

--trabajando con IF
/
DECLARE
var_nota number(2):=&INGRESAR_NOTA;
BEGIN

IF var_nota <3 THEN
DBMS_OUTPUT.PUT_LINE('DEBES ESTUDIAR');

ELSIF var_nota <4 THEN
DBMS_OUTPUT.PUT_LINE('DEBES ESTUDIAR UN POQUITO MAS');

ELSIF var_nota >=4 THEN
DBMS_OUTPUT.PUT_LINE('ESTAS AL BORDE');

END IF;
END;
/

--trabajando con loop

-- Vamos a utilizar estos datos como muestra
SELECT
    department_id,
    department_name
FROM
    departments;

/
declare
var_depid hr.departments.department_id%type;
var_depname hr.departments.department_name%type;
var_contador number:=10;
var_idmax number;
begin
    select max(department_id)
    into var_idmax
    from departments;

--iniciamos el loop    
loop
SELECT
    department_id, department_name
    into var_depid, var_depname
FROM
    departments
    where department_id=var_contador ;
    
--imprimimos el output con el resultado de cada linea
DBMS_OUTPUT.PUT_LINE('El id del departamento '||var_depname||' es '||var_depid );

--sumamos 10 al contador
var_contador := var_contador + 10;
--indicamos cuando debemos salir del ciclo
exit when  var_contador > var_idmax;
end loop;

end;


/




