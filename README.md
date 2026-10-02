# 🚖 Uber Operations & Performance Analytics Dashboard

## 📌 Project Overview
This project is an end-to-end Business Intelligence solution analyzing a comprehensive dataset of Uber rides. Designed to evaluate operational efficiency, revenue generation, and customer behavior, this dashboard empowers stakeholders to track ride completion rates, pinpoint cancellation drivers, and optimize fleet allocation based on geographic demand.

**Author**: Prashant Sharma  
**Tools Used**: Power BI, SQL, Data Modeling, Excel  
**Dataset**: Real-World Uber Ride Operations Data (`uber.xlsx`)

📊 Dashboard Views & Insights
The dashboard is structured into distinct analytical views to provide targeted, department-specific insights.

1. Welcome Screen
The landing page providing intuitive navigation across the five distinct analytical modules.

2. Executive Overview
Monitors top-level KPIs including Completed vs. Lost Bookings, Total Revenue, and high-level vehicle performance.

3. Vehicle Analytics
Drills down into fleet performance, comparing Customer Count, Revenue, and Completed Bookings across vehicle types (Auto, Bike, Go Mini, Go Sedan, Premier, Uber XL).

4. Revenue Analytics
Tracks financial performance over time and breaks down revenue by Payment Method (UPI, Cash, Wallet, Cards) and Top Performing Customers.

5. Rider Behavior Analytics
Segments users into First-Time, Return, and Regular Riders. Analyzes granular cancellation reasons (e.g., Driver not moving, Change of plans) to improve retention.

6. Location & Distance Analytics
Maps geographic demand by identifying the highest-volume Pickup and Drop-off locations (e.g., DLF Phase 3, Anand Vihar). Tracks average trip distances and daily booking heatmaps.

💡 Key Business Findings
Rider Retention: A significant volume of completed rides comes from 'First Time' riders, highlighting a strategic opportunity to implement loyalty campaigns to convert them into 'Regular' riders.

Cancellation Drivers: A major portion of 'Lost Bookings' are driven by customer cancellations due to "Driver is not moving toward pickup" or "Change of plans," indicating a need for better driver routing and allocation algorithms.

Revenue by Vehicle: 'Go Sedan' and 'Auto' categories generate the highest cumulative revenue, while 'Bikes' lead in pure booking volume for shorter, high-frequency distances.

Payment Preferences: UPI and Cash dominate the transaction methods, significantly outpacing Credit/Debit cards and internal wallets.

Geographic Hotspots: Locations like DLF Phase 3 and Anand Vihar consistently register the highest pickup volumes, making them prime targets for driver incentive staging during peak hours.

🛠️ Technical Implementation
Data Transformation (Power Query): Cleansed raw operational data, standardized booking status categories, extracted Time Slots (e.g., 03 AM - 06 AM), and handled null values in cancellation metrics.

DAX Measures: Engineered complex dynamic measures for counting distinct customers, segmenting ride types, and calculating cumulative revenue trends.

SQL Backend Verification: Replicated complex dashboard aggregations (such as Rider Segment bucketing via CTEs and Window Functions) in SQL to validate data integrity.

📁 Repository Structure
/Data: Contains the uber.xlsx raw dataset.

/Dashboard: Contains the Power BI (.pbix) file and all high-resolution dashboard screenshots.

/SQL_Queries: Contains Uber_Analytics_Queries.sql demonstrating the backend logic used to generate the dashboard insights.
