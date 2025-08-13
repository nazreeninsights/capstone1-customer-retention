-- *Alteration due to question 3
USE capstone;

ALTER TABLE capstone.transactions ADD COLUMN CleanTransactionDate DATE;

SELECT* from transactions;

UPDATE capstone.transactions
SET CleanTransactionDate = STR_TO_DATE(TransactionDate, '%m/%d/%Y');

ALTER TABLE capstone.transactions DROP COLUMN TransactionDate;

ALTER TABLE capstone.transactions CHANGE COLUMN CleanTransactionDate TransactionDate DATE;

