create database theoryexam

use theoryexam

create table Users (
	ID varchar(100) PRIMARY KEY,
	firstName varchar(255) NOT NULL,
	lastName varchar(255),
	gender char(1) NOT NULL,
	email varchar(25) check (email like '%@%.%') NOT NULL,
	school varchar(255),
	userAddress varchar(255),
	phone varchar(25) NOT NULL,
	locations varchar(255),
	dob varchar(25) NOT NULL
)

create table Friends (
	relationID varchar(100) PRIMARY KEY,
	UsersID varchar(100) FOREIGN KEY references Users(ID)
	on update cascade on delete set null,
	FriendsID varchar(100) NOT NULL
)

create table Pages (
	ID varchar(100) PRIMARY KEY,
	pageName varchar(255) NOT NULL,
	pageContent varchar(255) NOT NULL
)

create table Posts (
	ID varchar(100) PRIMARY KEY,
	postContent varchar(255),
	postDate varchar(25),
	UsersID varchar(100) FOREIGN KEY references Users(ID)
	on update cascade on delete set null
)

create table Photos (
	ID varchar(100) PRIMARY KEY,
	imageCont varchar(255)  NOT NULL,
	PostsID varchar(100) FOREIGN KEY references Posts(ID)
	on update cascade on delete set null
)

create table Comments (
	ID varchar(100) PRIMARY KEY,
	commentDate varchar(25),
	commentCont varchar(255),
	UsersID varchar(100) FOREIGN KEY references Users(ID)
	on update cascade on delete cascade, 
)

create table Shares (
	UsersID varchar(100) FOREIGN KEY(UsersID) references Users(ID)
	on update cascade ON DELETE CASCADE,
	PostsID varchar(100) FOREIGN KEY (PostsID) references Posts(ID)

	constraint shareKey PRIMARY KEY(UsersID, PostsID)
)

create table PostLikes (
	UsersID varchar(100),
	PostsID varchar(100)
	
	constraint postKey PRIMARY KEY(UsersID, PostsID),
	constraint postLFK FOREIGN KEY (UsersID) REFERENCES Users(ID)
	on update cascade on delete cascade,
	constraint postLFK2 FOREIGN KEY (PostsID) REFERENCES Posts(ID)
)

create table PageLikes (
	UsersID varchar(100) FOREIGN KEY(UsersID) references Users(ID) 
	on update cascade on delete cascade,
	PagesID varchar(100) FOREIGN KEY(PagesID) references Comments(ID)

	CONSTRAINT tableKey PRIMARY KEY (UsersID, PagesID)
)

create table CommentLikes (
	UsersID varchar(100),
	CommentsID varchar(100)

	constraint commentKey PRIMARY KEY(UsersID, CommentsID),
	constraint commentFK1 FOREIGN KEY(UsersID) REFERENCES Users(ID) ON UPDATE CASCADE ON DELETE CASCADE,
	constraint commentFK2 FOREIGN KEY(CommentsID) REFERENCES Comments(ID)
)

drop table CommentLikes

