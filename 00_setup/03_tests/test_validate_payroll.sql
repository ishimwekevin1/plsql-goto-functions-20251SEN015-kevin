-- ============================================================
-- C1 - PAYROLL VALIDATOR TEST
-- ============================================================

SET SERVEROUTPUT ON;

DECLARE
    v_result VARCHAR2(200);
BEGIN

    -- Valid employee
    v_result := fn_validate_payroll(101);

    DBMS_OUTPUT.PUT_LINE(
        'Employee 101: ' || v_result
    );

    -- Another valid employee
    v_result := fn_validate_payroll(103);

    DBMS_OUTPUT.PUT_LINE(
        'Employee 103: ' || v_result
    );

    -- Non-existing employee
    v_result := fn_validate_payroll(999);

    DBMS_OUTPUT.PUT_LINE(
        'Employee 999: ' || v_result
    );

END;
/
