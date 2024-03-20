CREATE TABLE [dbo].[Messages]
(
    [MessageID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [FromUserID] INT NOT NULL,
    [ToUserID] INT NOT NULL,
    [Content] NVARCHAR(MAX) NOT NULL,
    [SendDate] DATETIME NOT NULL,
    [Read] BIT NOT NULL,
    CONSTRAINT [FK_Messages_FromUserID] FOREIGN KEY ([FromUserID]) REFERENCES [Users]([UserID]),
    CONSTRAINT [FK_Messages_ToUserID] FOREIGN KEY ([ToUserID]) REFERENCES [Users]([UserID])
)
