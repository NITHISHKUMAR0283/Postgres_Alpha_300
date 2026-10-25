# Role based access 


 ![schema](./erd.png)

 '''sql
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
 '''
1 .what our subsystem does ? :

    to allow specifict user to use specific resource by giving them role and permissions , 
    Restriciting un authorised access 

2 . table by table explanation :
    
    User - stores user name and unique user id which act as primary key 

    Role - stores unique role id and name of role
    
    Permission - stores unique permission id and permission name

    User_Role - Join table used to represent M:M relation ship between user and role 

    Role_permission - Join table used to represent M:M relation ship between role and permission table

3 . relationship :

    Foreign key in user_Role is used to make M:M relation ship between user and role 
    and which is same in role_permission table

4 . design choice :

    
    Design Choice: We opted for explicit normalized junction tables (User_Role and Role_Permission) instead of using PostgreSQL array columns 

    Alternative Rejected: Storing roles or permission strings directly inside array columns on the Users and Role tables.

    why : storing multiple roles in a string will have poor quering , where if we stored as a seperate user to role pair it is efficient to queiry 

5 . indexing :

    indexed all the key in both the join tabe , because it is used as a composite key in future .
