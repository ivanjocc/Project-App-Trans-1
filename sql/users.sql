CREATE TABLE [dbo].[Users]
(
    [UserID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [Username] NVARCHAR(50) NOT NULL UNIQUE,
    [Password] NVARCHAR(255) NOT NULL,
    [Email] NVARCHAR(100) NOT NULL UNIQUE,
    [Sex] NVARCHAR(10) NOT NULL,
    [BirthDate] DATE NOT NULL,
    [EthnicGroup] NVARCHAR(50),
    [SearchReason] NVARCHAR(50),
    [CreationDate] DATETIME NOT NULL,
    [LastModification] DATETIME NOT NULL
)
