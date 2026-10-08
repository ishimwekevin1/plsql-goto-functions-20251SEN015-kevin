-- ============================================================
-- A2 - SALARY REVIEW
-- Demonstrates GOTO with salary classification
-- ============================================================

SET SERVEROUTPUT ON;

DECLARE
    v_employee_id employees.employee_id%TYPE := 103;
    v_salary employees.salary%TYPE;
    v_review VARCHAR2(30);
BEGIN

    SELECT salary
    INTO v_salary
    FROM employees
    WHERE employee_id = v_employee_id;

    IF v_salary >= 800000 THEN
        GOTO high_salary;

    ELSIF v_salary >= 500000 THEN
        GOTO normal_salary;

    ELSE
        GOTO low_salary;
    END IF;

    <<high_salary>>
    v_review := 'HIGH SALARY';
    GOTO display_review;

    <<normal_salary>>
    v_review := 'NORMAL SALARY';
    GOTO display_review;

    <<low_salary>>
    v_review := 'LOW SALARY';

    <<display_review>>
    DBMS_OUTPUT.PUT_LINE(
        'Employee ID: ' || v_employee_id
    );

    DBMS_OUTPUT.PUT_LINE(
        'Salary: ' || v_salary
    );

    DBMS_OUTPUT.PUT_LINE(
        'Salary Review: ' || v_review
    );

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(
            'Employee not found.'
        );

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            'Error: ' || SQLERRM
        );
END;
/
