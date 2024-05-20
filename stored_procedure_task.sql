
--
-- Procedure Task
--

/*
    A company needs a stored procedure that will insert
    a new user with an appropriate type.

    Consider the following tables: 

    TABLE userTypes
        id INTEGER NOT NULL PRIMARY KEY,
        type VARCHAR(50) NOT NULL

    TABLE users
        id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
        email VARCHAR(50) NOT NULL,
        userTypeId INTEGER NOT NULL,
        FOREIGN KEY (userTypeId) REFERENCES userTypes(id)

    
    Finish the insertUser procedure so that it inserts a user,
    with these requirements:

        - id is auto incremented
        - email is equal to the email parameter.
        - userTypeId is the id of the userTypes row whose type
            attribute is equal to the type parameter
*/

USE `db_test`;

DELIMITER //

CREATE PROCEDURE IF NOT EXISTS insertUser(
    IN userType VARCHAR(50),
    IN email VARCHAR(255)
)
BEGIN
    DECLARE userTypeId BIGINT;

    SELECT `id` INTO userTypeId
    FROM `userTypes`
    WHERE `type` = userType
    LIMIT 1;

    IF userTypeId IS NOT NULL THEN
        INSERT INTO `users` (`email`, `userTypeId`)  VALUES 
        (email, userTypeId);

    ELSE
        -- Handle the case when the type does not exist
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'User type does not exist';
    END IF;

END//

DELIMITER ;


CALL insertUser('admin', 'admin123@gmail.com');
