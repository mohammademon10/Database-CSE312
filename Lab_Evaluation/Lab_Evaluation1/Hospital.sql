------------------------------------------------------------------------------------------
-- Lab Evaluation 1: SQL DDL and DML Commands - Solution
-- Course: CSE 312 Database Management Systems
-- Author: GitHub Copilot (solution)
-------------------------------------------------------------------------------------------
-- 1. Create a database named `Hospital` and the following tables:
--    Doctor {d_id(pk), d_name, specialist, room_no(fk)}
--    Patient {p_id(pk), p_name, diagnosed_with, room_no(fk), assigned_doctor(fk)}
--    Room {room_no(pk), type(ward, cabin, vip cabin, doctor_chamber)}
-- NB: All fields that are keys or required are defined NOT NULL.



-- Create and use database
CREATE DATABASE Hospital;
USE Hospital;

-- Create Room table (room_no is primary key)
CREATE TABLE Room (
    room_no INT  NOT NULL PRIMARY KEY ,
    type ENUM('ward','cabin','vip cabin','doctor_chamber')
);

-- Create Doctor table
CREATE TABLE Doctor (
    d_id INT PRIMARY KEY NOT NULL,
    d_name VARCHAR(100) NOT NULL,
    specialist VARCHAR(100) NOT NULL,
    room_no INT NOT NULL,

   FOREIGN KEY (room_no) REFERENCES Room(room_no)
);

-- Create Patient table
CREATE TABLE Patient (
    p_id INT PRIMARY KEY NOT NULL,
    p_name VARCHAR(100) NOT NULL,
    diagnosed_with VARCHAR(255) NOT NULL,
    room_no INT NOT NULL,
    assigned_doctor INT NOT NULL,

    FOREIGN KEY (room_no) REFERENCES Room(room_no),
    FOREIGN KEY (assigned_doctor) REFERENCES Doctor(d_id)
);


SELECT * FROM Room;
SELECT * FROM Doctor;
SELECT * FROM Patient;


 ------------------------------------------------------------------------------------------
--2nd waye to create the same database and tables
 ------------------------------------------------------------------------------------------

-- Create and use database
CREATE DATABASE Hospital;
USE Hospital;

-- Create Doctor table
CREATE TABLE Doctor (
    d_id INT PRIMARY KEY NOT NULL,
    d_name VARCHAR(100) NOT NULL,
    specialist VARCHAR(100) NOT NULL,
    room_no INT NOT NULL

);

-- Create Patient table
CREATE TABLE Patient (
    p_id INT PRIMARY KEY NOT NULL,
    p_name VARCHAR(100) NOT NULL,
    diagnosed_with VARCHAR(255) NOT NULL,
    room_no INT NOT NULL,
    assigned_doctor INT NOT NULL

);

-- Create Room table (room_no is primary key)
CREATE TABLE Room (
    room_no INT  NOT NULL PRIMARY KEY ,
    type ENUM('ward','cabin','vip cabin','doctor_chamber')
);

-- Add foreign key constraints after table creation
ALTER TABLE Doctor
ADD FOREIGN KEY (room_no) REFERENCES Room(room_no);

ALTER TABLE Patient
ADD FOREIGN KEY (room_no) REFERENCES Room(room_no),
ADD FOREIGN KEY (assigned_doctor) REFERENCES Doctor(d_id);

------------------------------------------------------------------------------------------
