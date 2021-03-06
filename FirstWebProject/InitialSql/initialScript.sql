USE [TEST]
GO
/****** Object:  Table [dbo].[ExceptionCount]    Script Date: 2017/5/27 9:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExceptionCount](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_ExceptionCount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExceptionDamage]    Script Date: 2017/5/27 9:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExceptionDamage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_ExceptionDamage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExceptionDeliveryNote]    Script Date: 2017/5/27 9:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExceptionDeliveryNote](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_ExceptionDeliveryNote] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExceptionLabel]    Script Date: 2017/5/27 9:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExceptionLabel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_ExceptionLabel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExceptionRecord]    Script Date: 2017/5/27 9:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExceptionRecord](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NOT NULL,
	[Count] [varchar](50) NULL,
	[Label] [varchar](50) NULL,
	[DeliveryNote] [varchar](50) NULL,
	[Damage] [varchar](50) NULL,
 CONSTRAINT [PK_MyTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[P_Product]    Script Date: 2017/5/27 9:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[P_Product](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[Provider] [nvarchar](50) NULL,
	[PartNumber] [nvarchar](50) NULL,
	[Count] [nvarchar](50) NULL,
	[Received] [char](1) NULL,
	[Date] [date] NULL,
	[Flag] [char](1) NULL,
 CONSTRAINT [PK_MatesReceipt] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ExceptionCount] ON 

INSERT [dbo].[ExceptionCount] ([Id], [Name]) VALUES (1, N'')
INSERT [dbo].[ExceptionCount] ([Id], [Name]) VALUES (2, N'数量过多；')
INSERT [dbo].[ExceptionCount] ([Id], [Name]) VALUES (3, N'数量过少；')
SET IDENTITY_INSERT [dbo].[ExceptionCount] OFF
SET IDENTITY_INSERT [dbo].[ExceptionDamage] ON 

INSERT [dbo].[ExceptionDamage] ([Id], [Name]) VALUES (1, N'')
INSERT [dbo].[ExceptionDamage] ([Id], [Name]) VALUES (2, N'轻度损伤；')
INSERT [dbo].[ExceptionDamage] ([Id], [Name]) VALUES (3, N'中度损伤；')
INSERT [dbo].[ExceptionDamage] ([Id], [Name]) VALUES (4, N'重度损伤；')
SET IDENTITY_INSERT [dbo].[ExceptionDamage] OFF
SET IDENTITY_INSERT [dbo].[ExceptionDeliveryNote] ON 

INSERT [dbo].[ExceptionDeliveryNote] ([Id], [Name]) VALUES (1, N'')
INSERT [dbo].[ExceptionDeliveryNote] ([Id], [Name]) VALUES (2, N'运货单缺损；')
INSERT [dbo].[ExceptionDeliveryNote] ([Id], [Name]) VALUES (3, N'运货单模糊；')
INSERT [dbo].[ExceptionDeliveryNote] ([Id], [Name]) VALUES (4, N'运货单不完整；')
SET IDENTITY_INSERT [dbo].[ExceptionDeliveryNote] OFF
SET IDENTITY_INSERT [dbo].[ExceptionLabel] ON 

INSERT [dbo].[ExceptionLabel] ([Id], [Name]) VALUES (1, N'')
INSERT [dbo].[ExceptionLabel] ([Id], [Name]) VALUES (2, N'无标签；')
INSERT [dbo].[ExceptionLabel] ([Id], [Name]) VALUES (3, N'标签缺损；')
INSERT [dbo].[ExceptionLabel] ([Id], [Name]) VALUES (4, N'标签模糊；')
SET IDENTITY_INSERT [dbo].[ExceptionLabel] OFF
SET IDENTITY_INSERT [dbo].[ExceptionRecord] ON 

INSERT [dbo].[ExceptionRecord] ([ID], [PID], [Count], [Label], [DeliveryNote], [Damage]) VALUES (25, 1, N'1', N'4', N'2', N'4')
INSERT [dbo].[ExceptionRecord] ([ID], [PID], [Count], [Label], [DeliveryNote], [Damage]) VALUES (26, 2, N'2', N'1', N'2', N'1')
INSERT [dbo].[ExceptionRecord] ([ID], [PID], [Count], [Label], [DeliveryNote], [Damage]) VALUES (27, 3, N'2', N'1', N'1', N'1')
INSERT [dbo].[ExceptionRecord] ([ID], [PID], [Count], [Label], [DeliveryNote], [Damage]) VALUES (28, 4, N'3', N'1', N'1', N'3')
INSERT [dbo].[ExceptionRecord] ([ID], [PID], [Count], [Label], [DeliveryNote], [Damage]) VALUES (29, 5, N'2', N'3', N'1', N'1')
INSERT [dbo].[ExceptionRecord] ([ID], [PID], [Count], [Label], [DeliveryNote], [Damage]) VALUES (30, 6, N'1', N'3', N'2', N'1')
INSERT [dbo].[ExceptionRecord] ([ID], [PID], [Count], [Label], [DeliveryNote], [Damage]) VALUES (31, 7, N'1', N'1', N'3', N'1')
INSERT [dbo].[ExceptionRecord] ([ID], [PID], [Count], [Label], [DeliveryNote], [Damage]) VALUES (32, 8, N'1', N'1', N'1', N'3')
INSERT [dbo].[ExceptionRecord] ([ID], [PID], [Count], [Label], [DeliveryNote], [Damage]) VALUES (33, 9, N'1', N'1', N'1', N'1')
INSERT [dbo].[ExceptionRecord] ([ID], [PID], [Count], [Label], [DeliveryNote], [Damage]) VALUES (34, 12, N'1', N'1', N'1', N'1')
INSERT [dbo].[ExceptionRecord] ([ID], [PID], [Count], [Label], [DeliveryNote], [Damage]) VALUES (35, 13, N'1', N'1', N'1', N'1')
INSERT [dbo].[ExceptionRecord] ([ID], [PID], [Count], [Label], [DeliveryNote], [Damage]) VALUES (36, 14, N'1', N'1', N'1', N'1')
INSERT [dbo].[ExceptionRecord] ([ID], [PID], [Count], [Label], [DeliveryNote], [Damage]) VALUES (37, 15, N'1', N'1', N'1', N'1')
INSERT [dbo].[ExceptionRecord] ([ID], [PID], [Count], [Label], [DeliveryNote], [Damage]) VALUES (38, 16, N'3', N'1', N'1', N'1')
INSERT [dbo].[ExceptionRecord] ([ID], [PID], [Count], [Label], [DeliveryNote], [Damage]) VALUES (39, 17, N'1', N'1', N'1', N'1')
INSERT [dbo].[ExceptionRecord] ([ID], [PID], [Count], [Label], [DeliveryNote], [Damage]) VALUES (40, 18, N'1', N'1', N'1', N'1')
SET IDENTITY_INSERT [dbo].[ExceptionRecord] OFF
SET IDENTITY_INSERT [dbo].[P_Product] ON 

INSERT [dbo].[P_Product] ([PID], [Provider], [PartNumber], [Count], [Received], [Date], [Flag]) VALUES (1, N'100024    ', N'3525915             ', N'81000', N'1', CAST(0xD93C0B00 AS Date), N'0')
INSERT [dbo].[P_Product] ([PID], [Provider], [PartNumber], [Count], [Received], [Date], [Flag]) VALUES (2, N'100024    ', N'75.0610.6064        ', N'52000', N'1', CAST(0xD93C0B00 AS Date), N'0')
INSERT [dbo].[P_Product] ([PID], [Provider], [PartNumber], [Count], [Received], [Date], [Flag]) VALUES (3, N'100116    ', N'100236              ', N'6670', N'1', CAST(0xD93C0B00 AS Date), N'0')
INSERT [dbo].[P_Product] ([PID], [Provider], [PartNumber], [Count], [Received], [Date], [Flag]) VALUES (4, N'100119    ', N'12636442            ', N'5184', N'1', CAST(0xD93C0B00 AS Date), N'0')
INSERT [dbo].[P_Product] ([PID], [Provider], [PartNumber], [Count], [Received], [Date], [Flag]) VALUES (5, N'100124    ', N'103596              ', N'21600', N'1', CAST(0xD93C0B00 AS Date), N'0')
INSERT [dbo].[P_Product] ([PID], [Provider], [PartNumber], [Count], [Received], [Date], [Flag]) VALUES (6, N'100125', N'100235', N'4500', N'1', CAST(0xD93C0B00 AS Date), N'1')
INSERT [dbo].[P_Product] ([PID], [Provider], [PartNumber], [Count], [Received], [Date], [Flag]) VALUES (7, N'100126', N'100237', N'6666', N'1', CAST(0xD93C0B00 AS Date), N'1')
INSERT [dbo].[P_Product] ([PID], [Provider], [PartNumber], [Count], [Received], [Date], [Flag]) VALUES (8, N'1004126', N'100267', N'4500', N'1', CAST(0xD93C0B00 AS Date), N'1')
INSERT [dbo].[P_Product] ([PID], [Provider], [PartNumber], [Count], [Received], [Date], [Flag]) VALUES (9, N'11024', N'7k1657', N'4565', N'1', CAST(0xD93C0B00 AS Date), N'1')
INSERT [dbo].[P_Product] ([PID], [Provider], [PartNumber], [Count], [Received], [Date], [Flag]) VALUES (10, N'103578', N'2K45456', N'5678', N'1', CAST(0xDA3C0B00 AS Date), N'1')
INSERT [dbo].[P_Product] ([PID], [Provider], [PartNumber], [Count], [Received], [Date], [Flag]) VALUES (11, N'24568', N'2Kd344', N'1065', N'1', CAST(0xDA3C0B00 AS Date), N'1')
INSERT [dbo].[P_Product] ([PID], [Provider], [PartNumber], [Count], [Received], [Date], [Flag]) VALUES (12, N'021546', N'45672158', N'4568', N'1', CAST(0xD93C0B00 AS Date), N'1')
INSERT [dbo].[P_Product] ([PID], [Provider], [PartNumber], [Count], [Received], [Date], [Flag]) VALUES (13, N'测试', N'0012221', N'1234', N'1', CAST(0xD93C0B00 AS Date), N'1')
INSERT [dbo].[P_Product] ([PID], [Provider], [PartNumber], [Count], [Received], [Date], [Flag]) VALUES (14, N'测试二', N'012345', N'1445', N'1', CAST(0xD93C0B00 AS Date), N'1')
INSERT [dbo].[P_Product] ([PID], [Provider], [PartNumber], [Count], [Received], [Date], [Flag]) VALUES (15, N'测试三', N'133333', N'1234', N'0', CAST(0xD93C0B00 AS Date), N'1')
INSERT [dbo].[P_Product] ([PID], [Provider], [PartNumber], [Count], [Received], [Date], [Flag]) VALUES (16, N'测试四', N'123456', N'6000', N'1', CAST(0xD93C0B00 AS Date), N'1')
INSERT [dbo].[P_Product] ([PID], [Provider], [PartNumber], [Count], [Received], [Date], [Flag]) VALUES (17, N'', N'', N'', N'1', CAST(0xD93C0B00 AS Date), N'1')
INSERT [dbo].[P_Product] ([PID], [Provider], [PartNumber], [Count], [Received], [Date], [Flag]) VALUES (18, N'', N'', N'', N'1', CAST(0xD93C0B00 AS Date), N'1')
SET IDENTITY_INSERT [dbo].[P_Product] OFF
ALTER TABLE [dbo].[P_Product] ADD  DEFAULT ('0') FOR [Received]
GO
ALTER TABLE [dbo].[P_Product] ADD  DEFAULT ('0') FOR [Flag]
GO
ALTER TABLE [dbo].[ExceptionRecord]  WITH CHECK ADD  CONSTRAINT [FK_P_Product] FOREIGN KEY([PID])
REFERENCES [dbo].[P_Product] ([PID])
GO
ALTER TABLE [dbo].[ExceptionRecord] CHECK CONSTRAINT [FK_P_Product]
GO
