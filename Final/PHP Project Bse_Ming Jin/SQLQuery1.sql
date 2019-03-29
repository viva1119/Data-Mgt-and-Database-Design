go
CREATE PROCEDURE insertdev
@DeveloperID char(15),
@OfficialWebsite varchar(40),
@DeveloperType varchar(20),
@DeveloperName varchar(30),
@Introduction varchar(200)
as
begin
if 
    (ISNULL(@DeveloperID, 0) = 0)
begin
    raiserror('Invalid parameter: @DeveloperID cannot be NULL or zero', 18, 0)
    return
end

if 
    (ISNULL(@OfficialWebsite, '') = '')
begin
    raiserror('Invalid parameter: @OfficialWebsite cannot be NULL or empty', 18, 0)
    return
end
if (ISNULL(@DeveloperType, '') = '')
begin
    raiserror('Invalid parameter: @DeveloperType cannot be NULL or zero', 18, 0)
    return
end
if (ISNULL(@DeveloperName, '') = '')
begin
    raiserror('Invalid parameter: @DeveloperName cannot be NULL or zero', 18, 0)
    return
end

end
set nocount on
insert into [AppStoreDatabase].[dbo].[Developer]
(	   
       [DeveloperID]
      ,[OfficialWebsite]
      ,[DeveloperType]
      ,[DeveloperName]
	  ,[Introduction])
	  values(@DeveloperID,@OfficialWebsite,@DeveloperType,@DeveloperName,@Introduction)
go

execute AppStoreDatabase.dbo.insertdev 007,'www.tencent.com','Company','Tencent Game','A Chinese game compamy' ;


DROP PROCEDURE insertDev;  
GO  


