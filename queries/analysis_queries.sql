/* ============================================================
   Query 1: Customer Segmentation by Total Purchase
   Purpose: Show total sales grouped by customer gender and product category
   ============================================================ */
SELECT 
    c.Gender,                                -- Customer gender (M/F)
    pc.ProductCategoryName,                  -- Product category name
    SUM(s.SalesAmount) AS TotalSales         -- Aggregate total sales
FROM Sales s
JOIN Product p ON s.ProductID = p.ProductID  -- Link sales to products
JOIN ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID
JOIN Customer c ON s.CustomerID = c.CustomerID
GROUP BY c.Gender, pc.ProductCategoryName    -- Group results by gender + category
ORDER BY TotalSales DESC;                    -- Sort by highest sales first


/* ============================================================
   Query 2: Product Category and Sales by Year
   Purpose: Show yearly sales totals per product category
   ============================================================ */
SELECT 
    pc.ProductCategoryName,                  -- Product category
    YEAR(s.OrderDate) AS CalendarYear,       -- Extract year from order date
    SUM(s.SalesAmount) AS TotalSales         -- Aggregate total sales
FROM Sales s
JOIN Product p ON s.ProductID = p.ProductID
JOIN ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.ProductCategoryName, YEAR(s.OrderDate)
ORDER BY CalendarYear, TotalSales DESC;      -- Sort by year, then sales


/* ============================================================
   Query 3: Top 10 Best-Selling Products
   Purpose: Identify the 10 products with the highest total sales
   ============================================================ */
SELECT 
    p.ProductName,                           -- Product name
    SUM(s.SalesAmount) AS TotalSales         -- Aggregate total sales
FROM Sales s
JOIN Product p ON s.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalSales DESC                     -- Sort by highest sales
LIMIT 10;                                    -- Restrict to top 10 products


/* ============================================================
   Query 4: Total Sales by Product Category
   Purpose: Show overall sales totals per product category
   ============================================================ */
SELECT 
    pc.ProductCategoryName,                  -- Product category
    SUM(s.SalesAmount) AS TotalSales         -- Aggregate total sales
FROM Sales s
JOIN Product p ON s.ProductID = p.ProductID
JOIN ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.ProductCategoryName
ORDER BY TotalSales DESC;                    -- Sort by highest sales

