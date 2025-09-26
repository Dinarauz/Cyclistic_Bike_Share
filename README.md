# Cyclistic Bike Share Analysis

![logo](https://github.com/user-attachments/assets/99589196-e604-4918-a9c1-a2d2d62921be)

## Member vs Casual Rider Usage Patterns in Chicago (2023-2024)
Analyzed bike share usage data to understand how annual members and casual riders use Cyclistic bikes differently. Built insights to help convert casual riders into annual memberships through targeted marketing strategies.

# Business Problem:

**Brief history of the company:**
Cyclistic launched its bike-share program in 2016 and has grown to 5,824 GPS-tracked bikes across 692 stations in Chicago. The system offers flexible pickup/drop-off at any station throughout the city.

**Customer Segments:**
- **Casual Riders:** single-ride and full-day pass users.
- **Annual members:** Subscription-based users with yearly memberships.

*Customers who purchase single-ride or full-day passes are referred to as casual riders.
Customers who purchase annual memberships are Cyclistic members.*

**Marketing Challenge:**
Rather than acquiring new customers, Cyclistic wants to convert existing casual riders into profitable annual members. The marketing team needed to understand usage differences between these groups to design targeted conversion strategies.

**Analysis Approach:**
**Data Period:** December 2023 - December 2024
**Focus Question:** How do annual members and casual riders use Cyclistic bikes differently?

**Data Processing:**
- Cleaned dataset by removing null values from ride records
- Handled "Unknown" values in the started_at column
- Analyzed usage patterns by customer type, time periods, and bike preferences

**Technical Implementation:**
**SQL Analysis:** [bike_ride_SQL.sql](https://github.com/Dinarauz/Cyclistic_Bike_Share/blob/main/bike_ride_SQL.sql) | https://github.com/Dinarauz/Cyclistic_Bike_Share/blob/main/bike_ride_sample.sql
- Data cleaning and aggregation using SQL queries
- Customer segmentation analysis (members vs casual riders)
- Time series analysis of seasonal usage patterns
- Geographic analysis of popular station locations
- Statistical comparisons of ride duration and frequency

**Key Findings:**
**Usage Frequency**
Members use the bike system way more than casual riders they've made it part of their daily routine with more frequent, shorter trips.

**Timing Patterns:**
- Members: Prefer weekday usage (likely commuting to work)
- Casual Riders: Peak usage on weekends (recreational riding)

**Seasonal Behavior:**
- Casual Riders: Big spike in summer months (June-August)
- Members: Consistent usage year-round regardless of season

**Bike Preferences:**
- Members: Favor electric bikes for quick, efficient trips
- Casual Riders: Take longer rides, often using traditional bikes

## Business Recommendations: 
**Targeted Marketing Strategies**
Summer Promotions: Launch membership conversion campaigns during June-August when casual usage peaks. Offer limited-time discounts to capitalize on high engagement.

**Weekend Membership Options:** Create weekend-only or flexible membership tiers for casual riders who primarily use bikes recreationally.

**Geographic Optimization:**
- Increase marketing presence at high-traffic casual rider locations
- Remove bikes from underutilized stations and redistribute to office-heavy areas where potential commuter members work

**Conversion Strategy:**
Focus on demonstrating the value of consistent, year-round usage to casual riders who currently only bike seasonally or on weekends.

## Data Challenges

**Data Quality Issues:**
- Multiple null values required extensive cleaning
- "Unknown" entries in timestamp data needed special handling
- Missing geographic data for some station locations

These issues were resolved through data validation and cleaning processes before analysis.

## Impact & Next Steps
Current Limitations

Data Quality: Null values and "Unknown" entries required significant cleaning
Time Period: Limited to 12-month analysis (Dec 2023 - Dec 2024)
Demographic Gap: No customer demographic data beyond membership type
Geographic Detail: Station-level analysis limited by data availability

Future Analysis
Short-term (3-6 months):

A/B testing framework for marketing campaign effectiveness
Revenue impact analysis of conversion strategies
Seasonal promotion optimization

Long-term (6+ months):

Multi-year trend analysis to validate patterns
Integration of demographic data for more targeted marketing
Predictive modeling for conversion probability scoring
Cross-city comparison with other bike-share programs

Skills Demonstrated

SQL: Complex queries for data cleaning and customer segmentation
Data Analysis: Time series analysis, customer behavior patterns
Business Intelligence: Translating data insights into marketing strategies
Visualization: Interactive dashboard development in Tableau
Problem Solving: Data quality issues resolution and strategic recommendations


Tools: Tableau, Data Analysis, Customer Segmentation
Industry: Transportation & Urban Mobility

**Tableau Public**
[https://public.tableau.com/app/profile/dinara.ibotova/viz/CyclisticBikeUsageAnalysisMembersvs_CasualRiders/Dashboard2?publish=yes](https://public.tableau.com/app/profile/dinara.ibotova/viz/CyclisticBikeShareProjectDashboard/Dashboard2?publish=yes)



**Recommendations:**
The first recommendation is to create promotions for casual members during the summer months since our data showed a peak during the summer months. Also, to create weekend-exclusive memberships to casual members such as discounts to attract them. Finally, create more marketing around popular areas so we can attract more individuals as well as remove locations where bikes are not being used and add to the locations with many offices. 


