
-- Create Database and Use it
CREATE DATABASE Uber_Analytics;
USE Uber_Analytics;

-- ==========================================
-- 1. OVERVIEW & KPI METRICS (Top Banner)
-- ==========================================

-- Completed Bookings
SELECT COUNT(`Booking ID`) AS Completed_Bookings 
FROM uber_data 
WHERE `Booking Status` = 'Completed';

-- Lost Bookings (Cancelled or Incomplete)
SELECT COUNT(`Booking ID`) AS Lost_Bookings 
FROM uber_data 
WHERE `Booking Status` != 'Completed';

-- Total Revenue
SELECT SUM(`Booking Value`) AS Total_Revenue 
FROM uber_data 
WHERE `Booking Status` = 'Completed';

-- Total & Average Distance
SELECT 
    SUM(`Ride Distance`) AS Total_Distance,
    ROUND(AVG(`Ride Distance`), 2) AS Avg_Distance
FROM uber_data;

-- ==========================================
-- 2. VEHICLE ANALYTICS VIEW
-- ==========================================

-- Vehicle Performance Table (Matches the table in Vehicle View)
SELECT 
    `Vehicle Type`,
    COUNT(DISTINCT `Customer ID`) AS Customer_Count,
    SUM(`Booking Value`) AS Revenue,
    COUNT(`Booking ID`) AS Completed_Booking
FROM uber_data
WHERE `Booking Status` = 'Completed'
GROUP BY `Vehicle Type`
ORDER BY Completed_Booking DESC;

-- ==========================================
-- 3. REVENUE ANALYTICS VIEW
-- ==========================================

-- Revenue by Payment Method
SELECT `Payment Method`, SUM(`Booking Value`) AS Revenue
FROM uber_data
WHERE `Booking Status` = 'Completed'
GROUP BY `Payment Method`
ORDER BY Revenue DESC;

-- Top 5 Customers by Revenue
SELECT `Customer ID`, SUM(`Booking Value`) AS Total_Revenue
FROM uber_data
WHERE `Booking Status` = 'Completed'
GROUP BY `Customer ID`
ORDER BY Total_Revenue DESC
LIMIT 5;

-- ==========================================
-- 4. RIDER ANALYTICS VIEW
-- ==========================================

-- Rider Loyalty Segmentation (First Time, Return, Regular)
WITH CustomerRideCounts AS (
    SELECT `Customer ID`, COUNT(`Booking ID`) as Ride_Count
    FROM uber_data
    WHERE `Booking Status` = 'Completed'
    GROUP BY `Customer ID`
)
SELECT 
    CASE 
        WHEN Ride_Count = 1 THEN 'First Time Rider'
        WHEN Ride_Count = 2 THEN 'Return Rider'
        ELSE 'Regular Rider' 
    END AS Rider_Segment,
    COUNT(`Customer ID`) AS Total_Customers
FROM CustomerRideCounts
GROUP BY Rider_Segment;

-- Top Reasons for Cancellation by Customer
SELECT `Reason for cancelling by Customer`, COUNT(`Booking ID`) AS Cancel_Count
FROM uber_data
WHERE `Booking Status` = 'Cancelled by Customer'
GROUP BY `Reason for cancelling by Customer`
ORDER BY Cancel_Count DESC;

-- ==========================================
-- 5. LOCATION ANALYTICS VIEW
-- ==========================================

-- Top 5 Pickup Locations by Booking Count
SELECT `Pickup Location`, COUNT(`Booking ID`) AS Booking_Count
FROM uber_data
GROUP BY `Pickup Location`
ORDER BY Booking_Count DESC
LIMIT 5;

-- Top 5 Drop Locations by Booking Count
SELECT `Drop Location`, COUNT(`Booking ID`) AS Booking_Count
FROM uber_data
GROUP BY `Drop Location`
ORDER BY Booking_Count DESC
LIMIT 5;

-- Average Ratings
SELECT 
    ROUND(AVG(`Customer Rating`), 2) AS Avg_Customer_Rating,
    ROUND(AVG(`Driver Ratings`), 2) AS Avg_Driver_Rating
FROM uber_data;
