SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_newuser]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_newuser](
	[nuid] [int] IDENTITY(1,1) NOT NULL,
	[login] [varchar](50) NULL,
	[pwd] [varchar](50) NULL,
	[mail] [varchar](50) NULL,
	[age] [int] NULL,
	[cno] [varchar](50) NULL,
	[addres] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_newuser] PRIMARY KEY CLUSTERED 
(
	[nuid] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_adddesig]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_adddesig](
	[did] [int] IDENTITY(1,1) NOT NULL,
	[dname] [varchar](50) NULL,
	[cdate] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_adddesig] PRIMARY KEY CLUSTERED 
(
	[did] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_techreport]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_techreport](
	[tmrid] [int] IDENTITY(1,1) NOT NULL,
	[rid] [int] NULL,
	[sendstatus] [varchar](max) NULL,
	[rfile] [varchar](50) NULL,
	[rdate] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_techreport] PRIMARY KEY CLUSTERED 
(
	[tmrid] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_addcategory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_addcategory](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[cname] [varchar](50) NULL,
	[cdate] [datetime] NULL,
 CONSTRAINT [PK_tbl_addcategory] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_newemp]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_newemp](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[did] [int] NULL,
	[username] [varchar](50) NULL,
	[pwd] [varchar](50) NULL,
	[empname] [varchar](50) NULL,
	[age] [int] NULL,
	[cno] [varchar](50) NULL,
	[addres] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_newemp] PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_complaints]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_complaints](
	[rid] [int] IDENTITY(1,1) NOT NULL,
	[nuid] [int] NULL,
	[cid] [int] NULL,
	[scid] [int] NULL,
	[uid] [int] NULL,
	[sub] [varchar](50) NULL,
	[ddesc] [varchar](50) NULL,
	[status] [varchar](50) NULL,
	[rdate] [varchar](50) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_subcategory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_subcategory](
	[scid] [int] IDENTITY(1,1) NOT NULL,
	[cid] [int] NULL,
	[scname] [varchar](50) NULL,
	[cdate] [datetime] NULL,
 CONSTRAINT [PK_tbl_subcategory] PRIMARY KEY CLUSTERED 
(
	[scid] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_tbl_newemp_tbl_adddesig]') AND parent_object_id = OBJECT_ID(N'[dbo].[tbl_newemp]'))
ALTER TABLE [dbo].[tbl_newemp]  WITH CHECK ADD  CONSTRAINT [FK_tbl_newemp_tbl_adddesig] FOREIGN KEY([did])
REFERENCES [dbo].[tbl_adddesig] ([did])
GO
ALTER TABLE [dbo].[tbl_newemp] CHECK CONSTRAINT [FK_tbl_newemp_tbl_adddesig]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Table_1_tbl_addcategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[tbl_complaints]'))
ALTER TABLE [dbo].[tbl_complaints]  WITH CHECK ADD  CONSTRAINT [FK_Table_1_tbl_addcategory] FOREIGN KEY([cid])
REFERENCES [dbo].[tbl_addcategory] ([cid])
GO
ALTER TABLE [dbo].[tbl_complaints] CHECK CONSTRAINT [FK_Table_1_tbl_addcategory]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Table_1_tbl_newemp]') AND parent_object_id = OBJECT_ID(N'[dbo].[tbl_complaints]'))
ALTER TABLE [dbo].[tbl_complaints]  WITH CHECK ADD  CONSTRAINT [FK_Table_1_tbl_newemp] FOREIGN KEY([uid])
REFERENCES [dbo].[tbl_newemp] ([uid])
GO
ALTER TABLE [dbo].[tbl_complaints] CHECK CONSTRAINT [FK_Table_1_tbl_newemp]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Table_1_tbl_newuser]') AND parent_object_id = OBJECT_ID(N'[dbo].[tbl_complaints]'))
ALTER TABLE [dbo].[tbl_complaints]  WITH CHECK ADD  CONSTRAINT [FK_Table_1_tbl_newuser] FOREIGN KEY([nuid])
REFERENCES [dbo].[tbl_newuser] ([nuid])
GO
ALTER TABLE [dbo].[tbl_complaints] CHECK CONSTRAINT [FK_Table_1_tbl_newuser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Table_1_tbl_subcategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[tbl_complaints]'))
ALTER TABLE [dbo].[tbl_complaints]  WITH CHECK ADD  CONSTRAINT [FK_Table_1_tbl_subcategory] FOREIGN KEY([scid])
REFERENCES [dbo].[tbl_subcategory] ([scid])
GO
ALTER TABLE [dbo].[tbl_complaints] CHECK CONSTRAINT [FK_Table_1_tbl_subcategory]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_tbl_subcategory_tbl_addcategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[tbl_subcategory]'))
ALTER TABLE [dbo].[tbl_subcategory]  WITH CHECK ADD  CONSTRAINT [FK_tbl_subcategory_tbl_addcategory] FOREIGN KEY([cid])
REFERENCES [dbo].[tbl_addcategory] ([cid])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tbl_subcategory] CHECK CONSTRAINT [FK_tbl_subcategory_tbl_addcategory]
