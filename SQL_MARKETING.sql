
USE ASHWIN1;

SELECT * FROM EMAIL;
SELECT  * FROM activity;
SELECT * FROM campaign;

-- JOIN

SELECT * FROM EMAIL e
JOIN CAMPAIGN c ON e.campaign_id = c.campaign_id
JOIN ACTIVITY a ON e.email_id = a.email_id;

--2) Open Rate

SELECT 
    (COUNT(CASE WHEN activity_type IN ('Open') THEN 1 END) * 100.0 / 
     COUNT(*)) AS Open_Rate
FROM ACTIVITY
JOIN Email ON activity.Email_ID = email.Email_ID  -- Join Activities with Emails based on EmailID
JOIN Campaign ON Email.Campaign_ID = Campaign.Campaign_ID;


3)  Click-Through Rate (CTR)

SELECT 
    (COUNT(CASE WHEN activity_type = 'Click' THEN 1 END) * 100.0 / 
     COUNT(*)) AS Click_Through_Rate
FROM ACTIVITY;

4) Click through Open Rate 
--unique 

SELECT 
    (COUNT(CASE WHEN activity_type = 'Click' THEN 1 END) * 100.0 / 
     COUNT(CASE WHEN activity_type ='Open' THEN 1 END)) AS Click_to_Open_Rate
FROM ACTIVITY;




4) Campaign Engagement Rate

SELECT 
    CASE 
        WHEN COUNT(*) = 0 THEN 0
        ELSE 
            (CAST(COUNT(CASE WHEN activity.Activity_Type IN ('OPEN', 'CLICK') THEN 1 END) AS FLOAT) / COUNT(*)) * 100
    END AS EngagementRate
FROM Activity;

--optional 
JOIN Email ON activity.Email_ID = email.Email_ID  -- Join Activities with Emails based on EmailID
JOIN Campaign ON Email.Campaign_ID = Campaign.Campaign_ID;


5) Top Performing Campaigns

SELECT top 5
    C.campaign_id, 
    COUNT(A.activity_id) AS Total_Activities
FROM CAMPAIGN C
LEFT JOIN EMAIL E ON C.campaign_id = E.campaign_id
LEFT JOIN ACTIVITY A ON E.email_id = A.email_id
GROUP BY C.campaign_id
ORDER BY Total_Activities DESC ;

6) Average Activity Per Email

SELECT 
    (COUNT(A.activity_id) * 1.0 / COUNT(DISTINCT E.email_id)) AS Avg_Activity_Per_Email
FROM EMAIL E
LEFT JOIN ACTIVITY A ON E.email_id = A.email_id;

7)  Activity Breakdown by Type

SELECT 
    activity_type, 
    COUNT(*) AS Activity_Count,
    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ACTIVITY)) AS Percentage
FROM ACTIVITY
GROUP BY activity_type;


8) Email Sent vs Activity Timeline

SELECT 
    YEAR(E.email_sent_date) AS Year,
    COUNT(DISTINCT E.email_id) AS Emails_Sent,
    COUNT(A.activity_id) AS Total_Activities
FROM EMAIL E
LEFT JOIN ACTIVITY A ON E.email_id = A.email_id
GROUP BY YEAR(E.email_sent_date)
ORDER BY Year;