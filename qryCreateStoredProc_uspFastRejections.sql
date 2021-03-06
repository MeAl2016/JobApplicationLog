USE [JobApplicationLog]
GO
/****** Object:  StoredProcedure [dbo].[uspFastRejections]    Script Date: 11/20/2016 3:18:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[uspFastRejections] @DateDiff int  
AS
SELECT [EmployerName], [PositionTitle], 
FORMAT([DateApplied],'d', 'en-US') as Date_Applied, 
FORMAT([DateResponse],'d', 'en-US') as Date_Response, 
ISNULL(CONVERT(VARCHAR(30),[DateInterview],121),'') as Date_Interview
FROM [dbo].[JobApplications]
WHERE  [DateResponse] > 0 AND [DateInterview] IS NULL AND  
ABS(DATEDIFF(day, [DateResponse], [DateApplied])) < @DateDiff 
ORDER BY [DateApplied]
