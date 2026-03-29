-- =====================================================
-- Shopping Trends Data Analysis
-- Description:
-- Analysis of customer behavior, seasonality, location trends,
-- and purchasing patterns to inform business decisions.
-- =====================================================

USE shoppingtrends_data;

-- =====================================================
-- 1. Total Unique Customers
-- =====================================================
-- Objective: Determine total customer base size

SELECT 
    COUNT(DISTINCT `Customer ID`) AS total_customers
FROM shoppingtrends_data;
-- Result: 3,900 customers


-- =====================================================
-- 2. Gender Distribution
-- =====================================================
-- Objective: Understand male vs female customer proportions

WITH gender_data AS (
    SELECT 
        Gender,
        COUNT(DISTINCT `Customer ID`) AS total_customers
    FROM shoppingtrends_data
    GROUP BY Gender
)
SELECT 
    SUM(total_customers) AS total_customers,
    ROUND(100 * SUM(CASE WHEN Gender = 'Female' THEN total_customers ELSE 0 END) 
        / SUM(total_customers), 2) AS pct_female,
    ROUND(100 * SUM(CASE WHEN Gender = 'Male' THEN total_customers ELSE 0 END) 
        / SUM(total_customers), 2) AS pct_male
FROM gender_data;
-- Insight:
-- Male: 68% (2,652)
-- Female: 32% (1,248)


-- =====================================================
-- 3. Seasonal Coverage
-- =====================================================
-- Objective: Identify seasons in dataset

SELECT DISTINCT Season
FROM shoppingtrends_data;
-- Seasons: Winter, Spring, Summer, Fall


-- =====================================================
-- 4. Top Purchased Items by Season (Example: Fall)
-- =====================================================
-- Objective: Identify most popular items in a given season

SELECT
    `Item Purchased`,
    COUNT(`Customer ID`) AS total_customers
FROM shoppingtrends_data
WHERE Season = 'Fall'
GROUP BY `Item Purchased`
ORDER BY total_customers DESC;

-- Insights:
-- Winter: Sunglasses, Pants, Shirts
-- Spring: Sweaters, Shorts, Blouse
-- Summer: Pants, Dresses, Jewelry
-- Fall: Jackets, Hats, Handbags


-- =====================================================
-- 5. Most Popular Colors by Season
-- =====================================================
-- Objective: Identify top color preferences per season

WITH ranked_colors AS (
    SELECT 
        Season,
        `Color`,
        COUNT(`Item Purchased`) AS purchase_count,
        RANK() OVER (
            PARTITION BY Season 
            ORDER BY COUNT(`Item Purchased`) DESC
        ) AS rnk
    FROM shoppingtrends_data
    GROUP BY Season, `Color`
)
SELECT 
    Season,
    `Color`,
    purchase_count
FROM ranked_colors
WHERE rnk = 1
ORDER BY purchase_count DESC;

-- Insights:
-- Summer: Silver (59)
-- Spring: Olive (52)
-- Fall: Yellow & Magenta (50)
-- Winter: Green (50)


-- =====================================================
-- 6. Customer Distribution by Location
-- =====================================================
-- Objective: Identify most active locations

SELECT 
    Location,
    COUNT(`Customer ID`) AS total_customers
FROM shoppingtrends_data
GROUP BY Location
ORDER BY total_customers DESC;

-- Insight: Montana has the highest customer count


-- =====================================================
-- 7. Location + Season Product Preferences (Example)
-- =====================================================
-- Objective: Compare item preferences by location and season

SELECT 
    `Item Purchased`,
    COUNT(`Customer ID`) AS total_customers
FROM shoppingtrends_data
WHERE Season = 'Fall'
  AND Location = 'Alabama'
GROUP BY `Item Purchased`
ORDER BY total_customers DESC;

-- Insights:
-- Alabama (Fall): Skirts, Jewelry, Dresses
-- Montana (Fall): Handbags, Sweaters, T-shirts
-- Conclusion: Stocking should vary by location and season


-- =====================================================
-- 8. Customer Experience by Location
-- =====================================================
-- Objective: Identify top-performing locations based on reviews

SELECT 
    Location,
    ROUND(AVG(`Review Rating`), 2) AS avg_review_rating
FROM shoppingtrends_data
GROUP BY Location
ORDER BY avg_review_rating DESC;

-- Insights:
-- Texas: 3.91
-- Wisconsin: 3.89
-- Recommendation: Benchmark these locations


-- =====================================================
-- 9. Customer Loyalty vs Spending
-- =====================================================
-- Objective: Analyze relationship between repeat purchases and spend

SELECT
    CASE 
        WHEN `Previous Purchases` >= 10 THEN 'More than 10'
        ELSE 'Less than 10'
    END AS purchase_group,
    SUM(`Purchase Amount (USD)`) AS total_purchase_amount
FROM shoppingtrends_data
GROUP BY purchase_group
ORDER BY total_purchase_amount DESC;

-- Insight:
-- Customers with 10+ previous purchases spend more overall
-- Recommendation: Target loyal customers for marketing campaigns

-- =====================================================
-- END OF ANALYSIS
-- =====================================================