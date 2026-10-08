-- ============================================================
-- A4 - REWRITE WITHOUT GOTO
-- ============================================================

SET SERVEROUTPUT ON;

DECLARE
    v_number NUMBER := -25;
    v_result VARCHAR2(30);
BEGIN

    IF v_number > 0 THEN
        v_result := 'POSITIVE';

    ELSIF v_number < 0 THEN
        v_result := 'NEGATIVE';

    ELSE
        v_result := 'ZERO';
    END IF;

    DBMS_OUTPUT.PUT_LINE(
        'Number: ' || v_number
    );

    DBMS_OUTPUT.PUT_LINE(
        'Classification: ' || v_result
    );

END;
/
