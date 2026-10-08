-- ============================================================
-- B1 - ANNUAL SALARY FUNCTION
-- ============================================================

CREATE OR REPLACE FUNCTION fn_annual_salary (
    p_monthly_salary NUMBER
)
RETURN NUMBER
IS
BEGIN
    RETURN p_monthly_salary * 12;
END;
/
