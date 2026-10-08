-- ============================================================
-- A1 - NUMBER CLASSIFIER
-- Demonstrates PL/SQL GOTO
-- ============================================================

SET SERVEROUTPUT ON;

DECLARE
    v_number NUMBER := -15;
    v_result VARCHAR2(30);
BEGIN

    IF v_number > 0 THEN
        GOTO positive_number;
    ELSIF v_number < 0 THEN
        GOTO negative_number;
    ELSE
        GOTO zero_number;
    END IF;

    <<positive_number>>
    v_result := 'POSITIVE';
    GOTO display_result;

    <<negative_number>>
    v_result := 'NEGATIVE';
    GOTO display_result;

    <<zero_number>>
    v_result := 'ZERO';

    <<display_result>>
    DBMS_OUTPUT.PUT_LINE(
        'Number: ' || v_number
    );

    DBMS_OUTPUT.PUT_LINE(
        'Classification: ' || v_result
    );

END;
/
