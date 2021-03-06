USE [ProcessControl]
GO

ALTER procedure [dbo].[OnPostExec2]
	@serverName nvarchar(100), 
	@DBName nvarchar(100), 
	@JobPackageName nvarchar(100), 
	@ProjectName nvarchar(500),
	@TaskName nvarchar(100),
	@Note nvarchar(max)
as
begin

if @JobPackageName like '%***' or @TaskName like '%***' or @JobPackageName = 'MAIN_PROCESS'
begin
declare @EventName nvarchar(100), @Notification_Code nvarchar(100)

select @EventName = 'OnPostExec', @JobPackageName = replace(@JobPackageName,'***',''), @TaskName = replace(@TaskName,'***','')
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
		   ,[Note]
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
           ,'' --<ErrorMessage, nvarchar(max),>
		   ,@Note
           --,<EntryTimeStamp, datetime,>
		   )
end
end



