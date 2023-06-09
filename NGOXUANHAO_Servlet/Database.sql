USE [HaoFinal]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 4/16/2022 10:33:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](10) NOT NULL,
	[VideoId] [nvarchar](20) NOT NULL,
	[LikeDate] [date] NULL,
 CONSTRAINT [PK_Favorite] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shares]    Script Date: 4/16/2022 10:33:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shares](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](10) NULL,
	[VideoId] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[ShareDate] [date] NULL,
 CONSTRAINT [PK_Share] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/16/2022 10:33:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [nvarchar](10) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[Fullname] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Avatar] [nvarchar](50) NULL,
	[Admin] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Videos]    Script Date: 4/16/2022 10:33:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Videos](
	[Id] [nvarchar](20) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Poster] [nvarchar](50) NULL,
	[Views] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Video] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Favorites] ON 

INSERT [dbo].[Favorites] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (109, N'xuanhao', N'drPKxqfFDms', CAST(N'2022-04-15' AS Date))
INSERT [dbo].[Favorites] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (116, N'xuanhao', N'Hpmnd4azsfg', CAST(N'2022-04-15' AS Date))
INSERT [dbo].[Favorites] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (117, N'nhathao', N'Hpmnd4azsfg', CAST(N'2022-04-15' AS Date))
INSERT [dbo].[Favorites] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (124, N'nhathao', N'drNd7sajxdU', CAST(N'2022-04-15' AS Date))
INSERT [dbo].[Favorites] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (126, N'kieutran', N'xDLEzaUTsyI', CAST(N'2022-04-15' AS Date))
INSERT [dbo].[Favorites] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (127, N'kieutran', N'Hpmnd4azsfg', CAST(N'2022-04-15' AS Date))
INSERT [dbo].[Favorites] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (128, N'nhathao', N'xDLEzaUTsyI', CAST(N'2022-04-15' AS Date))
INSERT [dbo].[Favorites] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (133, N'kieutran', N'fxpZ99AIOu0', CAST(N'2022-04-16' AS Date))
INSERT [dbo].[Favorites] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (134, N'kieutran', N'2Kqs5sW98Qw', CAST(N'2022-04-16' AS Date))
INSERT [dbo].[Favorites] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (135, N'xuanhao', N'LdqcIeie0Ac', CAST(N'2022-04-16' AS Date))
INSERT [dbo].[Favorites] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (136, N'xuanhao', N'd7uGuEKTzO0', CAST(N'2022-04-16' AS Date))
INSERT [dbo].[Favorites] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (137, N'nhathao', N'UTRCuieq8wU', CAST(N'2022-04-16' AS Date))
INSERT [dbo].[Favorites] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (138, N'nhathao', N'LdqcIeie0Ac', CAST(N'2022-04-16' AS Date))
INSERT [dbo].[Favorites] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (139, N'xuanhao', N'wvfo25W0NX0', CAST(N'2022-04-16' AS Date))
SET IDENTITY_INSERT [dbo].[Favorites] OFF
GO
SET IDENTITY_INSERT [dbo].[Shares] ON 

INSERT [dbo].[Shares] ([Id], [UserId], [VideoId], [Email], [ShareDate]) VALUES (5, N'xuanhao', N'LdqcIeie0Ac', N'test@mail.com', CAST(N'2022-04-14' AS Date))
INSERT [dbo].[Shares] ([Id], [UserId], [VideoId], [Email], [ShareDate]) VALUES (7, N'xuanhao', N'drNd7sajxdU', N'hao17072002@gmail.com', CAST(N'2022-04-14' AS Date))
INSERT [dbo].[Shares] ([Id], [UserId], [VideoId], [Email], [ShareDate]) VALUES (8, N'nhathao', N'4x8vsfpmtEc', N'hao17072002@gmail.com', CAST(N'2022-04-15' AS Date))
INSERT [dbo].[Shares] ([Id], [UserId], [VideoId], [Email], [ShareDate]) VALUES (9, N'nhathao', N'4x8vsfpmtEc', N'hao17072002@gmail.com', CAST(N'2022-04-15' AS Date))
INSERT [dbo].[Shares] ([Id], [UserId], [VideoId], [Email], [ShareDate]) VALUES (11, N'kieutran', N'LdqcIeie0Ac', N'hao17072002@gmail.com', CAST(N'2022-04-15' AS Date))
INSERT [dbo].[Shares] ([Id], [UserId], [VideoId], [Email], [ShareDate]) VALUES (12, N'kieutran', N'Hpmnd4azsfg', N'hao17072002@gmail.com', CAST(N'2022-04-15' AS Date))
INSERT [dbo].[Shares] ([Id], [UserId], [VideoId], [Email], [ShareDate]) VALUES (13, N'nhathao', N'drPKxqfFDms', N'hao17072002@gmail.com', CAST(N'2022-04-15' AS Date))
INSERT [dbo].[Shares] ([Id], [UserId], [VideoId], [Email], [ShareDate]) VALUES (14, N'nhathao', N'Hpmnd4azsfg', N'hao17072002@gmail.com', CAST(N'2022-04-15' AS Date))
INSERT [dbo].[Shares] ([Id], [UserId], [VideoId], [Email], [ShareDate]) VALUES (15, N'xuanhao', N'drNd7sajxdU', N'hao17072002@gmail.com', CAST(N'2022-04-16' AS Date))
SET IDENTITY_INSERT [dbo].[Shares] OFF
GO
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Email], [Avatar], [Admin]) VALUES (N'kieutran', N'123', N'Nguyễn Kiều Trân', N'kieutran1302@gmail.com', N'avt.jpg', 1)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Email], [Avatar], [Admin]) VALUES (N'nhathao', N'123', N'Phan Đình Nhật Hào', N'hao17072002@gmail.com', N'8.png', 1)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Email], [Avatar], [Admin]) VALUES (N'xuanhao', N'123', N'Ngô Xuân Hào', N'haopdnpc02112@fpt.edu.vnn', N'avt.jpg', 0)
GO
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'2Kqs5sW98Qw', N'ZIG e SHARKO 👛👗 Dia de compras com amigos 👛👗 Português Brasil | Cartoon for Kids', N'zigSharko1.jpg', 1, N'A série tem como cenário o mar e uma ilha deserta onde vive uma hiena faminta chamado Zig. Este está sempre a tentar apanhar e devorar uma sereia chamada Marina para saciar a sua fome, porém é constantemente impedido por Sharko, um tubarão que é apaixonado por Marina, e que retribui ao Zig umas pancadas, sempre que ele tenta armar algum esquema para caçar e comer a sua namorada.', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'4x8vsfpmtEc', N'Thám Tử Lừng Danh Conan - Tập 500 - 3 ngày cùng Hattori Heiji (Phần 1) - Trọn Bộ Conan', N'conan500.webp', 1, N'Testmmmmmmmmmmmmmmmmmmmmmmmmmm', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'cW6aAtz6b9k', N'Dragon Ball Tập 43 - Đến Nhà Bulma ở Thành Phố Phía Tây - Phim Bảy Viên Ngọc Rồng', N'dragonBall1.jpg', 2, N'Testmmmmmmmmmmmmmmmmmmmmmmmmmm', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'd7uGuEKTzO0', N'Oggy and the Cockroaches - THE MOVIE 🎬 Oggy Magnon 🔥', N'oggy1.jpg', 0, N'Testmmmmmmmmmmmmmmmmmmmmmmmmmm', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'drNd7sajxdU', N'One Piece Tập 880 - Sabo Hành Động Lộ Diện Các Đội Trưởng Của Quân Cách Mạng -Đảo Hải Tặc Tiếng Việt', N'onePiece880.webp', 1, N'▶️ Xem trước One Piece trên Ứng dụng POPS: https://popsapp.onelink.me/PAKN/YTOPNew 
▶️ Đăng ký ủng hộ POPS Anime để xem thêm nhiều bộ Anime mới nhất nhé: https://goo.gl/TWfPrJ', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'drPKxqfFDms', N'[S9] Doraemon - Tập 420 - Ra Mắt Đài Truyền Hình - Đóng Băng Cậu Ấy Đi - Hoạt Hình Tiếng Viêt', N'doraemon1.webp', 0, N'Testmmmmmmmmmmmmmmmmmmmmmmmmmm', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'fxpZ99AIOu0', N'Nhạc Chill TikTok Nhẹ Nhàng 10/2022 -Những Ca Khúc Lofi Chill Thịnh Hành Hay Nhất-Nhạc Lofi Buồn P38', N'lofi.jpg', 3, N'Testmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'epUxHfq0EXU', N'Zig & Sharko 🌈🍭 THE HOUSE OF CANDY (S02E39) Full Episodes in HD', N'zigSharko2.jpg', 1, N'Testmmmmmmmmmmmmmmmmmmmmmmmmmm', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'F4NseCozG2k', N'One Piece Tập 914 - Cuối Cùng Cũng Đụng Độ. Luffy Dũng Mãnh Vs Kaido! - Đảo Hải Tặc', N'onepiece2.webp', 2, N'Testmmmmmmmmmmmmmmmmmmmmmmmmmm', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'ftPjVOCyaLU', N'Oggy and the Cockroaches ⭐🌟 CHECK MY MISTERY BOX ⭐🌟 Full Episode HD', N'oggy2.jpg', 0, N'Testmmmmmmmmmmmmmmmmmmmmmmmmmm', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'Hpmnd4azsfg', N'One Piece Tập 493 - Luffy Và Ace. Cuộc Gặp Gỡ Của Những Người Anh Em! - Đảo Hải Tặc', N'onepiece3.jpg', 0, N'Testmmmmmmmmmmmmmmmmmmmmmmmmmm', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'jFspAYU_zrE', N'One Piece Tập 885 - Bóng Tối Của Thánh Địa Bí Ẩn Về Chiếc Mũ Rơm Khổng Lồ - Đảo Hải Tặc Tiếng Việt', N'onepiece4.webp', 1, N'Testmmmmmmmmmmmmmmmmmmmmmmmmmm', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'lc_YR9fhHLU', N'Oggy and the Cockroaches 🌏 THE HIDDEN WORLD (S03E20) Full Episode in HD', N'oggy3.jpg', 1, N'Testmmmmmmmmmmmmmmmmmmmmmmmmmm', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'LdqcIeie0Ac', N'One Piece Tập 878 - Thế Giới Kinh Ngạc Hoàng Đế Thứ 5 Của Biển Cả Xuất Hiện - Đảo Hải Tặc Tiếng Việt', N'onepiece5.jpg', 1, N'Testmmmmmmmmmmmmmmmmmmmmmmmmmm', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'lL4Ckd6b5sY', N'[S9] Doraemon - Tập 417 - Hạt Đậu Ác Quỷ Bị Đày - Tạm Biệt Shizuka - Hoạt Hình Tiếng Việt', N'doraemon2.webp', 0, N'Testmmmmmmmmmmmmmmmmmmmmmmmmmm', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'n0YFTb3aL2g', N'Marvel Studios'' Doctor Strange in the Multiverse of Madness | Dream', N'doctorStrange.jpg', 0, N'Testmmmmmmmmmmmmmmmmmmmmmmmmmm', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'N4QdGNHcp5s', N'[S6] Doraemon Tập 288 - Thử Nói Lời Từ Biệt - Tiếng Việt', N'doraemon3.jpg', 0, N'Testmmmmmmmmmmmmmmmmmmmmmmmmmm', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'oh-gBJMg0kE', N'Naruto Shippuden Tập 163 - Bộc Phát! Cảnh Giới Tiên Nhân - Trọn Bộ Naruto Lồng Tiếng', N'naruto1.jpg', 0, N'Testmmmmmmmmmmmmmmmmmmmmmmmmmm', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'PquZ6JtIxGk', N'Oggy and the Cockroaches 🏰 LOVE FOR OLIVIA 🏰 2019 Compilation - Full Episodes', N'oggy4.jpg', 2, N'Testmmmmmmmmmmmmmmmmmmmmmmmmmm', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'TcMBFSGVi1c', N'Marvel Studios'' Avengers: Endgame - Official Trailer', N'endGame.jpg', 1, N'Testmmmmmmmmmmmmmmmmmmmmmmmmmm', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'UTRCuieq8wU', N'Naruto Shippuden Tập 341 - Trở lại!! Orochimaru - Trọn Bộ Naruto Bản Lồng Tiếng', N'naruto2.jpg', 1, N'Testmmmmmmmmmmmmmmmmmmmmmmmmmm', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'VccS6y9yPgY', N'Thám Tử Lừng Danh Conan - Thu Thập Thông Tin Về Đội Thám Tử Nhí - Tổng Hợp Những Vụ Án Hay Nhất', N'8.png', 0, N'Testmmmmmmmmmmmmmmmmmmmmmmmmmm', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'VkHRiPKVv7Y', N'Naruto Shippuden Tập 337 - Phát Động Izanami - Trọn Bộ Naruto Bản Lồng Tiếng', N'2.jpg', 2, N'Testmmmmmmmmmmmmmmmmmmmmmmmmmm', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'wvfo25W0NX0', N'[S6] Doraemon Tiếng Việt - Hãy Cẩn Thận Khi Mua Đồ Ở Tương Lai', N'doraremon3.jpg', 0, N'Testmmmmmmmmmmmmmmmmmmmmmmmmmm', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'xDLEzaUTsyI', N'Naruto Shippuden Tập 322 - Uchiha Madara - Trọn Bộ Naruto Bản Lồng Tiếng', N'Madara-Uchiha.jpg', 0, N'Testmmmmmmmmmmmmmmmmmmmmmmmmmm', 1)
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorite_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Favorite_User]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorite_Video] FOREIGN KEY([VideoId])
REFERENCES [dbo].[Videos] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Favorite_Video]
GO
ALTER TABLE [dbo].[Shares]  WITH CHECK ADD  CONSTRAINT [FK_Share_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Shares] CHECK CONSTRAINT [FK_Share_User]
GO
ALTER TABLE [dbo].[Shares]  WITH CHECK ADD  CONSTRAINT [FK_Share_Video] FOREIGN KEY([VideoId])
REFERENCES [dbo].[Videos] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Shares] CHECK CONSTRAINT [FK_Share_Video]
GO
/****** Object:  StoredProcedure [dbo].[spFavoriteByYear]    Script Date: 4/16/2022 10:33:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spFavoriteByYear](@Year INT)
AS
BEGIN
SELECT
v.Title AS 'Group',
count(f.Id) AS 'Likes',
max(f.LikeDate) AS 'Newest',
min(f.LikeDate) AS 'Oldest'
FROM Favorites f JOIN Videos v ON v.Id = f.VideoId
WHERE year(f.LikeDate) = @Year
GROUP BY v.Title
END
GO
