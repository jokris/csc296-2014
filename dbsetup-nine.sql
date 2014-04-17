



-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'Event_Equipment'
-- 
-- ---

DROP TABLE IF EXISTS `Event_Equipment`;
		
CREATE TABLE `Event_Equipment` (
  `ReservationID` INTEGER NOT NULL AUTO_INCREMENT,
  `StartBlock48` INT(2) NOT NULL DEFAULT NULL,
  `EndBlock48` INT(2) NULL DEFAULT NULL,
  `EquipmentID` INTEGER NOT NULL,
  `UserID` INTEGER NOT NULL DEFAULT NULL,
  `EventID` INTEGER NOT NULL DEFAULT NULL,
  PRIMARY KEY (`ReservationID`),
KEY (`EquipmentID`, `StartBlock48`, `EndBlock48`)
);

-- ---
-- Table 'User'
-- 
-- ---

DROP TABLE IF EXISTS `User`;
		
CREATE TABLE `User` (
  `UserID` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `UserName` VARCHAR(50) NOT NULL,
  `Name` VARCHAR NOT NULL DEFAULT '200',
  `Email` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`UserID`)
);

-- ---
-- Table 'ServiceArea'
-- 
-- ---

DROP TABLE IF EXISTS `ServiceArea`;
		
CREATE TABLE `ServiceArea` (
  `AreaID` INTEGER NOT NULL AUTO_INCREMENT,
  `AreaName` VARCHAR(100) NOT NULL,
  `Description` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`AreaID`)
);

-- ---
-- Table 'Event'
-- 
-- ---

DROP TABLE IF EXISTS `Event`;
		
CREATE TABLE `Event` (
  `EventID` INTEGER NOT NULL AUTO_INCREMENT,
  `EventName` VARCHAR(100) NOT NULL DEFAULT 'NULL',
  `Description` MEDIUMTEXT NULL DEFAULT NULL,
  `StartDT` DATE NOT NULL DEFAULT 'NULL',
  `EndDT` DATE NULL DEFAULT NULL,
  `OwnerUserID` INTEGER NOT NULL,
  PRIMARY KEY (`EventID`)
);

-- ---
-- Table 'Roles'
-- 
-- ---

DROP TABLE IF EXISTS `Roles`;
		
CREATE TABLE `Roles` (
  `RoleID` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `RoleLevel` ENUM(Read,Write,Admin) NOT NULL,
  `AreaID` INTEGER NOT NULL,
  `RoleName` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`RoleID`)
);

-- ---
-- Table 'Equipment_Approvals'
-- 
-- ---

DROP TABLE IF EXISTS `Equipment_Approvals`;
		
CREATE TABLE `Equipment_Approvals` (
  `ApprovedDT` DATE NOT NULL,
  `Approved` bit NOT NULL DEFAULT false,
  `ApproverUserID` INTEGER NOT NULL,
  `Room_ReservationID` INTEGER NOT NULL,
  `Equipment_ApprovalID` INTEGER NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Equipment_ApprovalID`)
);

-- ---
-- Table 'Event_Staff'
-- 
-- ---

DROP TABLE IF EXISTS `Event_Staff`;
		
CREATE TABLE `Event_Staff` (
  `StartBlock48` INTEGER(2) NOT NULL,
  `EndBlock48` INTEGER(2) NOT NULL,
  `UserID` INTEGER NOT NULL DEFAULT NULL,
  `EventID_Event` INTEGER NOT NULL,
  PRIMARY KEY (`UserID`, `StartBlock48`, `EndBlock48`)
);

-- ---
-- Table 'Users_Roles'
-- 
-- ---

DROP TABLE IF EXISTS `Users_Roles`;
		
CREATE TABLE `Users_Roles` (
  `UserID` INTEGER NOT NULL,
  `RoleID` INTEGER NOT NULL,
  PRIMARY KEY (`UserID`, `RoleID`)
);

-- ---
-- Table 'Equipment'
-- 
-- ---

DROP TABLE IF EXISTS `Equipment`;
		
CREATE TABLE `Equipment` (
  `EquipmentID` INTEGER NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR NOT NULL,
  `Condition` ENUM(NEW,GOOD,NEEDS REPAIR) NULL DEFAULT NULL,
  `AcquiredDT` DATE NULL DEFAULT NULL,
  `AreaID` INTEGER NOT NULL,
  PRIMARY KEY (`EquipmentID`)
);

-- ---
-- Table 'User_Contact'
-- 
-- ---

DROP TABLE IF EXISTS `User_Contact`;
		
CREATE TABLE `User_Contact` (
  `Type` ENUM(Phone,Email,Address) NOT NULL,
  `Value` VARCHAR(200) NOT NULL,
  `UserID` INTEGER NOT NULL DEFAULT NULL,
  PRIMARY KEY (`Type`, `UserID`)
);

-- ---
-- Table 'Room'
-- 
-- ---

DROP TABLE IF EXISTS `Room`;
		
CREATE TABLE `Room` (
  `RoomID` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `Name` VARCHAR(100) NOT NULL,
  `Capacity` INTEGER NULL DEFAULT NULL,
  `Accessible` bit NOT NULL DEFAULT FALSE,
  `Building` VARCHAR(100) NULL DEFAULT NULL,
  `Audio` ENUM NOT NULL DEFAULT FALSE,
  `Video` ENUM NOT NULL DEFAULT FALSE,
  `AreaID` INTEGER NOT NULL,
  PRIMARY KEY (`RoomID`)
);

-- ---
-- Table 'Event_Room'
-- 
-- ---

DROP TABLE IF EXISTS `Event_Room`;
		
CREATE TABLE `Event_Room` (
  `ReservationID` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `RoomID` INTEGER NOT NULL DEFAULT NULL,
  `StartBlock48` INT(2) NOT NULL,
  `EndBlock48` INT NOT NULL,
  `EventID` INTEGER NOT NULL,
  `UserID` INTEGER NOT NULL,
  PRIMARY KEY (`ReservationID`),
KEY (`RoomID`, `StartBlock48`, `EndBlock48`)
);

-- ---
-- Table 'Room_Approvals'
-- 
-- ---

DROP TABLE IF EXISTS `Room_Approvals`;
		
CREATE TABLE `Room_Approvals` (
  `Room_ReservationID` INTEGER NOT NULL,
  `Room_ApprovalID` INTEGER NULL DEFAULT NULL,
  `Approved` bit NOT NULL DEFAULT false,
  `ApproverUserID` INTEGER NOT NULL DEFAULT NULL,
  `ApprovedDT` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`Room_ApprovalID`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `Event_Equipment` ADD FOREIGN KEY (EquipmentID) REFERENCES `Equipment` (`EquipmentID`);
ALTER TABLE `Event_Equipment` ADD FOREIGN KEY (UserID) REFERENCES `User` (`UserID`);
ALTER TABLE `Event_Equipment` ADD FOREIGN KEY (EventID) REFERENCES `Event` (`EventID`);
ALTER TABLE `Event` ADD FOREIGN KEY (OwnerUserID) REFERENCES `User` (`UserID`);
ALTER TABLE `Roles` ADD FOREIGN KEY (AreaID) REFERENCES `ServiceArea` (`AreaID`);
ALTER TABLE `Equipment_Approvals` ADD FOREIGN KEY (ApproverUserID) REFERENCES `User` (`UserID`);
ALTER TABLE `Equipment_Approvals` ADD FOREIGN KEY (Room_ReservationID) REFERENCES `Event_Equipment` (`ReservationID`);
ALTER TABLE `Event_Staff` ADD FOREIGN KEY (UserID) REFERENCES `User` (`UserID`);
ALTER TABLE `Event_Staff` ADD FOREIGN KEY (EventID_Event) REFERENCES `Event` (`EventID`);
ALTER TABLE `Users_Roles` ADD FOREIGN KEY (UserID) REFERENCES `User` (`UserID`);
ALTER TABLE `Users_Roles` ADD FOREIGN KEY (RoleID) REFERENCES `Roles` (`RoleID`);
ALTER TABLE `Equipment` ADD FOREIGN KEY (AreaID) REFERENCES `ServiceArea` (`AreaID`);
ALTER TABLE `User_Contact` ADD FOREIGN KEY (UserID) REFERENCES `User` (`UserID`);
ALTER TABLE `Room` ADD FOREIGN KEY (AreaID) REFERENCES `ServiceArea` (`AreaID`);
ALTER TABLE `Event_Room` ADD FOREIGN KEY (RoomID) REFERENCES `Room` (`RoomID`);
ALTER TABLE `Event_Room` ADD FOREIGN KEY (EventID) REFERENCES `Event` (`EventID`);
ALTER TABLE `Event_Room` ADD FOREIGN KEY (UserID) REFERENCES `User` (`UserID`);
ALTER TABLE `Room_Approvals` ADD FOREIGN KEY (Room_ReservationID) REFERENCES `Event_Room` (`ReservationID`);
ALTER TABLE `Room_Approvals` ADD FOREIGN KEY (ApproverUserID) REFERENCES `User` (`UserID`);

-- ---

