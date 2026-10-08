-- ============================================================
-- A3 - ILLEGAL GOTO EXAMPLE
-- ============================================================

SET SERVEROUTPUT ON;

DECLARE
    v_number NUMBER := 10;
BEGIN

    GOTO inside_if;

    IF v_number > 0 THEN

        <<inside_if>>
        DBMS_OUTPUT.PUT_LINE(
            'Number is positive.'
        );

    END IF;

END;
/-- ============================================================
-- A3 - CORRECTED VERSION
-- ============================================================

SET SERVEROUTPUT ON;

DECLARE
    v_number NUMBER := 10;
BEGIN

    IF v_number > 0 THEN
        GOTO positive_number;
    END IF;

    GOTO finish;

    <<positive_number>>
    DBMS_OUTPUT.PUT_LINE(
        'Number is positive.'
    );

    <<finish>>
    DBMS_OUTPUT.PUT_LINE(
        'Program completed successfully.'
    );

END;
/
