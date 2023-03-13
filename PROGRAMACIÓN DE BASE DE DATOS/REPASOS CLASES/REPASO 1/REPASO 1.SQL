SET SERVEROUTPUT ON;

DECLARE
v_id_emp NUMBER(4);
v_nombre_emp VARCHAR2(30);
v_salario_emp NUMBER(10);
BEGIN
  SELECT employee_id, first_name || ' ' || last_name, salary
    INTO v_id_emp, v_nombre_emp, v_salario_emp
    FROM employees
    WHERE employee_id=&id_emp;
  DBMS_OUTPUT.PUT_LINE('El empleado ' || v_id_emp || ' ' || v_nombre_emp || 
                       ' posee un salario de $' || v_salario_emp);
END;

DECLARE
  v_Minombre VARCHAR2(20);
BEGIN DBMS_OUTPUT.PUT_LINE('Mi nombre es: ' || v_minombre);
  v_Minombre := 'Juan';
  DBMS_OUTPUT.PUT_LINE('Mi nombre es: ' || v_minombre);
END;

VARIABLE b_porcentaje NUMBER
VARIABLE b_resultado NUMBER
EXEC :b_porcentaje:=0.25;
DECLARE
v_valor NUMBER(5):=1500;
BEGIN
  :b_resultado:=v_valor*:b_porcentaje;
END;

PRINT b_resultado


VAR b_fecha_proc VARCHAR2(7)
EXEC :b_fecha_proc:='01/2021'
VAR b_id_emp NUMBER
EXEC :b_id_emp:=100
DECLARE
v_salario employees.salary%TYPE;
v_pnombre VARCHAR2(20);
v_apellido employees.last_name%TYPE;
BEGIN
    SELECT e.first_name, e.last_name, e.salary
     INTO v_pnombre, v_apellido , v_salario
     FROM employees e 
  WHERE employee_id=:b_id_emp;
  DBMS_OUTPUT.PUT_LINE('En el proceso de remuneraciones de ' || :b_fecha_proc || ' el salario del empleado ' || v_pnombre || ' ' || v_apellido || ' ' ||
  ' fue de $ ' || v_salario);
END;