# 1. Identify Top 10 Customers by Revenue
SELECT 
    C.CustomerID, C.Name,
    SUM(T.TotalPrice) AS TotalRevenue
FROM 
    transactions as T
JOIN 
    customers as C
ON
	T.CustomerID = C.CustomerID
GROUP BY 
    C.CustomerID, C.Name
ORDER BY
	TotalRevenue DESC
LIMIT 10;

# 2. Find repeat vs one-time customers.

-- first method
SELECT
    CASE 
        WHEN COUNT(t.TransactionID) = 1 THEN 'One-Time Customer'
        ELSE 'Repeat Customer'
    END AS CustomerType,
    COUNT(*) AS NumberOfCustomers
FROM
    Transactions t
GROUP BY
    t.CustomerID
    
-- second method
SELECT
    CASE
        WHEN TransactionCount = 1 THEN 'One-Time Customer'
        ELSE 'Repeat Customer'
    END AS CustomerType,
    COUNT(*) AS NumberOfCustomers
FROM (
    SELECT
        CustomerID,
        COUNT(*) AS TransactionCount
    FROM
        Transactions
    GROUP BY
        CustomerID
) AS CustomerTransactionCounts
GROUP BY
    CASE
        WHEN TransactionCount = 1 THEN 'One-Time Customer'
        ELSE 'Repeat Customer'
    END;
    
# 3. Calculate monthly revenue growth.

SELECT
DATE_FORMAT(TransactionDate, '%Y-%m') AS month,
    SUM(TotalPrice) AS monthly_revenue
FROM 
    transactions
GROUP BY 
    month
ORDER BY 
    month;

# 4. Join customer and transaction data to get customer LTV.

SELECT
    c.CustomerID,
    c.Name,
    SUM(t.TotalPrice) AS lifetime_value
FROM 
    customers c
JOIN 
    transactions t ON c.CustomerID = t.CustomerID
GROUP BY 
    c.CustomerID, c.Name
ORDER BY 
    lifetime_value DESC;