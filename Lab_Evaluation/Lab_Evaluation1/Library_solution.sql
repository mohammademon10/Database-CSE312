-- Library database and tables
-- 1. Create database and use it
CREATE DATABASE IF NOT EXISTS `Library`;
USE `Library`;

-- Drop existing objects if present (safe to rerun)
DROP TABLE IF EXISTS `Member`;
DROP TABLE IF EXISTS `Librarian`;
DROP TABLE IF EXISTS `Branch`;

-- 2. Create Branch table (will rename to Uni_Branch below)
CREATE TABLE `Branch` (
  branch_id INT NOT NULL AUTO_INCREMENT,
  location VARCHAR(50) NOT NULL,
  PRIMARY KEY (branch_id),
  CHECK (location IN ('Rajshai', 'Dhaka', 'Khulna'))
) ENGINE=InnoDB;

-- 5. Modify the table name of Branch to Uni_Branch
ALTER TABLE `Branch` RENAME TO `Uni_Branch`;

-- 2. Librarian { lib_id (pk), lib_name, shift, branch_id (fk) }
CREATE TABLE `Librarian` (
  lib_id INT NOT NULL AUTO_INCREMENT,
  lib_name VARCHAR(100) NOT NULL,
  shift VARCHAR(50) NOT NULL,
  branch_id INT NOT NULL,
  PRIMARY KEY (lib_id),
  CONSTRAINT fk_librarian_branch FOREIGN KEY (branch_id)
    REFERENCES `Uni_Branch` (branch_id)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 3. Member { m_id (pk), m_name, membership_type(Student, Teacher, Admin), branch_id (fk), assigned_librarian (fk) }
CREATE TABLE `Member` (
  m_id INT NOT NULL AUTO_INCREMENT,
  m_name VARCHAR(100) NOT NULL,
  membership_type VARCHAR(20) NOT NULL,
  branch_id INT NOT NULL,
  assigned_librarian INT NOT NULL,
  PRIMARY KEY (m_id),
  CONSTRAINT chk_membership_type CHECK (membership_type IN ('Student','Teacher','Admin')),
  CONSTRAINT fk_member_branch FOREIGN KEY (branch_id)
    REFERENCES `Uni_Branch` (branch_id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_member_librarian FOREIGN KEY (assigned_librarian)
    REFERENCES `Librarian` (lib_id)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Sample inserts to validate constraints
INSERT INTO `Uni_Branch` (location) VALUES ('Rajshai'), ('Dhaka'), ('Khulna');

INSERT INTO `Librarian` (lib_name, shift, branch_id)
VALUES ('Alice Johnson', 'Morning', 1), ('Rahim Uddin', 'Evening', 2);

INSERT INTO `Member` (m_name, membership_type, branch_id, assigned_librarian)
VALUES ('John Doe', 'Student', 1, 1), ('Prof. Karim', 'Teacher', 2, 2);

-- Notes:
-- All primary key and foreign key fields are NOT NULL per requirement.
-- CHECK constraints enforce allowed values for `location` and `membership_type`.
-- If your SQL engine does not support CHECK enforcement (older MySQL versions),
-- you can use ENUM for membership_type or add triggers to enforce values.
