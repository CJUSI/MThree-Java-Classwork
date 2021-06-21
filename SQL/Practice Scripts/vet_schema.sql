-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots (.. - without quotes).

CREATE TABLE doctor (
    doctorId INT  NOT NULL ,
    doctorName varchar(80)  NOT NULL ,
    specialisation varchar(80) NOT NULL ,
    dateJoined DATE  NOT NULL ,
    PRIMARY KEY (
        doctorId
    )
);

CREATE TABLE owner (
    ownerId INT  NOT NULL ,
    ownerName varchar(80)  NOT NULL ,
    ownerAdd varchar(80)  NOT NULL ,
    ownerPhone varchar(80)  NOT NULL ,
    emailAdd varchar(80)  NOT NULL ,
    PRIMARY KEY (
        ownerId
    )
);

CREATE TABLE pet (
    petId INT  NOT NULL ,
    petName varchar(80)  NOT NULL ,
    species varchar(80) NOT NULL ,
    birthDay DATE  NOT NULL ,
    vaccineR TINYINT(1)  NOT NULL ,
    ownerId INT  NOT NULL ,
    PRIMARY KEY (
        petId,ownerId
    )
);

CREATE TABLE doctor_owner (
    doctorId INT  NOT NULL ,
    ownerId INT  NOT NULL ,
    PRIMARY KEY (
        doctorId,ownerId
    )
);

CREATE TABLE doctor_pet (
    doctorId INT  NOT NULL ,
    petId INT  NOT NULL ,
    PRIMARY KEY (
        doctorId,petId
    )
);

CREATE TABLE pet_owner (
    petId INT  NOT NULL ,
    ownerId INT  NOT NULL ,
    PRIMARY KEY (
        petId,ownerId
    )
);

ALTER TABLE doctor_owner ADD CONSTRAINT fk_doctor_owner_doctorId FOREIGN KEY(doctorId)
REFERENCES doctor (doctorId);

ALTER TABLE doctor_owner ADD CONSTRAINT fk_doctor_owner_ownerId FOREIGN KEY(ownerId)
REFERENCES owner (ownerId);

ALTER TABLE doctor_pet ADD CONSTRAINT fk_doctor_pet_doctorId FOREIGN KEY(doctorId)
REFERENCES doctor (doctorId);

ALTER TABLE doctor_pet ADD CONSTRAINT fk_doctor_pet_petId FOREIGN KEY(petId)
REFERENCES pet (petId);

ALTER TABLE pet_owner ADD CONSTRAINT fk_pet_owner_petId FOREIGN KEY(petId)
REFERENCES pet (petId);

ALTER TABLE pet_owner ADD CONSTRAINT fk_pet_owner_ownerId FOREIGN KEY(ownerId)
REFERENCES owner (ownerId);

