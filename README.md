# JobApplicationLog
SQL Server 2014 Database with Stored Procedures, SSIS Packages and VB 2013 .Net Application showing my job search status.
The Central Part is the Table JobApplications:
CREATE TABLE [dbo].[JobApplications](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmployerName] [nvarchar](255) NOT NULL,
	[PositionTitle] [nvarchar](255) NOT NULL,
	[DateApplied] [datetime] NULL,
	[DateResponse] [datetime] NULL,
	[DateInterview] [datetime] NULL,
	[FurtherDevelopment] [nvarchar](255) NULL
  ...................
  There are some Stored Procedures for fast searches by Employer Name and Position ID:
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

Records are entered/updated/displayed with one simple Visual Basic 2013 DataGridView
Windows Desktop Application.
The Tables Size is several thousand recods for now.



