-- ============================================================
-- B3 - TAX CALCULATOR FUNCTION
-- Demonstration tax calculation
-- ============================================================

CREATE OR REPLACE FUNCTION fn_calculate_tax (
    p_annual_salary NUMBER
)
RETURN NUMBER
IS
    v_tax NUMBER;
BEGIN

    IF p_annual_salary <= 5000000 THEN

        v_tax := p_annual_salary * 0.10;

    ELSIF p_annual_salary <= 10000000 THEN

        v_tax := p_annual_salary * 0.20;

    ELSE

        v_tax := p_annual_salary * 0.30;

    END IF;

    RETURN v_tax;

END;
/
