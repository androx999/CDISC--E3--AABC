USE [master]
GO
/****** Object:  Database [Bank]    Script Date: 28/01/2023 03:51:31 a. m. ******/
CREATE DATABASE [Bank]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bank', FILENAME = N'C:\SQLData\Bank.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bank_log', FILENAME = N'C:\SQLData\Bank_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Bank] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bank].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bank] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bank] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bank] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bank] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bank] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bank] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Bank] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bank] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bank] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bank] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bank] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bank] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bank] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bank] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bank] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Bank] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bank] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bank] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bank] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bank] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bank] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bank] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bank] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Bank] SET  MULTI_USER 
GO
ALTER DATABASE [Bank] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bank] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bank] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bank] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Bank] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Bank] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Bank] SET QUERY_STORE = ON
GO
ALTER DATABASE [Bank] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Bank]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 28/01/2023 03:51:31 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AccountType] [int] NOT NULL,
	[ClientID] [int] NULL,
	[Balance] [decimal](10, 2) NOT NULL,
	[RegDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountType]    Script Date: 28/01/2023 03:51:31 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[RegDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BankTransaction]    Script Date: 28/01/2023 03:51:31 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankTransaction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[TransactionType] [int] NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[ExternalAccount] [int] NULL,
	[RegDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 28/01/2023 03:51:31 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NULL,
	[PhoneNumber] [varchar](200) NULL,
	[Email] [varchar](50) NULL,
	[RegDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionType]    Script Date: 28/01/2023 03:51:31 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[RegDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([ID], [AccountType], [ClientID], [Balance], [RegDate]) VALUES (1, 1, 1, CAST(4000.00 AS Decimal(10, 2)), CAST(N'2023-01-23T06:18:17.837' AS DateTime))
INSERT [dbo].[Account] ([ID], [AccountType], [ClientID], [Balance], [RegDate]) VALUES (2, 2, 1, CAST(10000.00 AS Decimal(10, 2)), CAST(N'2023-01-23T06:18:17.837' AS DateTime))
INSERT [dbo].[Account] ([ID], [AccountType], [ClientID], [Balance], [RegDate]) VALUES (3, 1, 2, CAST(3000.00 AS Decimal(10, 2)), CAST(N'2023-01-23T06:18:17.837' AS DateTime))
INSERT [dbo].[Account] ([ID], [AccountType], [ClientID], [Balance], [RegDate]) VALUES (4, 2, 1, CAST(14000.00 AS Decimal(10, 2)), CAST(N'2023-01-23T06:18:17.837' AS DateTime))
INSERT [dbo].[Account] ([ID], [AccountType], [ClientID], [Balance], [RegDate]) VALUES (5, 1, 5, CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-01-23T18:16:57.467' AS DateTime))
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[AccountType] ON 

INSERT [dbo].[AccountType] ([ID], [Name], [RegDate]) VALUES (1, N'Personal', CAST(N'2023-01-23T06:13:15.570' AS DateTime))
INSERT [dbo].[AccountType] ([ID], [Name], [RegDate]) VALUES (2, N'Nomina', CAST(N'2023-01-23T06:13:15.570' AS DateTime))
INSERT [dbo].[AccountType] ([ID], [Name], [RegDate]) VALUES (3, N'Ahorro', CAST(N'2023-01-23T06:13:15.570' AS DateTime))
SET IDENTITY_INSERT [dbo].[AccountType] OFF
GO
SET IDENTITY_INSERT [dbo].[BankTransaction] ON 

INSERT [dbo].[BankTransaction] ([ID], [AccountID], [TransactionType], [Amount], [ExternalAccount], [RegDate]) VALUES (5, 1, 1, CAST(100.00 AS Decimal(10, 2)), NULL, CAST(N'2023-01-23T06:26:12.540' AS DateTime))
INSERT [dbo].[BankTransaction] ([ID], [AccountID], [TransactionType], [Amount], [ExternalAccount], [RegDate]) VALUES (6, 1, 3, CAST(200.00 AS Decimal(10, 2)), 123456, CAST(N'2023-01-23T06:26:12.540' AS DateTime))
INSERT [dbo].[BankTransaction] ([ID], [AccountID], [TransactionType], [Amount], [ExternalAccount], [RegDate]) VALUES (7, 3, 1, CAST(100.00 AS Decimal(10, 2)), NULL, CAST(N'2023-01-23T06:26:12.540' AS DateTime))
INSERT [dbo].[BankTransaction] ([ID], [AccountID], [TransactionType], [Amount], [ExternalAccount], [RegDate]) VALUES (8, 3, 3, CAST(250.00 AS Decimal(10, 2)), 454545, CAST(N'2023-01-23T06:26:12.540' AS DateTime))
INSERT [dbo].[BankTransaction] ([ID], [AccountID], [TransactionType], [Amount], [ExternalAccount], [RegDate]) VALUES (9, 1, 2, CAST(1000.00 AS Decimal(10, 2)), NULL, CAST(N'2023-01-24T12:24:49.863' AS DateTime))
SET IDENTITY_INSERT [dbo].[BankTransaction] OFF
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [Name], [PhoneNumber], [Email], [RegDate]) VALUES (1, N'Andres', N'8121896718', N'andresbc@gmail.com', CAST(N'2023-01-23T05:10:21.083' AS DateTime))
INSERT [dbo].[Client] ([ID], [Name], [PhoneNumber], [Email], [RegDate]) VALUES (2, N'Alejaandro', N'458972637', NULL, CAST(N'2023-01-23T05:11:08.450' AS DateTime))
INSERT [dbo].[Client] ([ID], [Name], [PhoneNumber], [Email], [RegDate]) VALUES (3, N'Karla', N'123456', NULL, CAST(N'2023-01-23T17:29:10.460' AS DateTime))
INSERT [dbo].[Client] ([ID], [Name], [PhoneNumber], [Email], [RegDate]) VALUES (4, N'Carlos', N'67890', N'carlos123@gmail.com', CAST(N'2023-01-23T17:30:58.793' AS DateTime))
INSERT [dbo].[Client] ([ID], [Name], [PhoneNumber], [Email], [RegDate]) VALUES (5, N'Alex', N'38433284', NULL, CAST(N'2023-01-23T18:16:57.460' AS DateTime))
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[TransactionType] ON 

INSERT [dbo].[TransactionType] ([ID], [Name], [RegDate]) VALUES (1, N'Deposito en Efectivo', CAST(N'2023-01-23T06:13:15.570' AS DateTime))
INSERT [dbo].[TransactionType] ([ID], [Name], [RegDate]) VALUES (2, N'Retiro en Efectivo', CAST(N'2023-01-23T06:13:15.570' AS DateTime))
INSERT [dbo].[TransactionType] ([ID], [Name], [RegDate]) VALUES (3, N'Deposito via Transferencia', CAST(N'2023-01-23T06:13:15.570' AS DateTime))
INSERT [dbo].[TransactionType] ([ID], [Name], [RegDate]) VALUES (4, N'Retiro via Transferencia', CAST(N'2023-01-23T06:13:15.570' AS DateTime))
SET IDENTITY_INSERT [dbo].[TransactionType] OFF
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT (getdate()) FOR [RegDate]
GO
ALTER TABLE [dbo].[AccountType] ADD  DEFAULT (getdate()) FOR [RegDate]
GO
ALTER TABLE [dbo].[BankTransaction] ADD  DEFAULT (getdate()) FOR [RegDate]
GO
ALTER TABLE [dbo].[Client] ADD  DEFAULT (getdate()) FOR [RegDate]
GO
ALTER TABLE [dbo].[TransactionType] ADD  DEFAULT (getdate()) FOR [RegDate]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([AccountType])
REFERENCES [dbo].[AccountType] ([ID])
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[BankTransaction]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[BankTransaction]  WITH CHECK ADD FOREIGN KEY([TransactionType])
REFERENCES [dbo].[TransactionType] ([ID])
GO
/****** Object:  StoredProcedure [dbo].[InsertBankTransaction]    Script Date: 28/01/2023 03:51:31 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertBankTransaction]
    @AccountID INT,
    @TransactionType INT,
    @Amount DECIMAL(10, 2),
    @ExternalAccount INT = NULL
AS
	DECLARE @CurrentBalance DECIMAL(10,2), @NewBalance DECIMAL(10,2);

    BEGIN TRANSACTION;
    SET @CurrentBalance = (SELECT Balance FROM Account WHERE ID = @AccountID);

    --OBTENER NUEVO SALDO
    IF @TransactionType = 2 OR @TransactionType = 4
        --retiros
        SET @NewBalance = @CurrentBalance - @Amount;
    ELSE
        --depositos
            SET @NewBalance = @CurrentBalance + @Amount;
    
    --Actualizar el saldo de la cuenta
    UPDATE Account SET Balance = @NewBalance WHERE ID = @AccountID;
    
    --Insertar registro de la operacion
    INSERT INTO BankTransaction(AccountID, TransactionType, Amount, ExternalAccount)
    VALUES(@AccountID,@TransactionType, @Amount, @ExternalAccount);

    IF @NewBalance>=0
      COMMIT TRANSACTION;
    ELSE--NO SE GUARDA SI ES MENOR A CERO
        ROLLBACK TRANSACTION;
        PRINT 'BALANCE MENOR O IGUAL A CERO, INTENTE NUEVAMENTE'  
        RETURN
GO
/****** Object:  StoredProcedure [dbo].[InsertClient]    Script Date: 28/01/2023 03:51:31 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertClient]
	@Name VARCHAR(200),
	@PhoneNumber VARCHAR(40),
	@Email VARCHAR(50) = NULL
AS
	INSERT INTO Client (Name, PhoneNumber,Email)
	VALUES (@Name,@PhoneNumber,@Email);
GO
/****** Object:  StoredProcedure [dbo].[SelectAccount]    Script Date: 28/01/2023 03:51:31 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SelectAccount]
      @ClientID INT = null
as
    IF @ClientID IS NULL
	BEGIN
	 SELECT a.ID, acc.Name AS AccountName,c.Name AS ClientName, a.Balance, a.RegDate
	 FROM Account a
	 JOIN AccountType acc ON a.AccountType = acc.ID
	 LEFT JOIN Client c ON a.ClientID = c.ID;
	END
	ELSE
	BEGIN
	 SELECT a.ID, acc.Name AS AccountName,c.Name AS ClientName, a.Balance, a.RegDate
	 FROM Account a
	 JOIN AccountType acc ON a.AccountType = acc.ID
	 LEFT JOIN Client c ON a.ClientID = c.ID
	 WHERE a.ClientID = @ClientID;
	 END
		

GO
/****** Object:  StoredProcedure [dbo].[SelectClient]    Script Date: 28/01/2023 03:51:31 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[SelectClient]
   @ClientID INT = NULL

AS
IF @ClientID IS NULL
BEGIN
SELECT*FROM Client;
end
else
begin
 SELECT*FROM Client where ID = @ClientID
 end
GO
USE [master]
GO
ALTER DATABASE [Bank] SET  READ_WRITE 
GO
