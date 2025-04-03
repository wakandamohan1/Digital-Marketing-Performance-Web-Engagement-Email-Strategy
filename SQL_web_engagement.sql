
--WEB ENGAGMENT SQL QUERIES
USE ASHWIN1;

SELECT * FROM WEB_ENGAGEMENT;

--1. Total Unique Visitors
SELECT SUM(Unique_Visitors) Total_Unique_Visitors FROM WEB_ENGAGEMENT;

--2. Average Bounce Rate (%)
SELECT ROUND(AVG(Bounce_Rate),2) AS Average_Bounce_Rate
FROM WEB_ENGAGEMENT;

--3.  Average Session Duration (Minutes)

SELECT ROUND(AVG(Avg_Session_Duration_min),2) AS Avg_Session_Duration_MINS
FROM WEB_ENGAGEMENT;

--4. Traffic Source Breakdown
SELECT Traffic_Source, SUM(Unique_Visitors) Total_Visitors
FROM WEB_ENGAGEMENT
GROUP BY Traffic_Source
ORDER BY Total_Visitors DESC;

--5.  Device Usage Share

SELECT Device_Type, SUM(Unique_Visitors) AS Total_Visitors
FROM  WEB_ENGAGEMENT
GROUP BY Device_Type
ORDER BY Total_Visitors DESC;


--6. Top 5 Regions by Unique Visitors

SELECT TOP 5 Region, SUM(Unique_Visitors) AS Total_Visitors
FROM WEB_ENGAGEMENT
GROUP BY Region
ORDER BY Total_Visitors DESC;


--7. bottom 5 Regions by Unique Visitors

SELECT TOP 5 Region, SUM(Unique_Visitors) AS Total_Visitors
FROM WEB_ENGAGEMENT
GROUP BY Region
ORDER BY Total_Visitors asc;


--8. Engagement by Date (Time Series)

SELECT CAST(Date_Time AS DATE) AS Date, SUM(Unique_Visitors) AS Total_Visitors
FROM WEB_ENGAGEMENT
GROUP BY CAST(Date_Time AS DATE)
ORDER BY Date;

--✅ This groups data by full dates only (e.g., 2023-12-14, 2023-02-14), ignoring the time part. 
--So yeah, no castration—just aggregation! 🤣 🚀

--example 
--Yes! CAST in SQL Server can convert an INT to FLOAT (or other data types).
--Example: Converting INT to FLOAT
SELECT CAST(10 AS FLOAT) AS Converted_Value;

SELECT name FROM sys.databases;
