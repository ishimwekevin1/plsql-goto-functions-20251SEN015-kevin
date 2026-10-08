-- ============================================================
-- C1 - PAYROLL VALIDATOR
-- ============================================================

CREATE OR REPLACE FUNCTION fn_validate_payroll (
    p_employee_id NUMBER
)
RETURN VARCHAR2
IS

    v_salary employees.salary%TYPE;
    v_department_id employees.department_id%TYPE;
    v_count NUMBER;

BEGIN

    -- Check employee
    SELECT salary, department_id
    INTO v_salary, v_department_id
    FROM employees
    WHERE employee_id = p_employee_id;

    -- Validate salary
    IF v_salary <= 0 THEN
        RETURN 'INVALID: Salary must be greater than zero';
    END IF;

    -- Validate department
    SELECT COUNT(*)
    INTO v_count
    FROM departments
    WHERE department_id = v_department_id;

    IF v_count = 0 THEN
        RETURN 'INVALID: Department does not exist';
    END IF;

    RETURN 'VALID: Payroll record is correct';

EXCEPTION

    WHEN NO_DATA_FOUND THEN
        RETURN 'INVALID: Employee does not exist';

    WHEN OTHERS THEN
        RETURN 'ERROR: ' || SQLERRM;

END;
/
