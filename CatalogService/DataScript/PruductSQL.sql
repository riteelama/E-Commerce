
GO
/****** Object:  Table [dbo].[CatalogBrand]    Script Date: 11/9/2022 8:44:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CatalogBrand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Brand] [nvarchar](50) NULL,
 CONSTRAINT [PK_CatalogBrand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CatalogItem]    Script Date: 11/9/2022 8:44:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CatalogItem](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [decimal](14, 4) NULL,
	[PictureFileName] [nvarchar](50) NULL,
	[PictureUri] [nvarchar](200) NULL,
	[CatalogTypeId] [int] NULL,
	[CatalogBrandId] [int] NULL,
	[OnReorder] [bit] NULL,
	[MaxStockThreshold] [int] NULL,
	[RestockThreshold] [int] NULL,
	[AvailableStock] [int] NULL,
	[AddOn] [datetime] NULL,
	[AddedBy] [uniqueidentifier] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[IsActive] [bit] NULL,
	[IsDelted] [bit] NULL,
	[DeletedOn] [datetime] NULL,
	[DeltedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_CatalogItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CatalogType]    Script Date: 11/9/2022 8:44:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CatalogType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NULL,
 CONSTRAINT [PK_CatalogType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CatalogItem] ([Id], [Name], [Description], [Price], [PictureFileName], [PictureUri], [CatalogTypeId], [CatalogBrandId], [OnReorder], [MaxStockThreshold], [RestockThreshold], [AvailableStock], [AddOn], [AddedBy], [UpdatedOn], [UpdatedBy], [IsActive], [IsDelted], [DeletedOn], [DeltedBy]) VALUES (N'6dd0d2d4-92b8-4bfe-975e-e24c3cb975b1', N'Updated Item', N'Desc', CAST(200.0000 AS Decimal(14, 4)), N'Depic', N'url', 1, 1, 1, 50, 50, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
/****** Object:  StoredProcedure [dbo].[uspCatalogItemAdd]    Script Date: 11/9/2022 8:44:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[uspCatalogItemAdd]
	@Id uniqueidentifier,
	@Name nvarchar(100),
	@AvailableStock int,
	@CatalogTypeId int,
	@CatalogBrandId int,
	@Description nvarchar(max),
	@MaxStockThreshold int,
	@OnReorder bit,
	@PictureFileName nvarchar(50),
	@PictureUri nvarchar(200),
	@Price decimal(14,4),
	@RestockThreshold int
as
Insert into [dbo].[CatalogItem]
(
	[Id],
	[Name],
	[AvailableStock],
	[CatalogTypeId],
	[CatalogBrandId],
	[Description],
	[MaxStockThreshold],
	[OnReorder],
	[PictureFileName],
	[PictureUri],
	[Price],
	[RestockThreshold]
)
values
(
	@Id,
	@Name,
	@AvailableStock,
	@CatalogTypeId,
	@CatalogBrandId,
	@Description,
	@MaxStockThreshold,
	@OnReorder,
	@PictureFileName,
	@PictureUri,
	@Price,
	@RestockThreshold
)
GO
/****** Object:  StoredProcedure [dbo].[uspCatalogItemUpdate]    Script Date: 11/9/2022 8:44:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[uspCatalogItemUpdate]
	@Id uniqueidentifier,
	@Name nvarchar(100),
	@AvailableStock int,
	@CatalogTypeId int,
	@CatalogBrandId int,
	@Description nvarchar(max),
	@MaxStockThreshold int,
	@OnReorder bit,
	@PictureFileName nvarchar(50),
	@PictureUri nvarchar(200),
	@Price decimal(14,4),
	@RestockThreshold int
As
Update [dbo].[CatalogItem] Set	
	[Name]=@Name,
	[AvailableStock]=@AvailableStock,
	[CatalogTypeId]=@CatalogTypeId,
	[CatalogBrandId]=@CatalogBrandId,
	[Description]=@Description,
	[MaxStockThreshold]=@MaxStockThreshold,
	[OnReorder]=@OnReorder,
	[PictureFileName]=@PictureFileName,
	[PictureUri]=@PictureUri,
	[Price]=@Price,
	[RestockThreshold]=@RestockThreshold
Where
Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[uspGetCatalogItemByID]    Script Date: 11/9/2022 8:44:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================


-- =============================================
-- Author:		<Alok Pandey>
-- Create date: <11/09/2022>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspGetCatalogItemByID]
@ItemID uniqueidentifier	
AS
SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Price]
      ,[PictureFileName]
      ,[PictureUri]
      ,[CatalogTypeId]
      ,[CatalogBrandId]
      ,[OnReorder]
      ,[MaxStockThreshold]
      ,[RestockThreshold]
      ,[AvailableStock]      
  FROM [dbo].[CatalogItem]
  Where
  [Id] = @ItemID

GO
/****** Object:  StoredProcedure [dbo].[uspGetCatalogItemList]    Script Date: 11/9/2022 8:44:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================


-- =============================================
-- Author:		<Alok Pandey>
-- Create date: <11/09/2022>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspGetCatalogItemList]	
AS
SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Price]
      ,[PictureFileName]
      ,[PictureUri]
      ,[CatalogTypeId]
      ,[CatalogBrandId]
      ,[OnReorder]
      ,[MaxStockThreshold]
      ,[RestockThreshold]
      ,[AvailableStock]      
  FROM [dbo].[CatalogItem]
  Where
  [IsActive] = 1 and [IsDelted] =0

GO
