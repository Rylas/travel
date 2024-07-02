CREATE TABLE roles (
                       roleID BIGINT PRIMARY KEY AUTO_INCREMENT,
                       roleName VARCHAR(255)
);



CREATE TABLE users (
                       userId BIGINT PRIMARY KEY AUTO_INCREMENT,
                       firstName VARCHAR(255),
                       lastName VARCHAR(255),
                       email VARCHAR(255) NOT NULL UNIQUE,
                       password VARCHAR(255),
                       isActive BOOLEAN DEFAULT FALSE,
                       phone VARCHAR(20),
                       avatar VARCHAR(255) DEFAULT 'avatar-default.png',
                       address VARCHAR(255),
                       token VARCHAR(255),
                       createdAt DATE,
                       updatedAt DATE,
                       enterpriseId BIGINT,
                       roleID BIGINT,
                       FOREIGN KEY (enterpriseId) REFERENCES enterprise (enterpriseId),
                       FOREIGN KEY (roleID) REFERENCES roles (roleID)
);

CREATE TABLE bans (
                      banID BIGINT PRIMARY KEY AUTO_INCREMENT,
                      reason VARCHAR(255),
                      createdAt DATE,
                      updatedAt DATE,
                      userId BIGINT,
                      FOREIGN KEY (userId) REFERENCES users (userId)
);
