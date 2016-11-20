USE [JobApplicationLog]
GO

/****** Object:  Table [dbo].[JobApplications]    Script Date: 10/13/2016 3:45:48 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[dbo].[JobApplications]') IS NOT NULL
begin
        DROP TABLE [dbo].[JobApplications] 
end

CREATE TABLE [dbo].[JobApplications](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmployerName] [nvarchar](255) NOT NULL,
	[PositionTitle] [nvarchar](255) NOT NULL,
	[DateApplied] [datetime] NULL,
	[DateResponse] [datetime] NULL,
	[DateInterview] [datetime] NULL,
	[FurtherDevelopment] [nvarchar] (255) NULL,
 CONSTRAINT [PK_JobApplications_ID] PRIMARY KEY CLUSTERED ([ID] ASC) 
   WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, 
 IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) 
ON [PRIMARY]
GO

ALTER TABLE [dbo].[JobApplications]  WITH CHECK 
ADD  CONSTRAINT [FK_JobApplications_EmployerName] FOREIGN KEY([ID])
REFERENCES [dbo].[JobApplications] ([ID])
GO

ALTER TABLE [dbo].[JobApplications] CHECK 
CONSTRAINT [FK_JobApplications_EmployerName]
GO


