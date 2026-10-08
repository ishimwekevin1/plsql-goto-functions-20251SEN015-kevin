-- ============================================================
-- FUNCTION TESTS
-- ============================================================

SET SERVEROUTPUT ON;

DECLARE

    v_annual_salary NUMBER;
    v_years NUMBER;
    v_tax NUMBER;
    v_department VARCHAR2(100);

BEGIN

    -- Test B1
    v_annual_salary := fn_annual_salary(500000);

    DBMS_OUTPUT.PUT_LINE(
        'B1 Annual Salary: ' || v_annual_salary
    );

    -- Test B2
    v_years := fn_years_of_service(
        DATE '2020-01-15'
    );

    DBMS_OUTPUT.PUT_LINE(
        'B2 Years of Service: ' || v_years
    );

    -- Test B3
    v_tax := fn_calculate_tax(6000000);

    DBMS_OUTPUT.PUT_LINE(
        'B3 Tax: ' || v_tax
    );

    -- Test B4
    v_department := fn_dept_name(30);

    DBMS_OUTPUT.PUT_LINE(
        'B4 Department: ' || v_department
    );

END;
/
