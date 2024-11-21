--New Database: MyStore
-- Bang User: Qu?n l� c? t�i kho?n Kh�ch H�ng v� Admin
CREATE TABLE [dbo].[User] (
    [Username]     NVARCHAR (255) NOT NULL,
    [Password] NCHAR (50)     NOT NULL,
   [UserRole]     NCHAR (1) NOT NULL,
    PRIMARY KEY CLUSTERED ([Username] ASC)
);

--Bang Customer: L?u th�ng tin kh�ch h�ng
CREATE TABLE [dbo].[Customer] (
    [CustomerID]          INT IDENTITY (1, 1) NOT NULL,
    [CustomerName]     NVARCHAR (MAX) NOT NULL,
    [CustomerPhone]    NVARCHAR (15)  NOT NULL,
    [CustomerEmail]      NVARCHAR (MAX) NULL,
    [CustomerAddress]  NVARCHAR (MAX) NULL,
    [Username]              NVARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([CustomerID] ASC),
    CONSTRAINT [FK_User_Customer] FOREIGN KEY ([Username]) REFERENCES [dbo].[User] ([Username])
);

--Bang Category: L?u th�ng tin danh m?c s?n ph?m
CREATE TABLE [dbo].[Category] (
    [CategoryID]            INT            IDENTITY (1, 1) NOT NULL,
    [CategoryName]      NVARCHAR (MAX) NOT NULL,
    PRIMARY KEY CLUSTERED ([CategoryID] ASC)
);
--Bang Product: L?u th�ng tin s?n ph?m
CREATE TABLE [dbo].[Product] (
    [ProductID]              INT             IDENTITY (1, 1) NOT NULL,
    [CategoryID]            INT            NOT NULL,
    [ProductName]        NVARCHAR (MAX)  NOT NULL,
    [ProductDecription]  NVARCHAR (MAX)  NOT NULL,
    [ProductPrice]          DECIMAL (18, 2) NOT NULL,
    [ProductImage]        NVARCHAR (MAX)  NULL,
    PRIMARY KEY CLUSTERED ([ProductID] ASC),
    CONSTRAINT [FK_Pro_Category] FOREIGN KEY ([CategoryID]) REFERENCES [dbo].[Category] ([CategoryID])
);

--Bang Order: L?u th�ng tin ??n hang c?a kh�ch h�ng
CREATE TABLE [dbo].[Order] (
    [OrderID]                 INT            IDENTITY (1, 1) NOT NULL,
    [CustomerID]          INT            NOT NULL,
    [OrderDate]             DATE           NOT NULL,
    [TotalAmount]         DECIMAL (18, 2) NOT NULL,
    [PaymentStatus]     NVARCHAR (MAX) NULL,
    [AddressDelivery]   NVARCHAR (MAX) NOT NULL,
    PRIMARY KEY CLUSTERED ([OrderID] ASC),
    FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customer] ([CustomerID])
);
--Bang OrderDetail: L?u th�ng tin chi ti?t c�c s?n ph?m c� trong ??n h�ng
CREATE TABLE [dbo].[OrderDetail] (
    [ID]        INT        IDENTITY (1, 1) NOT NULL,
    [ProductID] INT        NOT NULL,
    [OrderID]   INT        NOT NULL,
    [Quantity]  INT        NOT NULL,
    [UnitPrice] DECIMAL (18, 2) NOT NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([ProductID]) REFERENCES [dbo].[Product] ([ProductID]),
    FOREIGN KEY ([OrderID]) REFERENCES [dbo].[Order] ([OrderID])
);

ALTER AUTHORIZATION ON DATABASE::MyStore TO sa;