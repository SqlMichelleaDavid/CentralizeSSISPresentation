USE [ProcessControl]
GO

CREATE TABLE [dbo].[ProcessStatusLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Notification_Code] [nvarchar](100) NULL,
	[Type] [char](10) NOT NULL,
	[ServerName] [nvarchar](100) NOT NULL,
	[DBName] [nvarchar](100) NOT NULL,
	[JobPackageName] [nvarchar](100) NOT NULL,
	[ExecutionPath] [nvarchar](500) NOT NULL,
	[TaskName] [nvarchar](100) NOT NULL,
	[EventName] [nvarchar](100) NOT NULL,
	[ErrorMessage] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
	[EntryTimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_ProcessStatusLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ProcessStatusLog] ADD  DEFAULT (getdate()) FOR [EntryTimeStamp]
GO


