create table users
(
    user_id   int identity
        constraint PK__users__B9BE370FE6B3F446
            primary key,
    username  varchar(20)                                   not null,
    password  varchar(50)                                   not null,
    firstName varchar(20),
    lastName  varchar(20),
    role_code int
        constraint DF__users__role_code__3C69FB99 default 2 not null
)
go

create table posts
(
    post_id    int identity
        constraint PK__posts__3ED787667A5D7A6D
            primary key,
    post_name  nvarchar(200)                                        not null,
    content    nvarchar(max),
    created_at datetime
        constraint DF__posts__created_a__3F466844 default getdate() not null,
    updated_at datetime
        constraint DF__posts__updated_a__403A8C7D default getdate() not null,
    created_by int                                                  not null
        constraint fk__posts_users
            references users
)
go

create procedure sp_add_post @post_name nvarchar(200), @content nvarchar(max), @created_by INT
as
insert into posts (post_name, content, created_by)
values (@post_name, @content, @created_by)
go

create procedure sp_delete_post @post_id int
as
delete posts
where post_id = @post_id
go

create procedure sp_edit_post @post_id int, @post_name nvarchar(200), @content nvarchar(max)
as
update posts
set post_name  = @post_name,
    content    = @content,
    updated_at = getdate()
where post_id = @post_id
go

create procedure sp_login @username VARCHAR(20), @password VARCHAR(50)
as
select *
from users
where username = @username
  and @password = password
go

create procedure sp_read_post @post_id int
as
select *
from posts
where post_id = @post_id
go
