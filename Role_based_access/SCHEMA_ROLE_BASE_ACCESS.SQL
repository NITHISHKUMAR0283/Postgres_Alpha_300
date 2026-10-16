CREATE TABLE Users (
    id int PRIMARY KEY ,
    name varchar(50) NOT NULL
);

CREATE TABLE Role(
    role_id int PRIMARY KEY,
    role_Name varchar(50) NOT NULL
);
CREATE TABLE Permission(
    Permission_id int PRIMARY KEY,
    Permission_name varchar(50) NOT NULL
);

CREATE TABLE User_Role(
    user_id int NOT NULL,
    role_id int NOT NULL,

    PRIMARY KEY (user_id , role_id),  
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE,
    FOREIGN KEY (role_id) REFERENCES Role(role_id) ON DELETE CASCADE  
);


CREATE TABLE Role_Permission(
    role_id int NOT NULL,
    permission_id int NOT NULL,

    Primary Key( role_id , permission_id),
    FOREIGN KEY (role_id) REFERENCES Role(role_id) ON DELETE CASCADE,
    FOREIGN KEY (permission_id) REFERENCES  Permission(Permission_id) ON DELETE CASCADE
);

CREATE INDEX idx_user_role ON User_Role(user_id);
CREATE INDEX idx_role_user on User_Role(role_id);
CREATE INDEX idx_permission_role on Role_permission(role_id);
CREATE INDEX idx_permission_perm on Role_permission(permission_id)