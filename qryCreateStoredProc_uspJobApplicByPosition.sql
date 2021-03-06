USE [JobApplicationLog]
GO
/****** Object:  StoredProcedure [dbo].[uspJobApplicByPosition]    Script Date: 11/20/2016 3:16:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[uspJobApplicByPosition] @Position nvarchar(30) 
AS
SELECT [EmployerName], [PositionTitle], 
FORMAT([DateApplied],'d', 'en-US') as Date_Applied, 
CASE 
WHEN [DateResponse] IS NULL THEN ' '
ELSE 
FORMAT([DateResponse],'d', 'en-US')
END AS Date_Response, 
CASE 
WHEN [DateInterview] IS NULL THEN ' '
ELSE 
FORMAT([DateInterview],'d', 'en-US')
END AS Date_Interview,
CASE 
WHEN [FurtherDevelopment] IS NULL THEN ' '
ELSE 
[FurtherDevelopment] 
END AS Further_Development 
FROM [dbo].[JobApplications]
WHERE [PositionTitle] LIKE '%' + @Position + '%' 
ORDER BY [DateApplied]
