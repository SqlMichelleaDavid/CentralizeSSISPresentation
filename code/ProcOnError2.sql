USE [ProcessControl]
GO
ALTER procedure [dbo].[OnError2]
	@serverName nvarchar(100), 
	@DBName nvarchar(100), 
	@JobPackageName nvarchar(100), 
	@ProjectName nvarchar(500),
	@TaskName nvarchar(100),
	@ErrorMessage nvarchar(max)	
as
begin

declare @EventName nvarchar(100), @Notification_Code nvarchar(100)

select @EventName = 'OnError'
select @Notification_Code = rtrim(@ProjectName) + '_' + @EventName

INSERT INTO [dbo].[ProcessStatusLog]
           ([Type]
		   ,[Notification_Code]
           ,[ServerName]
           ,[DBName]
           ,[JobPackageName]
           ,[ExecutionPath]
           ,[TaskName]
           ,[EventName]
           ,[ErrorMessage]
           --,[EntryTimeStamp]
		   )
     VALUES
           ('SSIS' --<Type, char(10),>
		   ,@Notification_Code 
           ,@serverName --<ServerName, nvarchar(100),>
           ,@DBName --<DBName, nvarchar(100),>
           ,@JobPackageName --<JobPackageName, nvarchar(100),>
           ,@ProjectName --<ExecutionPath, nvarchar(500),>
           ,@TaskName --<TaskName, nvarchar(100),>
           ,@EventName --<EventName, nvarchar(100),>
           ,@ErrorMessage --<ErrorMessage, nvarchar(max),>
           --,<EntryTimeStamp, datetime,>
		   )

end
 
