CREATE TABLE mart_loans AS
SELECT *
FROM stg_loans
WHERE loan_status IN ('Fully Paid', 'Charged Off');

ALTER TABLE mart_loans ADD COLUMN default_flag INT;

SET SQL_SAFE_UPDATES = 0;

UPDATE mart_loans
SET default_flag = 1
WHERE loan_status = 'Charged Off';

UPDATE mart_loans
SET default_flag = 0
WHERE loan_status = 'Fully Paid';
