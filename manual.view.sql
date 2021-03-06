USE [LIGHTSWITCH]
GO
/****** Object:  View [dbo].[vw_aspnet_Applications]    Script Date: 10/2/2014 1:45:15 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_aspnet_Applications]
  AS SELECT [ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]
  FROM [dbo].[aspnet_Applications]
GO
/****** Object:  View [dbo].[vw_aspnet_MembershipUsers]    Script Date: 10/2/2014 1:45:15 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_aspnet_MembershipUsers]
  AS SELECT members.[UserId],
            members.[PasswordFormat],
            members.[MobilePIN],
            members.[Email],
            members.[LoweredEmail],
            members.[PasswordQuestion],
            members.[PasswordAnswer],
            members.[IsApproved],
            members.[IsLockedOut],
            members.[CreateDate],
            members.[LastLoginDate],
            members.[LastPasswordChangedDate],
            members.[LastLockoutDate],
            members.[FailedPasswordAttemptCount],
            members.[FailedPasswordAttemptWindowStart],
            members.[FailedPasswordAnswerAttemptCount],
            members.[FailedPasswordAnswerAttemptWindowStart],
            members.[Comment],
            users.[ApplicationId],
            users.[UserName],
            users.[MobileAlias],
            users.[IsAnonymous],
            users.[LastActivityDate]
  FROM [dbo].[aspnet_Membership] members INNER JOIN [dbo].[aspnet_Users] users
      ON members.[UserId] = users.[UserId]
GO
/****** Object:  View [dbo].[vw_aspnet_Profiles]    Script Date: 10/2/2014 1:45:15 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_aspnet_Profiles]
  AS SELECT [UserId], [LastUpdatedDate],
      [DataSize]=  DATALENGTH([PropertyNames])
                 + DATALENGTH([PropertyValuesString])
                 + DATALENGTH([PropertyValuesBinary])
  FROM [dbo].[aspnet_Profile]
GO
/****** Object:  View [dbo].[vw_aspnet_Roles]    Script Date: 10/2/2014 1:45:15 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_aspnet_Roles]
  AS SELECT [ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]
  FROM [dbo].[aspnet_Roles]
GO
/****** Object:  View [dbo].[vw_aspnet_Users]    Script Date: 10/2/2014 1:45:15 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_aspnet_Users]
  AS SELECT [ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]
  FROM [dbo].[aspnet_Users]
GO
/****** Object:  View [dbo].[vw_aspnet_UsersInRoles]    Script Date: 10/2/2014 1:45:15 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_aspnet_UsersInRoles]
  AS SELECT [UserId], [RoleId]
  FROM [dbo].[aspnet_UsersInRoles]
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Paths]    Script Date: 10/2/2014 1:45:15 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_aspnet_WebPartState_Paths]
  AS SELECT [ApplicationId], [PathId], [Path], [LoweredPath]
  FROM [dbo].[aspnet_Paths]
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Shared]    Script Date: 10/2/2014 1:45:15 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_aspnet_WebPartState_Shared]
  AS SELECT [PathId], [DataSize]=DATALENGTH([PageSettings]), [LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationAllUsers]
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_User]    Script Date: 10/2/2014 1:45:15 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_aspnet_WebPartState_User]
  AS SELECT [PathId], [UserId], [DataSize]=DATALENGTH([PageSettings]), [LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationPerUser]
GO
