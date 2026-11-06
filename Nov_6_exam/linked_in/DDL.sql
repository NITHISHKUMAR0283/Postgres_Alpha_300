CREATE TABLE User_Profile(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL, 
    about VARCHAR(50),
    experience INT,
    followers INT,
    Connections INT
);

CREATE TABLE connection (
    from_id INT,
    to_id INT,
    status VARCHAR(50),
    FOREIGN KEY (from_id) REFERENCES User_profile(id) ON DELETE CASCADE,
    FOREIGN KEY (to_id) REFERENCES User_profile(id) ON DELETE CASCADE,

    PRIMARY KEY(from_id,to_id)
);

CREATE TABLE skill(
    skill_id INT PRIMARY KEY ,
    name VARCHAR(50)

);

CREATE TABLE Experience(
    profile_id INT,
    start DATE,
    end DATE,
    description VARCHAR(50),
    FOREIGN KEY (profile_id) REFERENCES User_profile(id) ON DELETE CASCADE
);

CREATE TABLE endrosement(
    from_id INT,
    to_id INT,
    skill_id INT,
    FOREIGN KEY (from_id) REFERENCES User_profile(id) ON DELETE CASCADE,
    FOREIGN KEY (to_id) REFERENCES User_profile(id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skill(skill_id) ON DELETE CASCADE,

    PRIMARY KEY (from_id,to_id,skill_id)

);

CREATE TABLE user_skill(
    profile_id INT ,
    skill_id INT,
    FOREIGN KEY (profile_id) REFERENCES User_profile(id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skill(skill_id) ON DELETE CASCADE ,

    PRIMARY KEY (profile_id,skill_id)
);

CREATE TABLE company(
    company_id SERIAL PRIMARY KEY ,
    name VARCHAR(50)
);

CREATE TABLE follow(
    from_id INT,
    company_id INT,
    FOREIGN KEY (from_id) REFERENCES User_profile(id) ON DELETE CASCADE,
    FOREIGN KEY (company_id) REFERENCES company(company_id) ON DELETE CASCADE,

    PRIMARY KEY(from_id,company_id)
);

CREATE INDEX follow_company on follow(company_id);
CREATE INDEX connection_to on connection(to_id);
CREATE INDEX experience_profile on experience(profile_id,start); 
