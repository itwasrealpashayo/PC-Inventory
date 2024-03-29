﻿USE [master]
GO
CREATE DATABASE PCInventory
GO
USE [PCInventory]
GO
/****** Object:  Table [dbo].[Device]    Script Date: 02.03.2024 4:26:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Device](
	[DeviceID] [int] IDENTITY(1,1) NOT NULL,
	[DeviceName] [nvarchar](50) NOT NULL,
	[DeviceTypeID] [int] NOT NULL,
	[DeviceModel] [nvarchar](50) NOT NULL,
	[DeviceInventNum] [nvarchar](50) NOT NULL,
	[DeviceSerialNum] [nvarchar](50) NOT NULL,
	[DeviceDatePurchase] [date] NOT NULL,
	[DevicePrice] [money] NOT NULL,
	[DeviceStatusID] [int] NOT NULL,
	[PlaceInstallID] [int] NULL,
 CONSTRAINT [PK_Device] PRIMARY KEY CLUSTERED 
(
	[DeviceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeviceDroping]    Script Date: 02.03.2024 4:26:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceDroping](
	[DeviceDropingID] [int] IDENTITY(1,1) NOT NULL,
	[DeviceDropingDate] [date] NOT NULL,
	[UserID] [int] NOT NULL,
	[WorkplaceID] [int] NOT NULL,
	[DeviceID] [int] NOT NULL,
	[DeviceDropingDefect] [nvarchar](max) NULL,
 CONSTRAINT [PK_DeviceDroping] PRIMARY KEY CLUSTERED 
(
	[DeviceDropingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeviceMoving]    Script Date: 02.03.2024 4:26:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceMoving](
	[DeviceMovingID] [int] IDENTITY(1,1) NOT NULL,
	[DeviceMovingDate] [date] NOT NULL,
	[UserID] [int] NOT NULL,
	[WorkplaceID] [int] NOT NULL,
	[DeviceID] [int] NOT NULL,
 CONSTRAINT [PK_DeviceMoving] PRIMARY KEY CLUSTERED 
(
	[DeviceMovingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeviceStatus]    Script Date: 02.03.2024 4:26:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceStatus](
	[DeviceStatusID] [int] NOT NULL,
	[DeviceStatusName] [nvarchar](50) NOT NULL,
	[DeviceStatusDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_DeviceStatus] PRIMARY KEY CLUSTERED 
(
	[DeviceStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeviceType]    Script Date: 02.03.2024 4:26:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceType](
	[DeviceTypeID] [int] IDENTITY(1,1) NOT NULL,
	[DeviceTypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DeviceType] PRIMARY KEY CLUSTERED 
(
	[DeviceTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaceInstall]    Script Date: 02.03.2024 4:26:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaceInstall](
	[PlaceInstallID] [int] IDENTITY(1,1) NOT NULL,
	[WorkplaceID] [int] NOT NULL,
	[PlaceInstallCabinet] [nvarchar](50) NULL,
	[PlaceInstallDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_PlaceInstall] PRIMARY KEY CLUSTERED 
(
	[PlaceInstallID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 02.03.2024 4:26:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 02.03.2024 4:26:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[UserSurname] [nvarchar](50) NOT NULL,
	[UserPatronymic] [nvarchar](50) NULL,
	[UserPhone] [nvarchar](50) NOT NULL,
	[UserWorkplaceID] [int] NOT NULL,
	[UserLogin] [nvarchar](50) NOT NULL,
	[UserPassword] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workplace]    Script Date: 02.03.2024 4:26:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workplace](
	[WorkplaceID] [int] IDENTITY(1,1) NOT NULL,
	[WorkplaceName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Workplace] PRIMARY KEY CLUSTERED 
(
	[WorkplaceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Device] ON 

INSERT [dbo].[Device] ([DeviceID], [DeviceName], [DeviceTypeID], [DeviceModel], [DeviceInventNum], [DeviceSerialNum], [DeviceDatePurchase], [DevicePrice], [DeviceStatusID], [PlaceInstallID]) VALUES (1, N'Ноутбук HP', 1, N'HP ProBook 450 G7', N'INV12345', N'SN123456789', CAST(N'2023-05-10' AS Date), 85000.0000, 1, 1)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [DeviceTypeID], [DeviceModel], [DeviceInventNum], [DeviceSerialNum], [DeviceDatePurchase], [DevicePrice], [DeviceStatusID], [PlaceInstallID]) VALUES (2, N'Принтер Canon', 2, N'Canon Pixma MX922', N'INV54321', N'SN987654321', CAST(N'2022-09-15' AS Date), 35000.0000, 1, 2)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [DeviceTypeID], [DeviceModel], [DeviceInventNum], [DeviceSerialNum], [DeviceDatePurchase], [DevicePrice], [DeviceStatusID], [PlaceInstallID]) VALUES (3, N'Монитор Dell', 3, N'Dell UltraSharp U2415', N'INV67890', N'SN135792468', CAST(N'2023-02-28' AS Date), 25000.0000, 1, 3)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [DeviceTypeID], [DeviceModel], [DeviceInventNum], [DeviceSerialNum], [DeviceDatePurchase], [DevicePrice], [DeviceStatusID], [PlaceInstallID]) VALUES (4, N'Сканер Epson', 4, N'Epson Perfection V600', N'INV24680', N'SN246802468', CAST(N'2022-12-20' AS Date), 40000.0000, 2, 4)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [DeviceTypeID], [DeviceModel], [DeviceInventNum], [DeviceSerialNum], [DeviceDatePurchase], [DevicePrice], [DeviceStatusID], [PlaceInstallID]) VALUES (5, N'Ноутбук Lenovo', 1, N'Lenovo ThinkPad X1 Carbon', N'INV13579', N'SN987654321', CAST(N'2023-08-05' AS Date), 95000.0000, 1, 5)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [DeviceTypeID], [DeviceModel], [DeviceInventNum], [DeviceSerialNum], [DeviceDatePurchase], [DevicePrice], [DeviceStatusID], [PlaceInstallID]) VALUES (6, N'Проектор BenQ', 5, N'BenQ MH530FHD', N'INV97531', N'SN975310246', CAST(N'2022-11-10' AS Date), 55000.0000, 4, NULL)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [DeviceTypeID], [DeviceModel], [DeviceInventNum], [DeviceSerialNum], [DeviceDatePurchase], [DevicePrice], [DeviceStatusID], [PlaceInstallID]) VALUES (7, N'МФУ HP', 6, N'HP OfficeJet Pro 9025', N'INV35791', N'SN357910246', CAST(N'2023-03-25' AS Date), 45000.0000, 3, NULL)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [DeviceTypeID], [DeviceModel], [DeviceInventNum], [DeviceSerialNum], [DeviceDatePurchase], [DevicePrice], [DeviceStatusID], [PlaceInstallID]) VALUES (8, N'Смартфон Samsung', 7, N'Samsung Galaxy S21', N'INV80235', N'SN802351469', CAST(N'2023-07-12' AS Date), 75000.0000, 4, NULL)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [DeviceTypeID], [DeviceModel], [DeviceInventNum], [DeviceSerialNum], [DeviceDatePurchase], [DevicePrice], [DeviceStatusID], [PlaceInstallID]) VALUES (9, N'Роутер TP-Link', 8, N'TP-Link Archer AX6000', N'INV64208', N'SN642082357', CAST(N'2022-10-18' AS Date), 6000.0000, 4, NULL)
INSERT [dbo].[Device] ([DeviceID], [DeviceName], [DeviceTypeID], [DeviceModel], [DeviceInventNum], [DeviceSerialNum], [DeviceDatePurchase], [DevicePrice], [DeviceStatusID], [PlaceInstallID]) VALUES (10, N'Ноутбук Apple', 1, N'MacBook Pro 16"', N'INV75301', N'SN753010246', CAST(N'2023-04-03' AS Date), 120000.0000, 4, NULL)
SET IDENTITY_INSERT [dbo].[Device] OFF
GO
SET IDENTITY_INSERT [dbo].[DeviceDroping] ON 

INSERT [dbo].[DeviceDroping] ([DeviceDropingID], [DeviceDropingDate], [UserID], [WorkplaceID], [DeviceID], [DeviceDropingDefect]) VALUES (1, CAST(N'2023-06-20' AS Date), 2, 1, 1, N'Дефект не выявлен')
INSERT [dbo].[DeviceDroping] ([DeviceDropingID], [DeviceDropingDate], [UserID], [WorkplaceID], [DeviceID], [DeviceDropingDefect]) VALUES (2, CAST(N'2023-09-05' AS Date), 3, 2, 4, N'Не включается')
INSERT [dbo].[DeviceDroping] ([DeviceDropingID], [DeviceDropingDate], [UserID], [WorkplaceID], [DeviceID], [DeviceDropingDefect]) VALUES (3, CAST(N'2023-10-15' AS Date), 4, 4, 2, N'Замена картриджа')
INSERT [dbo].[DeviceDroping] ([DeviceDropingID], [DeviceDropingDate], [UserID], [WorkplaceID], [DeviceID], [DeviceDropingDefect]) VALUES (4, CAST(N'2023-12-01' AS Date), 5, 5, 6, N'Неисправность лампы')
INSERT [dbo].[DeviceDroping] ([DeviceDropingID], [DeviceDropingDate], [UserID], [WorkplaceID], [DeviceID], [DeviceDropingDefect]) VALUES (5, CAST(N'2023-08-10' AS Date), 6, 8, 3, N'Поврежден экран')
INSERT [dbo].[DeviceDroping] ([DeviceDropingID], [DeviceDropingDate], [UserID], [WorkplaceID], [DeviceID], [DeviceDropingDefect]) VALUES (6, CAST(N'2023-11-25' AS Date), 7, 2, 5, N'Не загружается ОС')
INSERT [dbo].[DeviceDroping] ([DeviceDropingID], [DeviceDropingDate], [UserID], [WorkplaceID], [DeviceID], [DeviceDropingDefect]) VALUES (7, CAST(N'2023-07-30' AS Date), 8, 8, 7, N'Засорение каретки')
INSERT [dbo].[DeviceDroping] ([DeviceDropingID], [DeviceDropingDate], [UserID], [WorkplaceID], [DeviceID], [DeviceDropingDefect]) VALUES (8, CAST(N'2023-12-18' AS Date), 9, 1, 8, N'Пропадает сеть')
INSERT [dbo].[DeviceDroping] ([DeviceDropingID], [DeviceDropingDate], [UserID], [WorkplaceID], [DeviceID], [DeviceDropingDefect]) VALUES (9, CAST(N'2023-10-05' AS Date), 10, 2, 9, N'Слабый сигнал Wi-Fi')
INSERT [dbo].[DeviceDroping] ([DeviceDropingID], [DeviceDropingDate], [UserID], [WorkplaceID], [DeviceID], [DeviceDropingDefect]) VALUES (10, CAST(N'2023-11-12' AS Date), 1, 4, 10, N'Не работает Touch ID')
SET IDENTITY_INSERT [dbo].[DeviceDroping] OFF
GO
SET IDENTITY_INSERT [dbo].[DeviceMoving] ON 

INSERT [dbo].[DeviceMoving] ([DeviceMovingID], [DeviceMovingDate], [UserID], [WorkplaceID], [DeviceID]) VALUES (1, CAST(N'2023-07-01' AS Date), 1, 1, 1)
INSERT [dbo].[DeviceMoving] ([DeviceMovingID], [DeviceMovingDate], [UserID], [WorkplaceID], [DeviceID]) VALUES (2, CAST(N'2023-09-10' AS Date), 2, 2, 2)
INSERT [dbo].[DeviceMoving] ([DeviceMovingID], [DeviceMovingDate], [UserID], [WorkplaceID], [DeviceID]) VALUES (3, CAST(N'2023-11-20' AS Date), 3, 4, 3)
INSERT [dbo].[DeviceMoving] ([DeviceMovingID], [DeviceMovingDate], [UserID], [WorkplaceID], [DeviceID]) VALUES (4, CAST(N'2023-12-05' AS Date), 4, 9, 4)
INSERT [dbo].[DeviceMoving] ([DeviceMovingID], [DeviceMovingDate], [UserID], [WorkplaceID], [DeviceID]) VALUES (5, CAST(N'2023-08-15' AS Date), 5, 5, 5)
INSERT [dbo].[DeviceMoving] ([DeviceMovingID], [DeviceMovingDate], [UserID], [WorkplaceID], [DeviceID]) VALUES (6, CAST(N'2023-11-30' AS Date), 6, 11, 6)
INSERT [dbo].[DeviceMoving] ([DeviceMovingID], [DeviceMovingDate], [UserID], [WorkplaceID], [DeviceID]) VALUES (7, CAST(N'2023-08-25' AS Date), 7, 13, 7)
INSERT [dbo].[DeviceMoving] ([DeviceMovingID], [DeviceMovingDate], [UserID], [WorkplaceID], [DeviceID]) VALUES (8, CAST(N'2023-12-20' AS Date), 8, 10, 8)
INSERT [dbo].[DeviceMoving] ([DeviceMovingID], [DeviceMovingDate], [UserID], [WorkplaceID], [DeviceID]) VALUES (9, CAST(N'2023-10-10' AS Date), 9, 4, 9)
INSERT [dbo].[DeviceMoving] ([DeviceMovingID], [DeviceMovingDate], [UserID], [WorkplaceID], [DeviceID]) VALUES (10, CAST(N'2023-11-20' AS Date), 10, 12, 10)
SET IDENTITY_INSERT [dbo].[DeviceMoving] OFF
GO
INSERT [dbo].[DeviceStatus] ([DeviceStatusID], [DeviceStatusName], [DeviceStatusDescription]) VALUES (1, N'В работе', N'Устройство функционирует нормально')
INSERT [dbo].[DeviceStatus] ([DeviceStatusID], [DeviceStatusName], [DeviceStatusDescription]) VALUES (2, N'На обслуживании', N'Устройство находится в ремонте')
INSERT [dbo].[DeviceStatus] ([DeviceStatusID], [DeviceStatusName], [DeviceStatusDescription]) VALUES (3, N'Списан', N'Устройство неисправно')
INSERT [dbo].[DeviceStatus] ([DeviceStatusID], [DeviceStatusName], [DeviceStatusDescription]) VALUES (4, N'Зарегистрирован', N'Устройство имеется на складе, но не находится на рабочем месте')
GO
SET IDENTITY_INSERT [dbo].[DeviceType] ON 

INSERT [dbo].[DeviceType] ([DeviceTypeID], [DeviceTypeName]) VALUES (1, N'Ноутбук')
INSERT [dbo].[DeviceType] ([DeviceTypeID], [DeviceTypeName]) VALUES (2, N'Принтер')
INSERT [dbo].[DeviceType] ([DeviceTypeID], [DeviceTypeName]) VALUES (3, N'Монитор')
INSERT [dbo].[DeviceType] ([DeviceTypeID], [DeviceTypeName]) VALUES (4, N'Сканер')
INSERT [dbo].[DeviceType] ([DeviceTypeID], [DeviceTypeName]) VALUES (5, N'Проектор')
INSERT [dbo].[DeviceType] ([DeviceTypeID], [DeviceTypeName]) VALUES (6, N'МФУ')
INSERT [dbo].[DeviceType] ([DeviceTypeID], [DeviceTypeName]) VALUES (7, N'Смартфон')
INSERT [dbo].[DeviceType] ([DeviceTypeID], [DeviceTypeName]) VALUES (8, N'Роутер')
SET IDENTITY_INSERT [dbo].[DeviceType] OFF
GO
SET IDENTITY_INSERT [dbo].[PlaceInstall] ON 

INSERT [dbo].[PlaceInstall] ([PlaceInstallID], [WorkplaceID], [PlaceInstallCabinet], [PlaceInstallDescription]) VALUES (1, 1, N'315', N'Компьютерное оборудование установлено на двух рабочих столах, расположенных у окна. Принтер и сканер установлены на стойке возле одного из рабочих столов')
INSERT [dbo].[PlaceInstall] ([PlaceInstallID], [WorkplaceID], [PlaceInstallCabinet], [PlaceInstallDescription]) VALUES (2, 2, N'202', N'Компьютерное оборудование установлено на трех рабочих столах, расположенных вдоль стены напротив входа в кабинет. Принтер и сканер установлены на стойке возле одного из рабочих столов')
INSERT [dbo].[PlaceInstall] ([PlaceInstallID], [WorkplaceID], [PlaceInstallCabinet], [PlaceInstallDescription]) VALUES (3, 4, N'105', N'Оборудование установлено на четыре рабочих столах. Три из них расположены вдоль правой стены кабинета, а четвертый – у окна. Дополнительно к компьютерам в кабинете также установлены: МФУ, телефон с функциями громкой связи и конференц-связи')
INSERT [dbo].[PlaceInstall] ([PlaceInstallID], [WorkplaceID], [PlaceInstallCabinet], [PlaceInstallDescription]) VALUES (4, 5, N'215', N'Компьютеры установлены на трех рабочих столах. Два из них расположены вдоль стены, противоположной входу, а третий – у окна. ')
INSERT [dbo].[PlaceInstall] ([PlaceInstallID], [WorkplaceID], [PlaceInstallCabinet], [PlaceInstallDescription]) VALUES (5, 8, N'101', N'Десять компьютерных рабочих мест для студентов и одно рабочее место преподавателя расположенные в два ряда.  Принтер установлен возле рабочего места преподавателя, а проектор на потолке.')
SET IDENTITY_INSERT [dbo].[PlaceInstall] OFF
GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Сотрудник')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [RoleID], [UserName], [UserSurname], [UserPatronymic], [UserPhone], [UserWorkplaceID], [UserLogin], [UserPassword]) VALUES (1, 1, N'Иван', N'Иванов', N'Иванович', N'123-45-67', 1, N'admin', N'admin123')
INSERT [dbo].[User] ([UserID], [RoleID], [UserName], [UserSurname], [UserPatronymic], [UserPhone], [UserWorkplaceID], [UserLogin], [UserPassword]) VALUES (2, 2, N'Петр', N'Петров', N'Петрович', N'987-65-43', 2, N'petr1', N'petr123')
INSERT [dbo].[User] ([UserID], [RoleID], [UserName], [UserSurname], [UserPatronymic], [UserPhone], [UserWorkplaceID], [UserLogin], [UserPassword]) VALUES (3, 2, N'Анна', N'Иванова', N'Петровна', N'555-55-55', 4, N'anna2', N'anna123')
INSERT [dbo].[User] ([UserID], [RoleID], [UserName], [UserSurname], [UserPatronymic], [UserPhone], [UserWorkplaceID], [UserLogin], [UserPassword]) VALUES (4, 2, N'Мария', N'Сидорова', N'Ивановна', N'111-11-11', 5, N'maria3', N'maria123')
INSERT [dbo].[User] ([UserID], [RoleID], [UserName], [UserSurname], [UserPatronymic], [UserPhone], [UserWorkplaceID], [UserLogin], [UserPassword]) VALUES (5, 2, N'Алексей', N'Петров', N'Сергеевич', N'222-22-22', 8, N'alex4', N'alex123')
INSERT [dbo].[User] ([UserID], [RoleID], [UserName], [UserSurname], [UserPatronymic], [UserPhone], [UserWorkplaceID], [UserLogin], [UserPassword]) VALUES (6, 2, N'Ольга', N'Смирнова', N'Александровна', N'333-33-33', 1, N'olga5', N'olga123')
INSERT [dbo].[User] ([UserID], [RoleID], [UserName], [UserSurname], [UserPatronymic], [UserPhone], [UserWorkplaceID], [UserLogin], [UserPassword]) VALUES (7, 2, N'Дмитрий', N'Сидоров', N'Александрович', N'444-44-44', 2, N'dmitriy6', N'dmitriy123')
INSERT [dbo].[User] ([UserID], [RoleID], [UserName], [UserSurname], [UserPatronymic], [UserPhone], [UserWorkplaceID], [UserLogin], [UserPassword]) VALUES (8, 2, N'Елена', N'Иванова', N'Дмитриевна', N'666-66-66', 4, N'elena7', N'elena123')
INSERT [dbo].[User] ([UserID], [RoleID], [UserName], [UserSurname], [UserPatronymic], [UserPhone], [UserWorkplaceID], [UserLogin], [UserPassword]) VALUES (9, 2, N'Владимир', N'Петров', N'Павлович', N'777-77-77', 5, N'vladimir8', N'vladimir123')
INSERT [dbo].[User] ([UserID], [RoleID], [UserName], [UserSurname], [UserPatronymic], [UserPhone], [UserWorkplaceID], [UserLogin], [UserPassword]) VALUES (10, 2, N'Наталья', N'Смирнова', N'Сергеевна', N'888-88-88', 8, N'natalya9', N'natalya123')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[Workplace] ON 

INSERT [dbo].[Workplace] ([WorkplaceID], [WorkplaceName]) VALUES (1, N'Отдел кадров')
INSERT [dbo].[Workplace] ([WorkplaceID], [WorkplaceName]) VALUES (2, N'Бухглатерия')
INSERT [dbo].[Workplace] ([WorkplaceID], [WorkplaceName]) VALUES (4, N'Отдел администирования')
INSERT [dbo].[Workplace] ([WorkplaceID], [WorkplaceName]) VALUES (5, N'Отдел безопасности')
INSERT [dbo].[Workplace] ([WorkplaceID], [WorkplaceName]) VALUES (8, N'Учебный кабинет')
INSERT [dbo].[Workplace] ([WorkplaceID], [WorkplaceName]) VALUES (9, N'Диспетчерский пункт')
INSERT [dbo].[Workplace] ([WorkplaceID], [WorkplaceName]) VALUES (10, N'Отдел закупок')
INSERT [dbo].[Workplace] ([WorkplaceID], [WorkplaceName]) VALUES (11, N'Отдел информационной поддержки')
INSERT [dbo].[Workplace] ([WorkplaceID], [WorkplaceName]) VALUES (12, N'Отдел логистики')
INSERT [dbo].[Workplace] ([WorkplaceID], [WorkplaceName]) VALUES (13, N'Склад')
SET IDENTITY_INSERT [dbo].[Workplace] OFF
GO
ALTER TABLE [dbo].[Device]  WITH CHECK ADD  CONSTRAINT [FK_Device_DeviceStatus] FOREIGN KEY([DeviceStatusID])
REFERENCES [dbo].[DeviceStatus] ([DeviceStatusID])
GO
ALTER TABLE [dbo].[Device] CHECK CONSTRAINT [FK_Device_DeviceStatus]
GO
ALTER TABLE [dbo].[Device]  WITH CHECK ADD  CONSTRAINT [FK_Device_DeviceType] FOREIGN KEY([DeviceTypeID])
REFERENCES [dbo].[DeviceType] ([DeviceTypeID])
GO
ALTER TABLE [dbo].[Device] CHECK CONSTRAINT [FK_Device_DeviceType]
GO
ALTER TABLE [dbo].[Device]  WITH CHECK ADD  CONSTRAINT [FK_Device_PlaceInstall] FOREIGN KEY([PlaceInstallID])
REFERENCES [dbo].[PlaceInstall] ([PlaceInstallID])
GO
ALTER TABLE [dbo].[Device] CHECK CONSTRAINT [FK_Device_PlaceInstall]
GO
ALTER TABLE [dbo].[DeviceDroping]  WITH CHECK ADD  CONSTRAINT [FK_DeviceDroping_Device] FOREIGN KEY([DeviceID])
REFERENCES [dbo].[Device] ([DeviceID])
GO
ALTER TABLE [dbo].[DeviceDroping] CHECK CONSTRAINT [FK_DeviceDroping_Device]
GO
ALTER TABLE [dbo].[DeviceDroping]  WITH CHECK ADD  CONSTRAINT [FK_DeviceDroping_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[DeviceDroping] CHECK CONSTRAINT [FK_DeviceDroping_User]
GO
ALTER TABLE [dbo].[DeviceDroping]  WITH CHECK ADD  CONSTRAINT [FK_DeviceDroping_Workplace] FOREIGN KEY([WorkplaceID])
REFERENCES [dbo].[Workplace] ([WorkplaceID])
GO
ALTER TABLE [dbo].[DeviceDroping] CHECK CONSTRAINT [FK_DeviceDroping_Workplace]
GO
ALTER TABLE [dbo].[DeviceMoving]  WITH CHECK ADD  CONSTRAINT [FK_DeviceMoving_Device] FOREIGN KEY([DeviceID])
REFERENCES [dbo].[Device] ([DeviceID])
GO
ALTER TABLE [dbo].[DeviceMoving] CHECK CONSTRAINT [FK_DeviceMoving_Device]
GO
ALTER TABLE [dbo].[DeviceMoving]  WITH CHECK ADD  CONSTRAINT [FK_DeviceMoving_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[DeviceMoving] CHECK CONSTRAINT [FK_DeviceMoving_User]
GO
ALTER TABLE [dbo].[DeviceMoving]  WITH CHECK ADD  CONSTRAINT [FK_DeviceMoving_Workplace] FOREIGN KEY([WorkplaceID])
REFERENCES [dbo].[Workplace] ([WorkplaceID])
GO
ALTER TABLE [dbo].[DeviceMoving] CHECK CONSTRAINT [FK_DeviceMoving_Workplace]
GO
ALTER TABLE [dbo].[PlaceInstall]  WITH CHECK ADD  CONSTRAINT [FK_PlaceInstall_Workplace] FOREIGN KEY([WorkplaceID])
REFERENCES [dbo].[Workplace] ([WorkplaceID])
GO
ALTER TABLE [dbo].[PlaceInstall] CHECK CONSTRAINT [FK_PlaceInstall_Workplace]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Workplace] FOREIGN KEY([UserWorkplaceID])
REFERENCES [dbo].[Workplace] ([WorkplaceID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Workplace]
GO
USE [master]
GO
ALTER DATABASE [PCInventory] SET  READ_WRITE 
GO
