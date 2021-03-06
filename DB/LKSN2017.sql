USE [LKSN2017]
GO
/****** Object:  Table [dbo].[DetailSchedule]    Script Date: 18/05/2017 11.29.50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailSchedule](
	[DetailId] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleId] [int] NULL,
	[SubjectId] [char](5) NULL,
	[TeacherId] [char](5) NULL,
	[Day] [varchar](10) NULL,
	[ShiftId] [int] NULL,
 CONSTRAINT [PK_DetailSchedule$] PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetailScore]    Script Date: 18/05/2017 11.29.50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailScore](
	[ScoreDetailId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [varchar](8) NULL,
	[DetailId] [int] NULL,
	[Assignment] [int] NULL,
	[MidExam] [int] NULL,
	[FinalExam] [int] NULL,
 CONSTRAINT [PK_DetailScore$] PRIMARY KEY CLUSTERED 
(
	[ScoreDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HeaderSchedule]    Script Date: 18/05/2017 11.29.50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HeaderSchedule](
	[ScheduleId] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](5) NULL,
	[Finalize] [int] NULL,
 CONSTRAINT [PK_HeaderSchedule$] PRIMARY KEY CLUSTERED 
(
	[ScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 18/05/2017 11.29.50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [varchar](8) NOT NULL,
	[Name] [varchar](50) NULL,
	[Address] [varchar](150) NULL,
	[Gender] [varchar](7) NULL,
	[DateofBirth] [date] NULL,
	[PhoneNumber] [varchar](12) NULL,
	[Photo] [varchar](100) NULL,
 CONSTRAINT [PK_Student$] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 18/05/2017 11.29.50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[SubjectId] [char](5) NOT NULL,
	[Name] [varchar](50) NULL,
	[Assignment] [int] NULL,
	[MidExam] [int] NULL,
	[FinalExam] [int] NULL,
	[Shift] [int] NULL,
	[ForGrade] [int] NULL,
 CONSTRAINT [PK_Subject$] PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_wow]    Script Date: 18/05/2017 11.29.50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_wow]
AS
SELECT        dbo.DetailScore.StudentId, dbo.Student.Name, dbo.DetailScore.Assignment, dbo.DetailScore.MidExam, dbo.DetailScore.FinalExam, dbo.DetailSchedule.DetailId, dbo.DetailSchedule.SubjectId, 
                         dbo.HeaderSchedule.ClassName
FROM            dbo.DetailSchedule INNER JOIN
                         dbo.DetailScore ON dbo.DetailSchedule.DetailId = dbo.DetailScore.DetailId INNER JOIN
                         dbo.Subject ON dbo.DetailSchedule.SubjectId = dbo.Subject.SubjectId INNER JOIN
                         dbo.Student ON dbo.DetailScore.StudentId = dbo.Student.StudentId INNER JOIN
                         dbo.HeaderSchedule ON dbo.DetailSchedule.ScheduleId = dbo.HeaderSchedule.ScheduleId
GO
/****** Object:  Table [dbo].[Class]    Script Date: 18/05/2017 11.29.50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassName] [varchar](5) NOT NULL,
	[Grade] [int] NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ClassName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetailClass]    Script Date: 18/05/2017 11.29.50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailClass](
	[DetailClassId] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](5) NULL,
	[StudentId] [varchar](8) NULL,
 CONSTRAINT [PK_DetailClass$] PRIMARY KEY CLUSTERED 
(
	[DetailClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_wew]    Script Date: 18/05/2017 11.29.50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_wew]
AS
SELECT        dbo.DetailSchedule.SubjectId, dbo.Subject.Name, dbo.DetailScore.Assignment, dbo.DetailScore.MidExam, dbo.DetailScore.FinalExam
FROM            dbo.DetailClass INNER JOIN
                         dbo.Class ON dbo.DetailClass.ClassName = dbo.Class.ClassName INNER JOIN
                         dbo.DetailScore ON dbo.DetailClass.StudentId = dbo.DetailScore.StudentId INNER JOIN
                         dbo.DetailSchedule ON dbo.DetailScore.DetailId = dbo.DetailSchedule.DetailId INNER JOIN
                         dbo.Subject ON dbo.DetailSchedule.SubjectId = dbo.Subject.SubjectId
GO
/****** Object:  Table [dbo].[Expertise]    Script Date: 18/05/2017 11.29.50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expertise](
	[ExpertiseId] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [varchar](8) NULL,
	[SubjectId] [char](5) NULL,
 CONSTRAINT [PK_Expertise$] PRIMARY KEY CLUSTERED 
(
	[ExpertiseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pesan]    Script Date: 18/05/2017 11.29.50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pesan](
	[id_pesan] [int] IDENTITY(1,1) NOT NULL,
	[sender] [varchar](8) NULL,
	[receiver] [varchar](8) NULL,
	[konten] [varchar](160) NOT NULL,
	[status] [varchar](10) NOT NULL,
	[sent_time] [varchar](20) NULL,
	[title] [varchar](50) NULL,
 CONSTRAINT [PK_Pesan] PRIMARY KEY CLUSTERED 
(
	[id_pesan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shift]    Script Date: 18/05/2017 11.29.50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shift](
	[ShiftId] [int] NOT NULL,
	[Time] [char](13) NULL,
 CONSTRAINT [PK_Shift$] PRIMARY KEY CLUSTERED 
(
	[ShiftId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 18/05/2017 11.29.50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[TeacherId] [varchar](8) NOT NULL,
	[Name] [varchar](50) NULL,
	[PhoneNumber] [varchar](12) NULL,
	[DateofBirth] [date] NULL,
	[Gender] [varchar](7) NULL,
	[Address] [varchar](100) NULL,
	[Photo] [varchar](100) NULL,
 CONSTRAINT [PK_Teacher$] PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp]    Script Date: 18/05/2017 11.29.50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp](
	[id_temp] [int] IDENTITY(1,1) NOT NULL,
	[id] [varchar](8) NULL,
	[sender] [varchar](8) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 18/05/2017 11.29.50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](8) NULL,
	[password] [varchar](10) NULL,
	[role] [varchar](8) NULL,
 CONSTRAINT [PK_User$] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Class] ([ClassName], [Grade]) VALUES (N'XA', 1)
INSERT [dbo].[Class] ([ClassName], [Grade]) VALUES (N'XB', 1)
INSERT [dbo].[Class] ([ClassName], [Grade]) VALUES (N'XIA', 2)
INSERT [dbo].[Class] ([ClassName], [Grade]) VALUES (N'XIB', 2)
INSERT [dbo].[Class] ([ClassName], [Grade]) VALUES (N'XIIA', 3)
INSERT [dbo].[Class] ([ClassName], [Grade]) VALUES (N'XIIB', 3)
SET IDENTITY_INSERT [dbo].[DetailClass] ON 

INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (1, N'XA', N'20170001')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (2, N'XA', N'20170002')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (3, N'XA', N'20170003')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (4, N'XA', N'20170004')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (5, N'XA', N'20170005')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (6, N'XA', N'20170006')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (7, N'XA', N'20170007')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (8, N'XA', N'20170008')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (9, N'XA', N'20170009')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (10, N'XA', N'20170010')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (11, N'XB', N'20170011')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (12, N'XB', N'20170012')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (13, N'XB', N'20170013')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (14, N'XB', N'20170014')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (15, N'XB', N'20170015')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (16, N'XB', N'20170016')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (17, N'XB', N'20170017')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (18, N'XB', N'20170018')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (19, N'XB', N'20170019')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (20, N'XIA', N'20160001')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (21, N'XIA', N'20160002')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (22, N'XIA', N'20160003')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (23, N'XIA', N'20160004')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (24, N'XIA', N'20160005')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (25, N'XIA', N'20160006')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (26, N'XIA', N'20160007')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (27, N'XIA', N'20160008')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (28, N'XIA', N'20160009')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (29, N'XIB', N'20160010')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (30, N'XIB', N'20160011')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (31, N'XIB', N'20160012')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (32, N'XIB', N'20160013')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (33, N'XIB', N'20160014')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (34, N'XIB', N'20160015')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (35, N'XIB', N'20160016')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (36, N'XIB', N'20160017')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (37, N'XIB', N'20160018')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (38, N'XIIA', N'20150001')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (39, N'XIIA', N'20150002')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (40, N'XIIA', N'20150003')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (41, N'XIIA', N'20150004')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (42, N'XIIA', N'20150005')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (43, N'XIIA', N'20150006')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (44, N'XIIA', N'20150007')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (45, N'XIIA', N'20150008')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (46, N'XIIB', N'20150009')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (47, N'XIIB', N'20150010')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (48, N'XIIB', N'20150011')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (49, N'XIIB', N'20150012')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (50, N'XIIB', N'20150013')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (51, N'XIIB', N'20150014')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (52, N'XIIB', N'20150015')
INSERT [dbo].[DetailClass] ([DetailClassId], [ClassName], [StudentId]) VALUES (53, N'XIIB', N'20150016')
SET IDENTITY_INSERT [dbo].[DetailClass] OFF
SET IDENTITY_INSERT [dbo].[DetailSchedule] ON 

INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (1, 1, N'S1001', N'T0001', N'Monday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (2, 1, N'S1001', N'T0001', N'Monday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (3, 1, N'S1001', N'T0001', N'Monday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (4, 1, N'S1002', N'T0009', N'Monday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (5, 1, N'S1002', N'T0009', N'Monday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (6, 1, N'S1003', N'T0003', N'Tuesday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (7, 1, N'S1003', N'T0003', N'Tuesday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (8, 1, N'S1003', N'T0003', N'Wednesday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (9, 1, N'S1003', N'T0003', N'Wednesday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (10, 1, N'S1004', N'T0004', N'Wednesday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (11, 1, N'S1004', N'T0004', N'Wednesday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (12, 1, N'S1004', N'T0004', N'Tuesday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (13, 1, N'S1004', N'T0004', N'Tuesday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (14, 1, N'S1005', N'T0012', N'Monday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (15, 1, N'S1005', N'T0012', N'Monday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (16, 1, N'S1006', N'T0006', N'Monday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (17, 1, N'S1006', N'T0013', N'Tuesday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (18, 1, N'S1007', N'T0007', N'Tuesday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (19, 1, N'S1007', N'T0007', N'Tuesday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (20, 1, N'S1008', N'T0015', N'Wednesday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (21, 1, N'S1008', N'T0015', N'Wednesday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (22, 1, N'S1009', N'T0016', N'Thursday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (23, 1, N'S1009', N'T0016', N'Thursday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (24, 1, N'S1009', N'T0016', N'Thursday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (25, 1, N'S1010', N'T0017', N'Thursday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (26, 1, N'S1010', N'T0017', N'Thursday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (27, 1, N'S1011', N'T0018', N'Wednesday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (28, 1, N'S1011', N'T0018', N'Wednesday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (29, 1, N'S1012', N'T0012', N'Friday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (30, 1, N'S1012', N'T0012', N'Friday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (31, 1, N'S1013', N'T0020', N'Friday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (32, 1, N'S1013', N'T0020', N'Friday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (33, 1, N'S1013', N'T0020', N'Saturday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (34, 1, N'S1013', N'T0020', N'Saturday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (35, 1, N'S1014', N'T0014', N'Tuesday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (36, 1, N'S1014', N'T0014', N'Friday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (37, 1, N'S1014', N'T0014', N'Friday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (38, 1, N'S1015', N'T0015', N'Thursday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (39, 1, N'S1015', N'T0015', N'Saturday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (40, 1, N'S1015', N'T0015', N'Saturday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (41, 1, N'S1016', N'T0016', N'Thursday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (42, 1, N'S1016', N'T0016', N'Thursday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (43, 1, N'S1016', N'T0016', N'Saturday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (44, 1, N'S1016', N'T0016', N'Saturday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (45, 1, N'S1017', N'T0017', N'Friday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (46, 1, N'S1017', N'T0017', N'Friday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (47, 1, N'S1017', N'T0017', N'Saturday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (48, 1, N'S1017', N'T0017', N'Saturday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (49, 4, N'S2001', N'T0018', N'Monday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (50, 4, N'S2001', N'T0018', N'Tuesday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (51, 4, N'S2001', N'T0018', N'Wednesday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (52, 4, N'S2002', N'T0019', N'Monday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (53, 4, N'S2002', N'T0019', N'Tuesday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (54, 4, N'S2003', N'T0015', N'Wednesday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (55, 4, N'S2003', N'T0015', N'Wednesday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (56, 4, N'S2003', N'T0015', N'Thursday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (57, 4, N'S2003', N'T0015', N'Thursday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (58, 4, N'S2004', N'T0008', N'Monday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (59, 4, N'S2004', N'T0001', N'Monday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (60, 4, N'S2004', N'T0001', N'Tuesday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (61, 4, N'S2004', N'T0001', N'Tuesday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (62, 4, N'S2005', N'T0002', N'Monday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (63, 4, N'S2005', N'T0002', N'Monday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (64, 4, N'S2006', N'T0003', N'Monday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (65, 4, N'S2006', N'T0003', N'Monday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (66, 4, N'S2007', N'T0011', N'Tuesday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (67, 4, N'S2007', N'T0004', N'Tuesday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (68, 4, N'S2008', N'T0005', N'Tuesday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (69, 4, N'S2008', N'T0005', N'Tuesday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (70, 4, N'S2009', N'T0006', N'Wednesday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (71, 4, N'S2009', N'T0006', N'Wednesday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (72, 4, N'S2009', N'T0006', N'Wednesday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (73, 4, N'S2010', N'T0007', N'Wednesday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (74, 4, N'S2010', N'T0007', N'Wednesday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (75, 4, N'S2011', N'T0008', N'Thursday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (76, 4, N'S2011', N'T0008', N'Thursday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (77, 4, N'S2011', N'T0008', N'Thursday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (78, 4, N'S2011', N'T0008', N'Thursday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (79, 4, N'S2012', N'T0009', N'Friday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (80, 4, N'S2012', N'T0009', N'Friday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (81, 4, N'S2012', N'T0009', N'Saturday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (82, 4, N'S2012', N'T0009', N'Saturday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (83, 4, N'S2013', N'T0010', N'Thursday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (84, 4, N'S2013', N'T0010', N'Thursday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (85, 4, N'S2014', N'T0011', N'Friday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (86, 4, N'S2014', N'T0011', N'Friday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (87, 4, N'S2014', N'T0011', N'Saturday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (88, 4, N'S2014', N'T0011', N'Saturday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (89, 4, N'S2015', N'T0012', N'Friday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (90, 4, N'S2015', N'T0012', N'Friday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (91, 4, N'S2015', N'T0012', N'Saturday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (92, 4, N'S2015', N'T0012', N'Saturday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (93, 4, N'S2016', N'T0013', N'Friday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (94, 4, N'S2016', N'T0013', N'Friday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (95, 4, N'S2016', N'T0013', N'Saturday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (96, 4, N'S2016', N'T0013', N'Saturday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (97, 3, N'S2001', N'T0018', N'Saturday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (98, 3, N'S2001', N'T0018', N'Friday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (99, 3, N'S2001', N'T0018', N'Thursday', 1)
GO
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (100, 3, N'S2002', N'T0019', N'Saturday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (101, 3, N'S2002', N'T0019', N'Friday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (102, 3, N'S2003', N'T0020', N'Thursday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (103, 3, N'S2003', N'T0020', N'Thursday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (104, 3, N'S2003', N'T0020', N'Wednesday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (105, 3, N'S2003', N'T0020', N'Wednesday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (106, 3, N'S2004', N'T0001', N'Saturday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (107, 3, N'S2004', N'T0001', N'Saturday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (108, 3, N'S2004', N'T0001', N'Friday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (109, 3, N'S2004', N'T0001', N'Friday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (110, 3, N'S2005', N'T0002', N'Saturday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (111, 3, N'S2005', N'T0002', N'Saturday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (112, 3, N'S2006', N'T0003', N'Saturday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (113, 3, N'S2006', N'T0003', N'Saturday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (162, 6, N'S3001', N'T0014', N'Monday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (163, 6, N'S3001', N'T0014', N'Monday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (164, 6, N'S3001', N'T0014', N'Monday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (165, 6, N'S3002', N'T0015', N'Monday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (166, 6, N'S3002', N'T0015', N'Monday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (167, 6, N'S3003', N'T0016', N'Monday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (168, 6, N'S3003', N'T0016', N'Monday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (169, 6, N'S3003', N'T0016', N'Monday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (170, 6, N'S3003', N'T0016', N'Tuesday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (171, 6, N'S3004', N'T0017', N'Tuesday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (172, 6, N'S3004', N'T0017', N'Tuesday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (173, 6, N'S3004', N'T0017', N'Tuesday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (174, 6, N'S3004', N'T0017', N'Tuesday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (175, 6, N'S3005', N'T0018', N'Tuesday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (176, 6, N'S3005', N'T0018', N'Tuesday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (177, 6, N'S3006', N'T0019', N'Tuesday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (178, 6, N'S3006', N'T0019', N'Wednesday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (179, 6, N'S3007', N'T0014', N'Wednesday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (180, 6, N'S3007', N'T0014', N'Wednesday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (181, 6, N'S3008', N'T0001', N'Wednesday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (182, 6, N'S3008', N'T0001', N'Wednesday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (183, 6, N'S3009', N'T0002', N'Wednesday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (184, 6, N'S3009', N'T0002', N'Wednesday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (185, 6, N'S3009', N'T0002', N'Wednesday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (186, 6, N'S3010', N'T0011', N'Thursday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (187, 6, N'S3010', N'T0011', N'Thursday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (188, 6, N'S3010', N'T0011', N'Thursday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (189, 6, N'S3010', N'T0011', N'Thursday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (190, 6, N'S3011', N'T0004', N'Thursday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (191, 6, N'S3011', N'T0004', N'Thursday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (192, 6, N'S3011', N'T0004', N'Thursday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (193, 6, N'S3011', N'T0004', N'Thursday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (194, 6, N'S3012', N'T0005', N'Friday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (195, 6, N'S3012', N'T0005', N'Friday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (196, 6, N'S3012', N'T0005', N'Friday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (197, 6, N'S3012', N'T0005', N'Friday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (198, 6, N'S3013', N'T0008', N'Friday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (199, 6, N'S3013', N'T0008', N'Friday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (200, 6, N'S3013', N'T0008', N'Friday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (201, 6, N'S3013', N'T0008', N'Friday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (202, 6, N'S3014', N'T0007', N'Saturday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (203, 6, N'S3014', N'T0007', N'Saturday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (204, 6, N'S3014', N'T0007', N'Saturday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (205, 6, N'S3014', N'T0007', N'Saturday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (206, 6, N'S3014', N'T0007', N'Saturday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (207, 6, N'S3014', N'T0007', N'Saturday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (208, 6, N'S3014', N'T0007', N'Saturday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (209, 6, N'S3014', N'T0007', N'Saturday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (210, 2, N'S1003', N'T0003', N'Monday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (211, 2, N'S1003', N'T0003', N'Monday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (212, 2, N'S1003', N'T0003', N'Monday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (213, 2, N'S1003', N'T0003', N'Monday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (214, 2, N'S1001', N'T0008', N'Tuesday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (215, 2, N'S1001', N'T0008', N'Tuesday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (216, 2, N'S1001', N'T0008', N'Tuesday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (217, 2, N'S1002', N'T0009', N'Tuesday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (218, 2, N'S1002', N'T0009', N'Tuesday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (219, 2, N'S1005', N'T0012', N'Tuesday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (220, 2, N'S1005', N'T0012', N'Tuesday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (221, 2, N'S1008', N'T0015', N'Tuesday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (222, 2, N'S1008', N'T0015', N'Wednesday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (223, 2, N'S1006', N'T0006', N'Wednesday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (224, 2, N'S1006', N'T0006', N'Wednesday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (225, 2, N'S1007', N'T0017', N'Wednesday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (226, 2, N'S1007', N'T0017', N'Wednesday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (227, 2, N'S1009', N'T0013', N'Wednesday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (228, 2, N'S1009', N'T0013', N'Wednesday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (229, 2, N'S1009', N'T0013', N'Wednesday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (230, 2, N'S1011', N'T0010', N'Thursday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (231, 2, N'S1011', N'T0010', N'Thursday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (232, 2, N'S1012', N'T0019', N'Thursday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (233, 2, N'S1012', N'T0019', N'Thursday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (234, 2, N'S1013', N'T0020', N'Thursday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (235, 2, N'S1013', N'T0020', N'Thursday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (236, 2, N'S1013', N'T0020', N'Thursday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (237, 2, N'S1013', N'T0020', N'Thursday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (238, 2, N'S1010', N'T0011', N'Friday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (239, 2, N'S1010', N'T0011', N'Friday', 2)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (240, 2, N'S1015', N'T0014', N'Friday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (241, 2, N'S1015', N'T0014', N'Friday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (242, 2, N'S1015', N'T0014', N'Friday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (243, 2, N'S1016', N'T0016', N'Friday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (244, 2, N'S1016', N'T0016', N'Friday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (245, 2, N'S1016', N'T0016', N'Friday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (246, 2, N'S1016', N'T0016', N'Saturday', 1)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (247, 2, N'S1004', N'T0003', N'Saturday', 2)
GO
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (248, 2, N'S1004', N'T0003', N'Saturday', 3)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (249, 2, N'S1004', N'T0003', N'Saturday', 4)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (250, 2, N'S1004', N'T0003', N'Saturday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (251, 2, N'S1014', N'T0014', N'Saturday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (252, 2, N'S1014', N'T0014', N'Saturday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (253, 2, N'S1014', N'T0014', N'Saturday', 8)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (254, 2, N'S1017', N'T0017', N'Monday', 5)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (255, 2, N'S1017', N'T0017', N'Monday', 6)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (256, 2, N'S1017', N'T0017', N'Monday', 7)
INSERT [dbo].[DetailSchedule] ([DetailId], [ScheduleId], [SubjectId], [TeacherId], [Day], [ShiftId]) VALUES (257, 2, N'S1017', N'T0017', N'Monday', 8)
SET IDENTITY_INSERT [dbo].[DetailSchedule] OFF
SET IDENTITY_INSERT [dbo].[DetailScore] ON 

INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1136, N'20170001', 48, 85, 88, 4)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1137, N'20170001', 44, 12, 19, 35)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1138, N'20170001', 40, 51, 62, 33)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1139, N'20170001', 37, 17, 39, 47)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1140, N'20170001', 34, 81, 18, 47)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1141, N'20170001', 30, 63, 52, 89)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1142, N'20170001', 28, 67, 14, 30)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1143, N'20170001', 26, 21, 34, 58)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1144, N'20170001', 24, 91, 19, 11)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1145, N'20170001', 21, 15, 18, 30)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1146, N'20170001', 19, 79, 43, 31)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1147, N'20170001', 17, 21, 81, 92)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1148, N'20170001', 15, 32, 78, 87)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1149, N'20170001', 13, 4, 26, 13)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1150, N'20170001', 9, 8, 28, 58)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1151, N'20170001', 5, 39, 63, 51)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1152, N'20170001', 3, 26, 37, 76)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1153, N'20170002', 48, 27, 91, 75)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1154, N'20170002', 44, 85, 64, 50)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1155, N'20170002', 40, 54, 70, 13)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1156, N'20170002', 37, 42, 72, 4)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1157, N'20170002', 34, 10, 58, 52)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1158, N'20170002', 30, 71, 8, 58)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1159, N'20170002', 28, 88, 55, 22)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1160, N'20170002', 26, 15, 58, 68)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1161, N'20170002', 24, 22, 61, 79)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1162, N'20170002', 21, 44, 53, 96)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1163, N'20170002', 19, 49, 0, 92)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1164, N'20170002', 17, 77, 43, 100)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1165, N'20170002', 15, 5, 83, 82)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1166, N'20170002', 13, 59, 78, 89)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1167, N'20170002', 9, 62, 59, 6)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1168, N'20170002', 5, 96, 47, 31)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1169, N'20170002', 3, 37, 28, 49)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1170, N'20170003', 48, 88, 56, 78)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1171, N'20170003', 44, 86, 97, 35)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1172, N'20170003', 40, 46, 9, 18)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1173, N'20170003', 37, 25, 54, 6)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1174, N'20170003', 34, 64, 41, 100)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1175, N'20170003', 30, 56, 29, 2)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1176, N'20170003', 28, 1, 37, 66)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1177, N'20170003', 26, 33, 11, 57)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1178, N'20170003', 24, 38, 28, 92)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1179, N'20170003', 21, 30, 4, 88)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1180, N'20170003', 19, 44, 52, 49)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1181, N'20170003', 17, 71, 73, 14)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1182, N'20170003', 15, 39, 74, 97)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1183, N'20170003', 13, 91, 67, 100)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1184, N'20170003', 9, 8, 63, 22)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1185, N'20170003', 5, 35, 43, 43)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1186, N'20170003', 3, 8, 9, 71)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1187, N'20170004', 48, 34, 91, 66)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1188, N'20170004', 44, 7, 90, 32)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1189, N'20170004', 40, 61, 16, 77)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1190, N'20170004', 37, 77, 5, 74)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1191, N'20170004', 34, 39, 90, 8)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1192, N'20170004', 30, 21, 42, 15)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1193, N'20170004', 28, 87, 4, 25)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1194, N'20170004', 26, 91, 80, 63)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1195, N'20170004', 24, 60, 37, 19)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1196, N'20170004', 21, 23, 7, 3)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1197, N'20170004', 19, 84, 78, 22)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1198, N'20170004', 17, 3, 0, 29)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1199, N'20170004', 15, 86, 35, 80)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1200, N'20170004', 13, 81, 0, 97)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1201, N'20170004', 6, 0, 0, 0)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1202, N'20170004', 5, 90, 84, 44)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1203, N'20170004', 3, 17, 83, 69)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1204, N'20170005', 48, 89, 61, 80)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1205, N'20170005', 44, 60, 37, 87)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1206, N'20170005', 40, 8, 36, 73)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1207, N'20170005', 37, 54, 90, 76)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1208, N'20170005', 34, 95, 31, 15)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1209, N'20170005', 30, 63, 66, 95)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1210, N'20170005', 28, 88, 56, 49)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1211, N'20170005', 26, 49, 30, 90)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1212, N'20170005', 24, 63, 85, 29)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1213, N'20170005', 21, 81, 5, 10)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1214, N'20170005', 19, 74, 90, 1)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1215, N'20170005', 17, 77, 59, 52)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1216, N'20170005', 15, 38, 66, 19)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1217, N'20170005', 13, 50, 36, 56)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1218, N'20170005', 9, 2, 73, 59)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1219, N'20170005', 5, 78, 0, 85)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1220, N'20170005', 3, 99, 78, 63)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1221, N'20170006', 48, 87, 100, 91)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1222, N'20170006', 44, 38, 26, 20)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1223, N'20170006', 40, 84, 5, 66)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1224, N'20170006', 37, 2, 60, 59)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1225, N'20170006', 34, 46, 3, 33)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1226, N'20170006', 30, 93, 91, 75)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1227, N'20170006', 28, 0, 42, 82)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1228, N'20170006', 26, 23, 59, 63)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1229, N'20170006', 24, 91, 32, 11)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1230, N'20170006', 21, 49, 28, 72)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1231, N'20170006', 19, 12, 85, 9)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1232, N'20170006', 17, 82, 18, 55)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1233, N'20170006', 15, 79, 81, 77)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1234, N'20170006', 13, 63, 86, 53)
GO
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1235, N'20170006', 9, 47, 27, 40)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1236, N'20170006', 5, 1, 65, 42)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1237, N'20170006', 3, 64, 73, 41)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1238, N'20170007', 48, 53, 13, 29)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1239, N'20170007', 44, 1, 66, 66)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1240, N'20170007', 40, 93, 98, 87)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1241, N'20170007', 37, 79, 55, 82)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1242, N'20170007', 34, 27, 83, 82)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1243, N'20170007', 30, 7, 13, 64)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1244, N'20170007', 28, 11, 24, 57)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1245, N'20170007', 26, 41, 78, 17)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1246, N'20170007', 24, 82, 56, 5)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1247, N'20170007', 21, 3, 72, 81)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1248, N'20170007', 19, 29, 28, 34)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1249, N'20170007', 17, 87, 81, 85)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1250, N'20170007', 15, 89, 50, 15)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1251, N'20170007', 13, 52, 1, 65)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1252, N'20170007', 9, 16, 52, 99)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1253, N'20170007', 5, 13, 29, 53)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1254, N'20170007', 3, 29, 59, 20)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1255, N'20170008', 48, 3, 19, 24)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1256, N'20170008', 44, 38, 2, 47)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1257, N'20170008', 40, 94, 15, 38)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1258, N'20170008', 37, 1, 9, 41)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1259, N'20170008', 34, 42, 26, 97)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1260, N'20170008', 30, 44, 17, 91)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1261, N'20170008', 28, 34, 19, 92)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1262, N'20170008', 26, 94, 91, 51)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1263, N'20170008', 24, 79, 46, 67)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1264, N'20170008', 21, 35, 98, 46)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1265, N'20170008', 19, 40, 71, 25)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1266, N'20170008', 17, 29, 83, 11)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1267, N'20170008', 15, 52, 86, 63)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1268, N'20170008', 13, 96, 53, 1)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1269, N'20170008', 9, 9, 60, 66)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1270, N'20170008', 5, 47, 30, 69)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1271, N'20170008', 3, 60, 96, 55)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1272, N'20170009', 48, 21, 34, 76)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1273, N'20170009', 44, 24, 94, 44)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1274, N'20170009', 40, 52, 95, 84)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1275, N'20170009', 37, 58, 80, 3)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1276, N'20170009', 34, 89, 17, 43)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1277, N'20170009', 30, 73, 90, 99)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1278, N'20170009', 28, 39, 35, 49)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1279, N'20170009', 26, 4, 70, 22)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1280, N'20170009', 24, 41, 86, 69)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1281, N'20170009', 21, 47, 32, 53)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1282, N'20170009', 19, 71, 5, 51)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1283, N'20170009', 17, 82, 62, 86)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1284, N'20170009', 15, 20, 31, 48)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1285, N'20170009', 13, 33, 22, 0)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1286, N'20170009', 9, 21, 8, 52)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1287, N'20170009', 5, 20, 61, 0)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1288, N'20170009', 3, 62, 99, 32)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1289, N'20170010', 48, 57, 26, 26)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1290, N'20170010', 44, 90, 20, 54)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1291, N'20170010', 40, 42, 61, 31)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1292, N'20170010', 37, 28, 32, 55)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1293, N'20170010', 34, 19, 49, 8)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1294, N'20170010', 30, 38, 39, 78)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1295, N'20170010', 28, 27, 50, 38)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1296, N'20170010', 26, 56, 56, 28)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1297, N'20170010', 24, 62, 34, 22)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1298, N'20170010', 21, 71, 35, 70)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1299, N'20170010', 19, 25, 31, 54)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1300, N'20170010', 17, 57, 38, 89)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1301, N'20170010', 15, 13, 44, 34)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1302, N'20170010', 13, 23, 76, 22)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1303, N'20170010', 9, 79, 61, 84)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1304, N'20170010', 5, 13, 56, 27)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1305, N'20170010', 3, 92, 63, 80)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1306, N'20170011', 216, 11, 23, 71)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1307, N'20170011', 218, 18, 26, 27)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1308, N'20170011', 213, 96, 75, 80)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1309, N'20170011', 250, 46, 67, 23)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1310, N'20170011', 220, 26, 66, 98)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1311, N'20170011', 224, 41, 15, 55)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1312, N'20170011', 226, 33, 8, 93)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1313, N'20170011', 222, 98, 5, 25)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1314, N'20170011', 229, 97, 84, 15)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1315, N'20170011', 239, 29, 19, 37)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1316, N'20170011', 231, 50, 27, 86)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1317, N'20170011', 233, 36, 92, 99)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1318, N'20170011', 237, 65, 19, 77)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1319, N'20170011', 253, 62, 98, 90)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1320, N'20170011', 242, 15, 69, 55)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1321, N'20170011', 246, 29, 76, 45)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1322, N'20170011', 257, 20, 100, 59)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1323, N'20170012', 216, 86, 54, 7)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1324, N'20170012', 218, 58, 41, 48)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1325, N'20170012', 213, 38, 43, 88)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1326, N'20170012', 250, 13, 73, 45)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1327, N'20170012', 220, 93, 69, 41)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1328, N'20170012', 224, 17, 16, 1)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1329, N'20170012', 226, 3, 69, 83)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1330, N'20170012', 222, 96, 96, 59)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1331, N'20170012', 229, 14, 1, 33)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1332, N'20170012', 239, 91, 1, 39)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1333, N'20170012', 231, 31, 58, 89)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1334, N'20170012', 233, 100, 58, 35)
GO
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1335, N'20170012', 237, 91, 70, 92)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1336, N'20170012', 253, 76, 28, 51)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1337, N'20170012', 242, 8, 48, 74)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1338, N'20170012', 246, 72, 27, 64)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1339, N'20170012', 257, 11, 86, 94)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1340, N'20170013', 216, 25, 9, 49)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1341, N'20170013', 218, 39, 17, 74)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1342, N'20170013', 213, 66, 61, 35)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1343, N'20170013', 250, 1, 81, 52)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1344, N'20170013', 220, 11, 4, 21)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1345, N'20170013', 224, 6, 45, 30)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1346, N'20170013', 226, 22, 73, 97)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1347, N'20170013', 222, 48, 32, 87)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1348, N'20170013', 229, 20, 74, 81)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1349, N'20170013', 239, 5, 27, 29)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1350, N'20170013', 231, 82, 1, 12)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1351, N'20170013', 233, 82, 65, 74)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1352, N'20170013', 237, 0, 26, 25)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1353, N'20170013', 253, 22, 74, 78)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1354, N'20170013', 242, 11, 40, 10)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1355, N'20170013', 246, 64, 66, 36)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1356, N'20170013', 257, 86, 11, 44)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1357, N'20170014', 216, 86, 62, 42)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1358, N'20170014', 218, 32, 27, 14)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1359, N'20170014', 213, 26, 8, 85)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1360, N'20170014', 250, 25, 41, 90)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1361, N'20170014', 220, 52, 8, 81)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1362, N'20170014', 224, 42, 63, 80)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1363, N'20170014', 226, 47, 35, 51)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1364, N'20170014', 222, 48, 28, 60)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1365, N'20170014', 229, 34, 95, 41)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1366, N'20170014', 239, 82, 23, 38)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1367, N'20170014', 231, 4, 55, 60)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1368, N'20170014', 233, 45, 65, 48)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1369, N'20170014', 237, 61, 99, 20)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1370, N'20170014', 253, 61, 89, 22)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1371, N'20170014', 242, 9, 68, 58)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1372, N'20170014', 246, 26, 0, 21)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1373, N'20170014', 257, 3, 50, 51)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1374, N'20170015', 216, 83, 78, 26)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1375, N'20170015', 218, 42, 84, 30)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1376, N'20170015', 213, 5, 31, 6)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1377, N'20170015', 250, 24, 79, 31)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1378, N'20170015', 220, 52, 48, 34)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1379, N'20170015', 224, 30, 19, 95)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1380, N'20170015', 226, 87, 80, 52)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1381, N'20170015', 222, 95, 61, 27)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1382, N'20170015', 229, 88, 42, 61)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1383, N'20170015', 239, 81, 83, 52)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1384, N'20170015', 231, 23, 34, 96)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1385, N'20170015', 233, 3, 2, 31)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1386, N'20170015', 237, 32, 4, 88)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1387, N'20170015', 253, 59, 70, 15)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1388, N'20170015', 242, 38, 45, 75)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1389, N'20170015', 246, 60, 80, 21)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1390, N'20170015', 257, 44, 86, 81)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1391, N'20170016', 216, 89, 81, 61)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1392, N'20170016', 218, 28, 95, 51)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1393, N'20170016', 213, 14, 96, 47)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1394, N'20170016', 250, 32, 74, 83)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1395, N'20170016', 220, 73, 56, 100)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1396, N'20170016', 224, 19, 65, 54)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1397, N'20170016', 226, 78, 11, 10)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1398, N'20170016', 222, 16, 96, 31)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1399, N'20170016', 229, 50, 33, 57)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1400, N'20170016', 239, 84, 14, 36)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1401, N'20170016', 231, 33, 42, 64)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1402, N'20170016', 233, 23, 55, 91)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1403, N'20170016', 237, 62, 13, 25)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1404, N'20170016', 253, 36, 74, 72)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1405, N'20170016', 242, 17, 9, 65)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1406, N'20170016', 246, 69, 45, 9)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1407, N'20170016', 257, 85, 3, 39)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1408, N'20170017', 216, 15, 47, 47)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1409, N'20170017', 218, 66, 49, 72)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1410, N'20170017', 213, 3, 16, 93)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1411, N'20170017', 250, 39, 62, 36)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1412, N'20170017', 220, 46, 0, 39)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1413, N'20170017', 224, 14, 2, 77)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1414, N'20170017', 226, 41, 81, 78)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1415, N'20170017', 222, 52, 25, 36)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1416, N'20170017', 229, 96, 16, 96)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1417, N'20170017', 239, 15, 26, 49)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1418, N'20170017', 231, 15, 69, 54)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1419, N'20170017', 233, 92, 99, 28)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1420, N'20170017', 237, 84, 25, 80)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1421, N'20170017', 253, 93, 4, 95)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1422, N'20170017', 242, 37, 41, 75)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1423, N'20170017', 246, 69, 26, 98)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1424, N'20170017', 257, 52, 58, 8)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1425, N'20170018', 216, 65, 80, 56)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1426, N'20170018', 218, 38, 81, 80)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1427, N'20170018', 213, 72, 69, 24)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1428, N'20170018', 250, 2, 29, 89)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1429, N'20170018', 220, 21, 100, 49)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1430, N'20170018', 224, 7, 35, 67)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1431, N'20170018', 226, 72, 68, 41)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1432, N'20170018', 222, 80, 39, 94)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1433, N'20170018', 229, 77, 16, 66)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1434, N'20170018', 239, 44, 29, 2)
GO
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1435, N'20170018', 231, 36, 0, 88)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1436, N'20170018', 233, 98, 29, 78)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1437, N'20170018', 237, 89, 87, 52)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1438, N'20170018', 253, 65, 17, 8)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1439, N'20170018', 242, 13, 1, 74)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1440, N'20170018', 246, 29, 46, 21)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1441, N'20170018', 257, 39, 19, 4)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1442, N'20170019', 216, 74, 46, 19)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1443, N'20170019', 218, 96, 36, 71)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1444, N'20170019', 213, 44, 9, 26)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1445, N'20170019', 250, 34, 73, 82)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1446, N'20170019', 220, 77, 30, 12)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1447, N'20170019', 224, 88, 43, 8)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1448, N'20170019', 226, 23, 36, 75)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1449, N'20170019', 222, 99, 18, 12)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1450, N'20170019', 229, 55, 67, 64)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1451, N'20170019', 239, 88, 87, 33)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1452, N'20170019', 231, 19, 42, 81)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1453, N'20170019', 233, 94, 50, 32)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1454, N'20170019', 237, 60, 96, 17)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1455, N'20170019', 253, 67, 93, 73)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1456, N'20170019', 242, 89, 60, 63)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1457, N'20170019', 246, 51, 59, 41)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1458, N'20170019', 257, 85, 44, 66)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1459, N'20160011', 67, 12, 1, 27)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1460, N'20160011', 69, 29, 1, 39)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1461, N'20160011', 72, 80, 55, 6)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1462, N'20160011', 74, 21, 78, 3)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1463, N'20160011', 78, 35, 50, 87)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1464, N'20160011', 82, 1, 43, 63)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1465, N'20160011', 84, 13, 77, 19)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1466, N'20160011', 88, 93, 82, 78)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1467, N'20160011', 92, 45, 43, 42)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1468, N'20160011', 96, 3, 72, 32)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1469, N'20160011', 67, 84, 30, 85)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1470, N'20160011', 69, 35, 26, 22)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1471, N'20160011', 72, 24, 76, 15)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1472, N'20160011', 74, 5, 21, 44)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1473, N'20160011', 78, 41, 37, 9)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1474, N'20160011', 82, 30, 90, 98)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1475, N'20160012', 84, 56, 25, 57)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1476, N'20160012', 88, 95, 54, 37)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1477, N'20160012', 92, 84, 24, 65)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1478, N'20160012', 96, 66, 45, 80)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1479, N'20160012', 67, 57, 99, 19)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1480, N'20160012', 69, 61, 31, 19)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1481, N'20160012', 72, 83, 48, 38)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1482, N'20160012', 74, 42, 74, 41)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1483, N'20160012', 78, 0, 4, 14)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1484, N'20160012', 82, 93, 76, 42)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1485, N'20160012', 84, 34, 31, 96)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1486, N'20160012', 88, 67, 2, 75)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1487, N'20160012', 92, 7, 92, 39)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1488, N'20160012', 96, 54, 1, 30)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1489, N'20160012', 67, 3, 63, 55)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1490, N'20160012', 69, 76, 32, 96)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1491, N'20160013', 72, 73, 71, 72)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1492, N'20160013', 74, 18, 66, 29)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1493, N'20160013', 78, 65, 25, 30)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1494, N'20160013', 82, 28, 100, 0)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1495, N'20160013', 84, 81, 51, 48)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1496, N'20160013', 88, 22, 33, 68)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1497, N'20160013', 92, 0, 74, 3)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1498, N'20160013', 96, 98, 21, 89)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1499, N'20160013', 67, 84, 93, 62)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1500, N'20160013', 69, 9, 36, 41)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1501, N'20160013', 72, 93, 69, 4)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1502, N'20160013', 74, 4, 33, 94)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1503, N'20160013', 78, 41, 31, 39)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1504, N'20160013', 82, 29, 58, 56)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1505, N'20160013', 84, 77, 96, 25)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1506, N'20160013', 88, 30, 43, 57)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1507, N'20160014', 92, 57, 47, 35)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1508, N'20160014', 96, 2, 82, 57)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1509, N'20160014', 67, 93, 34, 13)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1510, N'20160014', 69, 40, 25, 79)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1511, N'20160014', 72, 79, 43, 85)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1512, N'20160014', 74, 2, 53, 9)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1513, N'20160014', 78, 3, 57, 48)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1514, N'20160014', 82, 53, 55, 26)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1515, N'20160014', 84, 93, 24, 84)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1516, N'20160014', 88, 2, 20, 66)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1517, N'20160014', 92, 46, 81, 5)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1518, N'20160014', 96, 82, 92, 82)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1519, N'20160014', 67, 9, 70, 73)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1520, N'20160014', 69, 14, 18, 87)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1521, N'20160014', 72, 16, 29, 96)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1522, N'20160014', 74, 31, 9, 2)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1523, N'20160015', 78, 41, 21, 25)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1524, N'20160015', 82, 22, 22, 87)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1525, N'20160015', 84, 28, 47, 79)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1526, N'20160015', 88, 73, 28, 41)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1527, N'20160015', 92, 12, 45, 1)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1528, N'20160015', 96, 48, 48, 96)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1529, N'20160015', 67, 74, 82, 21)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1530, N'20160015', 69, 74, 60, 87)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1531, N'20160015', 72, 27, 98, 99)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1532, N'20160015', 74, 70, 99, 77)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1533, N'20160015', 78, 12, 63, 49)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1534, N'20160015', 82, 80, 56, 66)
GO
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1535, N'20160015', 84, 30, 15, 30)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1536, N'20160015', 88, 57, 86, 63)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1537, N'20160015', 92, 38, 87, 58)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1538, N'20160015', 96, 52, 45, 11)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1539, N'20160016', 51, 67, 77, 75)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1540, N'20160016', 53, 21, 89, 45)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1541, N'20160016', 57, 15, 43, 15)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1542, N'20160016', 59, 84, 3, 29)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1543, N'20160016', 63, 0, 23, 48)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1544, N'20160016', 65, 44, 77, 87)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1545, N'20160016', 67, 10, 42, 26)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1546, N'20160016', 69, 38, 85, 45)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1547, N'20160016', 72, 50, 23, 97)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1548, N'20160016', 74, 43, 97, 38)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1549, N'20160016', 78, 30, 42, 51)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1550, N'20160016', 82, 11, 88, 79)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1551, N'20160016', 84, 92, 60, 72)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1552, N'20160016', 88, 47, 19, 55)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1553, N'20160016', 92, 29, 70, 94)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1554, N'20160016', 96, 7, 10, 19)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1555, N'20160017', 51, 0, 77, 52)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1556, N'20160017', 53, 100, 7, 21)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1557, N'20160017', 57, 81, 89, 46)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1558, N'20160017', 59, 80, 67, 33)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1559, N'20160017', 63, 60, 79, 24)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1560, N'20160017', 65, 15, 37, 92)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1561, N'20160017', 67, 26, 61, 73)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1562, N'20160017', 69, 9, 81, 60)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1563, N'20160017', 72, 9, 58, 68)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1564, N'20160017', 74, 65, 36, 46)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1565, N'20160017', 78, 88, 66, 77)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1566, N'20160017', 82, 93, 51, 59)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1567, N'20160017', 84, 68, 24, 55)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1568, N'20160017', 88, 59, 80, 51)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1569, N'20160017', 92, 55, 65, 23)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1570, N'20160017', 96, 53, 87, 77)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1571, N'20160018', 51, 83, 100, 44)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1572, N'20160018', 53, 54, 24, 59)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1573, N'20160018', 57, 37, 34, 4)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1574, N'20160018', 59, 37, 47, 39)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1575, N'20160018', 63, 11, 35, 30)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1576, N'20160018', 65, 70, 90, 50)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1577, N'20160018', 67, 42, 0, 15)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1578, N'20160018', 69, 2, 97, 71)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1579, N'20160018', 72, 43, 56, 55)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1580, N'20160018', 74, 5, 17, 51)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1581, N'20160018', 78, 58, 12, 81)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1582, N'20160018', 82, 78, 17, 93)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1583, N'20160018', 84, 82, 18, 99)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1584, N'20160018', 88, 52, 74, 66)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1585, N'20160018', 92, 74, 8, 63)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1586, N'20160018', 96, 57, 12, 43)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1587, N'20160010', 51, 11, 100, 24)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1588, N'20160010', 53, 41, 60, 77)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1589, N'20160010', 57, 65, 60, 84)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1590, N'20160010', 59, 70, 74, 91)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1591, N'20160010', 63, 83, 20, 85)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1592, N'20160010', 65, 22, 12, 96)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1593, N'20160010', 67, 48, 47, 54)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1594, N'20160010', 69, 33, 60, 29)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1595, N'20160010', 72, 77, 0, 78)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1596, N'20160010', 74, 50, 82, 62)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1597, N'20160010', 78, 83, 14, 39)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1598, N'20160010', 82, 4, 25, 52)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1599, N'20160010', 84, 14, 41, 63)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1600, N'20160010', 88, 68, 36, 65)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1601, N'20160010', 92, 75, 16, 43)
INSERT [dbo].[DetailScore] ([ScoreDetailId], [StudentId], [DetailId], [Assignment], [MidExam], [FinalExam]) VALUES (1602, N'20160010', 96, 77, 69, 17)
SET IDENTITY_INSERT [dbo].[DetailScore] OFF
SET IDENTITY_INSERT [dbo].[Expertise] ON 

INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (143, N'T0001', N'S1001')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (144, N'T0008', N'S1001')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (145, N'T0007', N'S1001')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (146, N'T0020', N'S1001')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (147, N'T0009', N'S1002')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (148, N'T0002', N'S1002')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (149, N'T0001', N'S1002')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (150, N'T0017', N'S1002')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (151, N'T0003', N'S1003')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (152, N'T0010', N'S1003')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (153, N'T0002', N'S1003')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (154, N'T0016', N'S1003')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (155, N'T0004', N'S1004')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (156, N'T0011', N'S1004')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (157, N'T0003', N'S1004')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (158, N'T0005', N'S1004')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (159, N'T0012', N'S1005')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (160, N'T0005', N'S1005')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (161, N'T0004', N'S1005')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (162, N'T0002', N'S1005')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (163, N'T0013', N'S1006')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (164, N'T0006', N'S1006')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (165, N'T0005', N'S1006')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (166, N'T0002', N'S1006')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (167, N'T0007', N'S1007')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (168, N'T0014', N'S1007')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (169, N'T0006', N'S1007')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (170, N'T0017', N'S1007')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (171, N'T0015', N'S1008')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (172, N'T0008', N'S1008')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (173, N'T0007', N'S1008')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (174, N'T0014', N'S1008')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (175, N'T0016', N'S1009')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (176, N'T0009', N'S1009')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (177, N'T0008', N'S1009')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (178, N'T0013', N'S1009')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (179, N'T0017', N'S1010')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (180, N'T0010', N'S1010')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (181, N'T0009', N'S1010')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (182, N'T0011', N'S1010')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (183, N'T0018', N'S1011')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (184, N'T0011', N'S1011')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (185, N'T0010', N'S1011')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (186, N'T0003', N'S1011')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (187, N'T0012', N'S1012')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (188, N'T0019', N'S1012')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (189, N'T0011', N'S1012')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (190, N'T0007', N'S1012')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (191, N'T0020', N'S1013')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (192, N'T0013', N'S1013')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (193, N'T0012', N'S1013')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (194, N'T0019', N'S1013')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (195, N'T0014', N'S1014')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (196, N'T0013', N'S1014')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (197, N'T0020', N'S1014')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (198, N'T0012', N'S1014')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (199, N'T0015', N'S1015')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (200, N'T0014', N'S1015')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (201, N'T0019', N'S1015')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (202, N'T0008', N'S1015')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (203, N'T0016', N'S1016')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (204, N'T0015', N'S1016')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (205, N'T0018', N'S1016')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (206, N'T0004', N'S1016')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (207, N'T0017', N'S1017')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (208, N'T0016', N'S1017')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (209, N'T0005', N'S1017')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (210, N'T0018', N'S1017')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (211, N'T0018', N'S2001')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (212, N'T0017', N'S2001')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (213, N'T0016', N'S2001')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (214, N'T0001', N'S2001')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (215, N'T0019', N'S2002')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (216, N'T0018', N'S2002')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (217, N'T0015', N'S2002')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (218, N'T0009', N'S2002')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (219, N'T0020', N'S2003')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (220, N'T0015', N'S2003')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (221, N'T0019', N'S2003')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (222, N'T0014', N'S2003')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (223, N'T0004', N'S2003')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (224, N'T0001', N'S2004')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (225, N'T0020', N'S2004')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (226, N'T0013', N'S2004')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (227, N'T0006', N'S2004')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (228, N'T0002', N'S2005')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (229, N'T0001', N'S2005')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (230, N'T0012', N'S2005')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (231, N'T0018', N'S2005')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (232, N'T0003', N'S2006')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (233, N'T0002', N'S2006')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (234, N'T0011', N'S2006')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (235, N'T0005', N'S2006')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (236, N'T0004', N'S2007')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (237, N'T0003', N'S2007')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (238, N'T0010', N'S2007')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (239, N'T0015', N'S2007')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (240, N'T0005', N'S2008')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (241, N'T0004', N'S2008')
GO
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (242, N'T0009', N'S2008')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (243, N'T0008', N'S2008')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (244, N'T0006', N'S2009')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (245, N'T0005', N'S2009')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (246, N'T0008', N'S2009')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (247, N'T0007', N'S2009')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (248, N'T0007', N'S2010')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (249, N'T0006', N'S2010')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (250, N'T0017', N'S2010')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (251, N'T0013', N'S2010')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (252, N'T0008', N'S2011')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (253, N'T0007', N'S2011')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (254, N'T0006', N'S2011')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (255, N'T0004', N'S2011')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (256, N'T0009', N'S2012')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (257, N'T0008', N'S2012')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (258, N'T0005', N'S2012')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (259, N'T0012', N'S2012')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (260, N'T0010', N'S2013')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (261, N'T0009', N'S2013')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (262, N'T0004', N'S2013')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (263, N'T0006', N'S2013')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (264, N'T0011', N'S2014')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (265, N'T0010', N'S2014')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (266, N'T0003', N'S2014')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (267, N'T0001', N'S2014')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (268, N'T0012', N'S2015')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (269, N'T0011', N'S2015')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (270, N'T0002', N'S2015')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (271, N'T0003', N'S2015')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (272, N'T0013', N'S2016')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (273, N'T0012', N'S2016')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (274, N'T0001', N'S2016')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (275, N'T0006', N'S2016')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (276, N'T0014', N'S3001')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (277, N'T0013', N'S3001')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (278, N'T0020', N'S3001')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (279, N'T0003', N'S3001')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (280, N'T0015', N'S3002')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (281, N'T0014', N'S3002')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (282, N'T0019', N'S3002')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (283, N'T0008', N'S3002')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (284, N'T0016', N'S3003')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (285, N'T0009', N'S3003')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (286, N'T0018', N'S3003')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (287, N'T0015', N'S3003')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (288, N'T0017', N'S3004')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (289, N'T0016', N'S3004')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (290, N'T0012', N'S3004')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (291, N'T0005', N'S3004')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (292, N'T0018', N'S3005')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (293, N'T0017', N'S3005')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (294, N'T0016', N'S3005')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (295, N'T0019', N'S3005')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (296, N'T0019', N'S3006')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (297, N'T0018', N'S3006')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (298, N'T0015', N'S3006')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (299, N'T0010', N'S3006')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (300, N'T0020', N'S3007')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (301, N'T0019', N'S3007')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (302, N'T0014', N'S3007')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (303, N'T0009', N'S3007')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (304, N'T0001', N'S3008')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (305, N'T0020', N'S3008')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (306, N'T0013', N'S3008')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (307, N'T0014', N'S3008')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (308, N'T0002', N'S3009')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (309, N'T0001', N'S3009')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (310, N'T0012', N'S3009')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (311, N'T0016', N'S3009')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (312, N'T0003', N'S3010')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (313, N'T0002', N'S3010')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (314, N'T0011', N'S3010')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (315, N'T0010', N'S3010')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (316, N'T0004', N'S3011')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (317, N'T0003', N'S3011')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (318, N'T0010', N'S3011')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (319, N'T0020', N'S3011')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (320, N'T0005', N'S3012')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (321, N'T0004', N'S3012')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (322, N'T0009', N'S3012')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (323, N'T0011', N'S3012')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (324, N'T0006', N'S3013')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (325, N'T0005', N'S3013')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (326, N'T0008', N'S3013')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (327, N'T0017', N'S3013')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (328, N'T0007', N'S3014')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (329, N'T0006', N'S3014')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (330, N'T0019', N'S3014')
INSERT [dbo].[Expertise] ([ExpertiseId], [TeacherId], [SubjectId]) VALUES (331, N'T0007', N'S3014')
SET IDENTITY_INSERT [dbo].[Expertise] OFF
SET IDENTITY_INSERT [dbo].[HeaderSchedule] ON 

INSERT [dbo].[HeaderSchedule] ([ScheduleId], [ClassName], [Finalize]) VALUES (1, N'XA', 1)
INSERT [dbo].[HeaderSchedule] ([ScheduleId], [ClassName], [Finalize]) VALUES (2, N'XB', 1)
INSERT [dbo].[HeaderSchedule] ([ScheduleId], [ClassName], [Finalize]) VALUES (3, N'XIA', 0)
INSERT [dbo].[HeaderSchedule] ([ScheduleId], [ClassName], [Finalize]) VALUES (4, N'XIB', 1)
INSERT [dbo].[HeaderSchedule] ([ScheduleId], [ClassName], [Finalize]) VALUES (5, N'XIIA', 0)
INSERT [dbo].[HeaderSchedule] ([ScheduleId], [ClassName], [Finalize]) VALUES (6, N'XIIB', 0)
SET IDENTITY_INSERT [dbo].[HeaderSchedule] OFF
SET IDENTITY_INSERT [dbo].[Pesan] ON 

INSERT [dbo].[Pesan] ([id_pesan], [sender], [receiver], [konten], [status], [sent_time], [title]) VALUES (4, N'T0001', N'T0002', N'asdasd', N'unread', N'2017', N'2323')
INSERT [dbo].[Pesan] ([id_pesan], [sender], [receiver], [konten], [status], [sent_time], [title]) VALUES (5, N'T0001', N'', N'ASD', N'Unread', N'2017-05-18 09.55.51', N'ASD')
INSERT [dbo].[Pesan] ([id_pesan], [sender], [receiver], [konten], [status], [sent_time], [title]) VALUES (6, N'T0001', N'20150009', N'ASD', N'Read', N'2017-05-18 09.57.29', N'ASD')
INSERT [dbo].[Pesan] ([id_pesan], [sender], [receiver], [konten], [status], [sent_time], [title]) VALUES (9, N'20150009', N'20170002', N'ASDASD', N'Unread', N'2017-05-18 11.02.36', N'ALIANDO')
INSERT [dbo].[Pesan] ([id_pesan], [sender], [receiver], [konten], [status], [sent_time], [title]) VALUES (10, N'20150009', N'20160008', N'ASDASD', N'Unread', N'2017-05-18 11.02.36', N'ALIANDO')
INSERT [dbo].[Pesan] ([id_pesan], [sender], [receiver], [konten], [status], [sent_time], [title]) VALUES (11, N'T0001', N'20150009', N'ASDASD', N'Read', N'2017-05-18 11.03.16', N'ASDASD')
INSERT [dbo].[Pesan] ([id_pesan], [sender], [receiver], [konten], [status], [sent_time], [title]) VALUES (12, N'T0001', N'20150009', N'ASDASDSD', N'Read', N'2017-05-18 11.07.50', N'ASDASDA')
INSERT [dbo].[Pesan] ([id_pesan], [sender], [receiver], [konten], [status], [sent_time], [title]) VALUES (13, N'T0001', N'20150009', N'ASDASD', N'Read', N'2017-05-18 11.09.19', N'SDSDSDSD')
INSERT [dbo].[Pesan] ([id_pesan], [sender], [receiver], [konten], [status], [sent_time], [title]) VALUES (15, N'20150009', N'T0001', N'fgfgf', N'Read', N'2017-05-18 11.16.48', N'dftgf')
INSERT [dbo].[Pesan] ([id_pesan], [sender], [receiver], [konten], [status], [sent_time], [title]) VALUES (16, N'T0001', N'20150008', N'asdasdasd', N'Unread', N'2017-05-18 11.27.05', N'manusiasddasd')
INSERT [dbo].[Pesan] ([id_pesan], [sender], [receiver], [konten], [status], [sent_time], [title]) VALUES (17, N'T0001', N'20160018', N'asdasdasd', N'Unread', N'2017-05-18 11.27.05', N'manusiasddasd')
INSERT [dbo].[Pesan] ([id_pesan], [sender], [receiver], [konten], [status], [sent_time], [title]) VALUES (18, N'T0001', N'20150016', N'asdasdasd', N'Unread', N'2017-05-18 11.27.05', N'manusiasddasd')
INSERT [dbo].[Pesan] ([id_pesan], [sender], [receiver], [konten], [status], [sent_time], [title]) VALUES (19, N'T0001', N'20160013', N'asdasdasd', N'Unread', N'2017-05-18 11.27.05', N'manusiasddasd')
SET IDENTITY_INSERT [dbo].[Pesan] OFF
INSERT [dbo].[Shift] ([ShiftId], [Time]) VALUES (1, N'07:00 - 07:50')
INSERT [dbo].[Shift] ([ShiftId], [Time]) VALUES (2, N'07:50 - 08:40')
INSERT [dbo].[Shift] ([ShiftId], [Time]) VALUES (3, N'08:40 - 09:30')
INSERT [dbo].[Shift] ([ShiftId], [Time]) VALUES (4, N'09:50 - 10:40')
INSERT [dbo].[Shift] ([ShiftId], [Time]) VALUES (5, N'10:40 - 11:30')
INSERT [dbo].[Shift] ([ShiftId], [Time]) VALUES (6, N'11:30 - 12:20')
INSERT [dbo].[Shift] ([ShiftId], [Time]) VALUES (7, N'12:40 - 13:30')
INSERT [dbo].[Shift] ([ShiftId], [Time]) VALUES (8, N'13:30 - 14:20')
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20150001', N'M. ARIF BASRI', N'264 Burrows Center', N'Male', CAST(N'1999-05-19' AS Date), N'081235509036', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20150002', N'MARTINUS GAI BARA LIRA PARERA', N'2704 Barnett Avenue', N'Male', CAST(N'1999-05-20' AS Date), N'0818765488', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20150003', N'MARVIN FURIANTO', N'1 Chinook Hill', N'Male', CAST(N'1999-05-21' AS Date), N'08165384904', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20150004', N'MOHAMAD FATHUR BAWAFIE', N'7 Comanche Point', N'Male', CAST(N'1999-05-22' AS Date), N'0812357490', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20150005', N'MUHAMMAD FADIL KAMAL', N'91597 Service Park', N'Male', CAST(N'1999-05-23' AS Date), N'0819475858', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20150006', N'MUHAMMAD FARHAN HIDAYAT', N'3 Bluestem Center', N'Male', CAST(N'1999-05-24' AS Date), N'08135454532', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20150007', N'MUHAMMAD HANIF', N'5 Oneill Hill', N'Male', CAST(N'1999-05-25' AS Date), N'08132757599', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20150008', N'MUHAMMAD ILHAM RAHMADI', N'6 Steensland Place', N'Male', CAST(N'1999-05-26' AS Date), N'0812675899', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20150009', N'MUHAMMAD REYNALDI', N'10030 Fieldstone Plaza', N'Male', CAST(N'1999-05-27' AS Date), N'0812546789', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20150010', N'NAMIRA MUFIDA ADIEN', N'9 Parkside Court', N'Female', CAST(N'1999-05-28' AS Date), N'08123565332', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20150011', N'NIXON', N'2365 Ridge Oak Drive', N'Male', CAST(N'1999-05-29' AS Date), N'08528564744', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20150012', N'RIANDA ANGGAR KUSUMA', N'4 Hoffman Avenue', N'Male', CAST(N'1999-05-30' AS Date), N'08126754554', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20150013', N'RICKY RIZALDI', N'7634 Gerald Point', N'Male', CAST(N'1999-05-31' AS Date), N'08164954777', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20150014', N'SAMUEL BUDIMAN', N'97564 Westport Avenue', N'Male', CAST(N'1999-06-01' AS Date), N'08172554678', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20150015', N'SAMUEL SANJAYA SUTANTO', N'771 Meadow Valley Lane', N'Male', CAST(N'1999-06-02' AS Date), N'0818204773', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20150016', N'SHAVIRA', N'96 Elmside Place', N'Female', CAST(N'1999-06-03' AS Date), N'08135678494', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160001', N'HAM, RICHARD ADHIKA HARTONO', N'20805 Sunfield Alley', N'Male', CAST(N'2000-09-17' AS Date), N'0812889798', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160002', N'HENDRAWAN HADIKUSUMA', N'083 Center Trail', N'Male', CAST(N'2000-09-18' AS Date), N'08523677748', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160003', N'IGNATIUS KEVIN LANATA', N'7 Monterey Alley', N'Male', CAST(N'2000-09-19' AS Date), N'08577565555', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160004', N'INDRA KURNIAWAN', N'05888 Moland Way', N'Male', CAST(N'2000-09-20' AS Date), N'08123556565', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160005', N'JEREMY SETIAWAN', N'7 Pleasure Trail', N'Male', CAST(N'2000-09-21' AS Date), N'08123556676', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160006', N'JOHAN', N'6853 Kenwood Place', N'Male', CAST(N'2000-09-22' AS Date), N'08129674399', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160007', N'KATILI JIWO ADI WIYONO', N'38 Northport Circle', N'Male', CAST(N'2000-09-23' AS Date), N'08123657645', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160008', N'KEVIN FAUSTA', N'9652 Lunder Way', N'Male', CAST(N'2000-09-24' AS Date), N'08126643434', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160009', N'KEVIN HADINATA', N'819 Debra Alley', N'Male', CAST(N'2000-09-25' AS Date), N'0812332555', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160010', N'KEVIN KUSWANDI', N'610 Columbus Center', N'Male', CAST(N'2000-09-26' AS Date), N'0812366454', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160011', N'KEVIN SETIADI ', N'24727 Northwestern Avenue', N'Male', CAST(N'2000-09-27' AS Date), N'08125656767', N'E:\COM19\Jawaban\Module 1\IMAGE\20170517044747.png')
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160012', N'KEVIN YULIAS', N'355 Troy Hill', N'Male', CAST(N'2000-09-28' AS Date), N'0812355665', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160013', N'KRESNA ADJIE DEWANTARA', N'00751 Center Court', N'Male', CAST(N'2000-09-29' AS Date), N'0818407446', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160014', N'LAYARDA PUTRA ANGKASA', N'1551 Lyons Point', N'Male', CAST(N'2000-09-30' AS Date), N'0819475656', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160015', N'LEON NATANTO', N'354 Nobel Alley', N'Male', CAST(N'2000-10-01' AS Date), N'08125678966', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160016', N'LEONARDO KURNIAWAN', N'44 Loeprich Trail', N'Male', CAST(N'2000-10-02' AS Date), N'089965474894', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160017', N'LISA INDRAPUTRI', N'7617 Manley Junction', N'Female', CAST(N'2000-10-03' AS Date), N'08957447999', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20160018', N'M YOGA PRANATA', N'43819 Namekagon Circle', N'Male', CAST(N'2000-10-04' AS Date), N'0813873535', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170001', N'ACHMAD RAFII SYAFRAN', N'2 Starling Drive', N'Male', CAST(N'2001-05-15' AS Date), N'08124556565', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170002', N'ADITYA PUTRA BUDIMAN', N'672 Swallow Trail', N'Male', CAST(N'2001-05-16' AS Date), N'0812356565', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170003', N'ALBERT PRATAMA PUTRA TJHIA', N'94327 Moland Avenue', N'Male', CAST(N'2001-05-17' AS Date), N'0816565343', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170004', N'ANDI LIWANTORO SUSANTO', N'73 Hoffman Hill', N'Male', CAST(N'2001-05-18' AS Date), N'08127998343', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170005', N'AUDIA LAVENA', N'20 Hanover Plaza', N'Female', CAST(N'2001-05-19' AS Date), N'08124566465', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170006', N'BELIGA', N'49 Sullivan Street', N'Male', CAST(N'2001-05-20' AS Date), N'081236656544', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170007', N'BRYAN', N'62946 Nevada Place', N'Male', CAST(N'2001-05-21' AS Date), N'08525676767', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170008', N'CALVIN LAURENSIUS NATA', N'400 Northview Parkway', N'Male', CAST(N'2001-05-22' AS Date), N'08125656545', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170009', N'CALVIN THEMDUANG', N'180 Bay Way', N'Male', CAST(N'2001-05-23' AS Date), N'08125652343', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170010', N'CARISSA', N'26 Golf Course Court', N'Female', CAST(N'2001-05-24' AS Date), N'0819556563', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170011', N'CHANDRA BUNJAYA', N'089 Northridge Place', N'Male', CAST(N'2001-05-25' AS Date), N'0818356565', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170012', N'CHRISTIN YOHANA', N'860 Northwestern Point', N'Female', CAST(N'2001-05-26' AS Date), N'08180754663', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170013', N'CORNELLIUS GANOR ALBARADIE', N'8 Lukken Parkway', N'Male', CAST(N'2001-05-27' AS Date), N'08123555666', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170014', N'DEDDY SUPRIYADI', N'32 Carpenter Avenue', N'Male', CAST(N'2001-05-28' AS Date), N'08123653332', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170015', N'EDWINDO LAURENZO WIJANTO', N'4532 Pond Avenue', N'Male', CAST(N'2001-05-29' AS Date), N'081235563132', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170016', N'EZRA INDRASTATA SPINOZA', N'0 Dunning Junction', N'Male', CAST(N'2001-05-30' AS Date), N'08135656563', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170017', N'FAJRUL EMIRULLAH', N'13455 Grover Center', N'Male', CAST(N'2001-05-31' AS Date), N'085659766353', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170018', N'FREDRICK WIDJAYA', N'3 Anhalt Place', N'Male', CAST(N'2001-10-17' AS Date), N'083155665450', NULL)
INSERT [dbo].[Student] ([StudentId], [Name], [Address], [Gender], [DateofBirth], [PhoneNumber], [Photo]) VALUES (N'20170019', N'GERALDY OSCAR REINARD', N'520 Northridge Point', N'Male', CAST(N'2001-06-02' AS Date), N'08123656564', NULL)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S1001', N'agama', 20, 30, 50, 3, 1)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S1002', N'PKN', 20, 30, 50, 2, 1)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S1003', N'bahasa indonesia', 30, 35, 35, 4, 1)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S1004', N'matematika', 30, 30, 40, 4, 1)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S1005', N'sejarah', 40, 30, 30, 2, 1)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S1006', N'bahasa inggris', 25, 35, 40, 2, 1)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S1007', N'seni budaya', 40, 30, 30, 2, 1)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S1008', N'prakarya', 25, 35, 40, 2, 1)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S1009', N'olahraga', 40, 30, 30, 3, 1)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S1010', N'fisika', 40, 30, 30, 2, 1)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S1011', N'pemrograman dasar', 30, 35, 35, 2, 1)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S1012', N'sistem komputer', 30, 30, 40, 2, 1)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S1013', N'perakitan komputer', 25, 35, 40, 4, 1)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S1014', N'simulasi digital', 30, 30, 40, 3, 1)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S1015', N'sistem operasi', 25, 35, 40, 3, 1)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S1016', N'jaringan dasar', 20, 30, 50, 4, 1)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S1017', N'pemrograman web', 30, 30, 40, 4, 1)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S2001', N'agama', 20, 30, 50, 3, 2)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S2002', N'PKN', 20, 30, 50, 2, 2)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S2003', N'bahasa indonesia', 30, 35, 35, 4, 2)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S2004', N'matematika', 30, 30, 40, 4, 2)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S2005', N'sejarah', 40, 30, 30, 2, 2)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S2006', N'bahasa inggris', 25, 35, 40, 2, 2)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S2007', N'seni budaya', 20, 30, 50, 2, 2)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S2008', N'prakarya', 30, 30, 40, 2, 2)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S2009', N'olahraga', 30, 35, 35, 3, 2)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S2010', N'fisika', 25, 35, 40, 2, 2)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S2011', N'pemrograman dasar', 20, 30, 50, 4, 2)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S2012', N'sistem komputer', 30, 30, 40, 4, 2)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S2013', N'komputer terapan', 30, 35, 35, 2, 2)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S2014', N'komunikasi data', 25, 35, 40, 4, 2)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S2015', N'sistem operasi jaringan', 20, 30, 50, 4, 2)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S2016', N'administrasi server', 30, 30, 40, 4, 2)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S3001', N'agama', 20, 30, 50, 3, 3)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S3002', N'PKN', 20, 30, 50, 2, 3)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S3003', N'bahasa indonesia', 30, 35, 35, 4, 3)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S3004', N'matematika', 30, 30, 40, 4, 3)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S3005', N'sejarah', 40, 30, 30, 2, 3)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S3006', N'bahasa inggris', 25, 35, 40, 2, 3)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S3007', N'seni budaya', 20, 30, 50, 2, 3)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S3008', N'prakarya', 30, 30, 40, 2, 3)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S3009', N'olahraga', 30, 35, 35, 3, 3)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S3010', N'jaringan nirkable', 25, 35, 40, 4, 3)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S3011', N'keamanan jaringan', 20, 30, 50, 4, 3)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S3012', N'trouble shooting jaringan', 30, 30, 40, 4, 3)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S3013', N'rancang bangun jaringan', 30, 35, 35, 4, 3)
INSERT [dbo].[Subject] ([SubjectId], [Name], [Assignment], [MidExam], [FinalExam], [Shift], [ForGrade]) VALUES (N'S3014', N'kerja proyek', 30, 30, 40, 8, 3)
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0001', N'Deren', N'085860619210', CAST(N'1980-08-12' AS Date), N'Male', N'Jl. Gatot Subroto No. 101, Surakarta', N'E:\COM19\Jawaban\Module 1\IMAGE\20170517043204.png')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0002', N'Barry Ron', N'083527836201', CAST(N'1980-08-13' AS Date), N'Male', N'Jl. Bengawan Asri No. 11, Surakarta', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0003', N'Merry Antony', N'081024168959', CAST(N'1980-08-14' AS Date), N'Female', N'Jl. Bumi Asri Indah No. 13, Surakarta', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0004', N'Christi', N'083840886410', CAST(N'1980-08-15' AS Date), N'Female', N'Komp. Griya Bima Asri Blok.B No. 47, Surakarta', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0005', N'Alan Reynaldi', N'087181912892', CAST(N'1980-08-16' AS Date), N'Male', N'Jl. Sudirman No. 492, Surakarta', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0006', N'Richard Sentosa', N'084139640318', CAST(N'1980-08-17' AS Date), N'Male', N'Jl. Keraton No. 842, Surakarta', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0007', N'Brenda', N'085271078084', CAST(N'1980-08-18' AS Date), N'Female', N'Komp. Wartawan Blok. E No. 198, Surakarta', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0008', N'Reza Mulyadi', N'089600460157', CAST(N'1980-08-19' AS Date), N'Male', N'Jl. Istimewa Gg. Hj Sahid No. 19, Surakarta', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0009', N'Brandon', N'082907690980', CAST(N'1980-08-20' AS Date), N'Male', N'Jl. AH Nasution No. 74, Surakarta', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0010', N'Reynold', N'085998471025', CAST(N'1980-08-21' AS Date), N'Male', N'Komp. Solo Makmur Blok. F No. 58, Surakarta', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0011', N'Adam hudin', N'087314677817', CAST(N'1980-08-22' AS Date), N'Male', N'Jl. Yos Sudarso No. 79, Surakarta', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0012', N'Conny Ken', N'083629914049', CAST(N'1980-08-23' AS Date), N'Female', N'Jl. Vandenburg Gg. Hj Kalam No. 26, Surakarta ', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0013', N'Cindy', N'082808492208', CAST(N'1980-08-24' AS Date), N'Female', N'Jl. Keraton No. 387, Surakarta', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0014', N'Kristian', N'083407419721', CAST(N'1980-08-25' AS Date), N'Male', N'Jl. Gatot Subroto No. 41, Surakarta', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0015', N'Dimas Santoso', N'083064285597', CAST(N'1980-08-26' AS Date), N'Male', N'Komp. Solo Makmur Blok. K No. 28, Surakarta', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0016', N'Tito Gunawan', N'085603050550', CAST(N'1980-08-27' AS Date), N'Male', N'Jl. Solo Baru No. 192,Sukoharjo', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0017', N'Kurnia Jaya', N'089643299667', CAST(N'1980-08-28' AS Date), N'Male', N'Komp. Bumi Sari Indah No.77, Surakarta', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0018', N'Ilman Halim', N'087948727992', CAST(N'1980-08-29' AS Date), N'Male', N'Komp. Griya Bima Asri Blok.D No. 37, Surakarta', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0019', N'George Tan', N'084928397718', CAST(N'1980-09-01' AS Date), N'Male', N'Jl. Vandenburg Gg. Hj Kasim No. 16, Surakarta ', N'-')
INSERT [dbo].[Teacher] ([TeacherId], [Name], [PhoneNumber], [DateofBirth], [Gender], [Address], [Photo]) VALUES (N'T0020', N'Ina Haminah', N'087893774922', CAST(N'1980-09-02' AS Date), N'Female', N'Jl. Sudirman No. 292, Surakarta', N'-')
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (1, N'T0001', N'r}zru€', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (2, N'T0002', N'JkDZtsgfn2', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (3, N'T0003', N'Wwmw4k44Y', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (4, N'T0004', N'tP2mA1eR', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (5, N'T0005', N'Iq7ySHrWAW', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (6, N'T0006', N'L71lWreH', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (7, N'T0007', N'KlveW4SNxT', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (8, N'T0008', N'UTIPqhpgQJ', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (9, N'T0009', N'u3pHcE', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (10, N'T0010', N'NYFtKV3X69', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (11, N'T0011', N'NuzCoRV9b', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (12, N'T0012', N'45f3fp', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (13, N'T0013', N'EIeq3p2stc', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (14, N'T0014', N'abaOSBCDmR', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (15, N'T0015', N'Y3zRn5', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (16, N'T0016', N'teyG82', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (17, N'T0017', N'ebs6Vf', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (18, N'T0018', N'fXkf3y', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (19, N'T0019', N'999zQD', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (20, N'T0020', N'MHp3XA', N'Teacher')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (21, N'20170001', N'eGECi5', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (22, N'20170002', N'DIZ5DACG3g', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (23, N'20170003', N'MPqYq1ltew', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (24, N'20170004', N'Ua5hgvRV8a', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (25, N'20170005', N'KeQ8azJ', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (26, N'20170006', N'V1drEKo9Zp', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (27, N'20170007', N'0eXtq6IUy', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (28, N'20170008', N'D7gBH42', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (29, N'20170009', N'do9kditorr', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (30, N'20170010', N'PYpKZMz', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (31, N'20170011', N'Azl0SqG04l', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (32, N'20170012', N'BdTNFg', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (33, N'20170013', N'aafTWce', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (34, N'20170014', N'APldwi8l08', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (35, N'20170015', N'OC2AIr', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (36, N'20170016', N'SQujTUAUD', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (37, N'20170017', N'bJIjm4I2A', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (38, N'20170018', N'HPLdqZgmSW', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (39, N'20170019', N'JDYCO1gWYH', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (40, N'20160001', N'uVqRQE', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (41, N'20160002', N'tPbfeUIJ', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (42, N'20160003', N'v3wzAuNr', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (43, N'20160004', N'NK2kk5prEY', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (44, N'20160005', N'IMz0SSb9c', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (45, N'20160006', N'X4bLBpezmQ', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (46, N'20160007', N'UqJvwY30Mb', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (47, N'20160008', N'vDa3DKHC', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (48, N'20160009', N'j2ZnIre5g', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (49, N'20160010', N'CXELges', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (50, N'20160011', N'9PWMU5KU', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (51, N'20160012', N'gCUcSD50I', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (52, N'20160013', N'pgpI3lj1Rv', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (53, N'20160014', N'6EpVNgzetJ', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (54, N'20160015', N'x8wF88', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (55, N'20160016', N'YfalDMxQ5g', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (56, N'20160017', N'MAny0N', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (57, N'20160018', N'nZU1mpNqe', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (58, N'20150001', N'x2IPQLMXT3', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (59, N'20150002', N'C7YyOl57al', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (60, N'20150003', N'kLgr066hz', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (61, N'20150004', N'gt2L1l', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (62, N'20150005', N'6fF4wM4fK', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (63, N'20150006', N'VjX2lrgfAj', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (64, N'20150007', N'uclFtykmT', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (65, N'20150008', N'7iRgSPuthW', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (66, N'20150009', N'kyiWJOpvd', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (67, N'20150010', N'XLVqyzFIRO', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (68, N'20150011', N'4T7IK5ACix', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (69, N'20150012', N'ZV36Knqj', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (70, N'20150013', N'GeJpI8z', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (71, N'20150014', N'66LcsiI7z', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (72, N'20150015', N'XqpdIsxP2', N'Student')
INSERT [dbo].[User] ([userid], [username], [password], [role]) VALUES (73, N'20150016', N'1PBnCC', N'Student')
SET IDENTITY_INSERT [dbo].[User] OFF
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DetailScore"
            Begin Extent = 
               Top = 48
               Left = 225
               Bottom = 209
               Right = 395
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "DetailSchedule"
            Begin Extent = 
               Top = 118
               Left = 495
               Bottom = 284
               Right = 665
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DetailClass"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 119
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Class"
            Begin Extent = 
               Top = 97
               Left = 869
               Bottom = 193
               Right = 1039
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Subject"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
    ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_wew'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'     Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_wew'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_wew'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DetailSchedule"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 193
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DetailScore"
            Begin Extent = 
               Top = 23
               Left = 240
               Bottom = 201
               Right = 410
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Subject"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 195
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Student"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 186
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HeaderSchedule"
            Begin Extent = 
               Top = 136
               Left = 204
               Bottom = 272
               Right = 374
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_wow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'        Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_wow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_wow'
GO
