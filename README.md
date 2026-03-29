# customer_shopping_trend_analysis - SQL Project
In this project, I sourced a customer sales trends dataset from Kaggle. I take on the role of customer analytics Lead for a large retail store, hired to help them answer;
What items should be stocked, and when, to maximize sales and profits, reduce lost sales, and minimize dead stock?
## Phase 1: Understanding the problem
Began by reviewing the business context and familiarizing myself with the dataset, like what kind of store is this, what does each column mean? What time period is covered?
## Phase 2: Defined my questions and planned the analysis
Once I understood the dataset and the business challange, I outlined the questions i will use SQL to answer.

# KEY QUESTIONS 
1. How many unique visitors have visited the store during the time period provided
(to get a sense of the sample size you’re working with)
2. Should we stock more male or female clothing
(What % of customers are male vs female?)
3. What seasons are represented in the data?
(helps us to understand trends by time period)
4. What are the most purchased categories and or items by season?
(This will help guide seasonal stocking strategies)
5. What are the most popular items and item colors
(Do colors affect preference and buying decisions?)
6. Should stocking strategies vary by store location
(You can also explore if customer gender varies by location)
7. Which locations are top-performing in items of customer experience?
(We will use the frequency of customer visits or the average spend.)
8. Does having more than 10 previous purchases correlate with higher total spending?
(Understanding customer loyalty and value)

## SUMMARY OF FINDINGS & KEY RECOMMENDATIONS
### 1. Customer Base Size
The dataset includes 3,900 unique customers, giving a solid sample for analysis.
### 2. Gender Distribution
68% Male (2,652 customers)
32% Female (1,248 customers)
- Insight: Demand is male-dominated, so inventory should lean more toward men’s products while still catering to women.
### 3. Seasonal Coverage
All four seasons are represented: Winter, Spring, Summer, Fall
-Insight: This enables year-round seasonal stocking strategies.
### 4. Top Products by Season
Winter: Sunglasses, Pants, Shirts
Spring: Sweaters, Shorts, Blouse
Summer: Pants, Dresses, Jewelry
Fall: Jackets, Hats, Handbags
- Insight: Customer preferences change by season, so inventory should be season-specific with an emphasis on top selling categories.
### 5. Most Popular Colors by Season
Summer: Silver (highest overall)
Spring: Olive
Fall: Yellow & Magenta (tie)
Winter: Green
- Insight: Color preferences vary by season, which can guide product design and stocking.
### 6. Location-Based Insights
Most popular location: Montana (highest customer count)
Preferences differ by location:
Alabama (Fall): Skirts, Jewelry, Dresses
Montana (Fall): Handbags, Sweaters, T-shirts
- Insight: Stocking should be customized by both location and season by analyzing sales patterns at each store.
### 7. Customer Experience (Reviews)
Top-performing locations:
Texas (3.91)
Wisconsin (3.89)
- Insight: These locations set a benchmark for customer experience—others can learn from them.
### 8. Customer Loyalty & Spending
Customers with 10+ previous purchases spend more overall
- Insight: There’s a strong link between loyalty and higher spending → ideal segment for targeted marketing and retention campaigns.

## Overall Takeaway
This data shows that customer behavior is not one-size-fits-all. The strongest strategies will:
Adapt to gender demand.
Change with the seasons.
Be tailored to the location.
Focus should be on loyal, repeat customers.
