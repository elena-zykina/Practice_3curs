USE [ArendaTC]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rent](
	[RentID] [int] IDENTITY(1,1) NOT NULL,
	[TenantID] [int] NOT NULL,
	[Название] [nvarchar](50) NULL,
	[EmployeeID] [nvarchar](10) NOT NULL,
	[PavilionID] [nvarchar](10) NULL,
	[Status] [nvarchar] (50) NULL,
	[RentStart] [nvarchar](10) NULL,
	[RentFinish] [nvarchar](10) NULL,
 CONSTRAINT [PK_Rent] PRIMARY KEY CLUSTERED 
(
	[RentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [nvarchar](50) NULL,
	[Login] [nvarchar](50) NULL,
	[Password] [nvarchar](10) NULL,
	[Role] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[Sex] [nvarchar](50) NULL,
	[Photo] [image] NULL,
 CONSTRAINT [PK_Сотрудники] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Pavilion](
	[PavilionID] [int] IDENTITY(1,1) NOT NULL,
	[MallID] [nvarchar](50) NOT NULL,
	[Pavilion] [nvarchar](10) NOT NULL,
	[Floor] [nvarchar](10) NULL,
	[Status] [nvarchar](50) NULL,
	[Area] [nvarchar](10) NULL,
	[CostPerSQ.M.] [nvarchar](10) NULL,
	[ValueAddedFactor] [nvarchar](10) NULL,
 CONSTRAINT [PK_Pavilion] PRIMARY KEY CLUSTERED 
(
	[PavilionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Tenant](
	[TenantID] [int] IDENTITY(1,1) NOT NULL,
	[RentID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Number] [nvarchar](50) NULL,
	[Adress] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tenant] PRIMARY KEY CLUSTERED 
(
	[TenantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Mall](
	[MallID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Status] [varchar](50) NOT NULL,
	[Kol_Pavilion] [nvarchar](10) NULL,
	[Ciry] [nvarchar](50) NULL,
	[Price] [nvarchar](50) NULL,
	[ValueAddedFactor] [nvarchar](10) NULL,
	[Floors] [nvarchar](10) NULL,
	[Picture] [image] NULL,
 CONSTRAINT [PK_ТЦ] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Pavilion]  WITH CHECK ADD  CONSTRAINT [FK_Pavilion_Mall] FOREIGN KEY([MallID])
REFERENCES [dbo].[Mall] ([MallID])
GO
ALTER TABLE [dbo].[Pavilion] CHECK CONSTRAINT [FK_Pavilion_Mall]
GO
ALTER TABLE [dbo].[Rent]  WITH CHECK ADD  CONSTRAINT [FK_Rent_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Rent] CHECK CONSTRAINT [FK_Rent_Employees]
GO
ALTER TABLE [dbo].[Rent]  WITH CHECK ADD  CONSTRAINT [FK_Rent_Pavilion] FOREIGN KEY([PavilionID])
REFERENCES [dbo].[Pavilion] ([PavilionID])
GO
ALTER TABLE [dbo].[Rent] CHECK CONSTRAINT [FK_Rent_Pavilion]
GO
ALTER TABLE [dbo].[Rent]  WITH CHECK ADD  CONSTRAINT [FK_Rent_Tenant] FOREIGN KEY([TenantID])
REFERENCES [dbo].[Tenant] ([TenantID])
GO
ALTER TABLE [dbo].[Rent] CHECK CONSTRAINT [FK_Rent_Tenant]
GO

