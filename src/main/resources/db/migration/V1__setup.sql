create table users (
                       id bigserial not null AUTO_INCREMENT,
                       score                 bigserial not null,
                       username              varchar(30) not null,
                       password              varchar(80) not null,
                       email                 varchar(50) not null,
                       primary key (id)
);

create table roles (
                       id                    serial,
                       name                  varchar(50) not null,
                       primary key (id)
);

create table users_roles (
                             user_id               bigint not null,
                             role_id               int not null,
                             primary key (user_id, role_id),
                             foreign key (user_id) references users (id),
                             foreign key (role_id) references roles (id)
);

insert into roles (name)
values
('ROLE_USER'), ('ROLE_ADMIN');

insert into users (score, username, password, email)
values
(0, 'user0', '$2y$12$TAu02QLJuZew4W3z5XjG0.wWVSK5ehHHhZ2Ss8ujKt7IPkmyAyZkO', 'user0@gmail.com'),
(0, 'user1', '$2y$12$TAu02QLJuZew4W3z5XjG0.wWVSK5ehHHhZ2Ss8ujKt7IPkmyAyZkO', 'user1@gmail.com'),
(0, 'user2', '$2y$12$TAu02QLJuZew4W3z5XjG0.wWVSK5ehHHhZ2Ss8ujKt7IPkmyAyZkO', 'user2@gmail.com'),
(0, 'user3', '$2y$12$TAu02QLJuZew4W3z5XjG0.wWVSK5ehHHhZ2Ss8ujKt7IPkmyAyZkO', 'user3@gmail.com'),
(0, 'user4', '$2y$12$TAu02QLJuZew4W3z5XjG0.wWVSK5ehHHhZ2Ss8ujKt7IPkmyAyZkO', 'user4@gmail.com'),
(0, 'user5', '$2y$12$TAu02QLJuZew4W3z5XjG0.wWVSK5ehHHhZ2Ss8ujKt7IPkmyAyZkO', 'user5@gmail.com'),
(0, 'user6', '$2y$12$TAu02QLJuZew4W3z5XjG0.wWVSK5ehHHhZ2Ss8ujKt7IPkmyAyZkO', 'user6@gmail.com'),
(0, 'admin', '$2y$12$TAu02QLJuZew4W3z5XjG0.wWVSK5ehHHhZ2Ss8ujKt7IPkmyAyZkO', 'user6@gmail.com');

insert into users_roles (user_id, role_id)
values
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 2);