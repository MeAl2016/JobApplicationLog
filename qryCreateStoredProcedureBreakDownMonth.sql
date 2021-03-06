USE [JobApplicationLog]
GO
/****** Object:  StoredProcedure [dbo].[uspSplitYearMonth]    Script Date: 2/15/2017 8:24:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[uspSplitYearMonth]
AS
WITH Applications_CTE(YM_A,Total_A)
AS
(
SELECT Format(DateApplied, 'yyyyMM'), Count(*)
FROM   JobApplications
GROUP BY Format(DateApplied, 'yyyyMM')
),

Response_CTE(YM_R,Total_R)
AS
(
SELECT Format(DateResponse, 'yyyyMM'), Count(*)
FROM   JobApplications
GROUP BY Format(DateResponse, 'yyyyMM')
),

Interview_CTE(YM_I,Total_I)
AS
(
SELECT Format(DateInterview, 'yyyyMM'), Count(*)
FROM   JobApplications
GROUP BY Format(DateInterview, 'yyyyMM')
)

SELECT YM_A, Total_A, Total_R, Total_I 
FROM Applications_CTE 
INNER JOIN Response_CTE ON YM_A = YM_R 
INNER JOIN Interview_CTE ON YM_A = YM_I
WHERE YM_R IS NOT NULL AND YM_I IS NOT NULL;
