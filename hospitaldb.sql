-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 05, 2020 at 06:41 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospitaldb`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `aID` int(11) NOT NULL,
  `appointmentNo` int(11) NOT NULL,
  `sessionDate` date NOT NULL,
  `sessionTime` time NOT NULL,
  `status` tinyint(4) NOT NULL,
  `paymentStatus` tinyint(4) NOT NULL,
  `patientID` int(11) NOT NULL,
  `docID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`aID`, `appointmentNo`, `sessionDate`, `sessionTime`, `status`, `paymentStatus`, `patientID`, `docID`) VALUES
(2, 2012, '2020-04-22', '06:27:45', 1, 0, 1, 2),
(3, 2134, '2020-04-29', '16:44:22', 1, 1, 2, 3),
(4, 2013, '2020-04-30', '31:15:20', 1, 1, 3, 4),
(5, 2543, '2020-05-21', '29:16:10', 1, 1, 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `card`
--

CREATE TABLE `card` (
  `id` int(11) NOT NULL,
  `cardNo` char(16) NOT NULL,
  `paymentNo` int(11) DEFAULT NULL,
  `cardHolderName` varchar(50) NOT NULL,
  `expiryDate` date NOT NULL,
  `cvv` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `card`
--

INSERT INTO `card` (`id`, `cardNo`, `paymentNo`, `cardHolderName`, `expiryDate`, `cvv`) VALUES
(1, '1234567890123455', 41, 'geethmaKodikara', '2026-12-13', 234),
(2, '2938475612345679', 6, 'odara', '2025-12-12', 484);

-- --------------------------------------------------------

--
-- Table structure for table `docschedule`
--

CREATE TABLE `docschedule` (
  `ID` int(11) NOT NULL,
  `scheduleID` int(11) NOT NULL,
  `HospitalName` varchar(70) NOT NULL,
  `DoctorName` varchar(70) NOT NULL,
  `Speciality` varchar(70) NOT NULL,
  `Date` varchar(10) NOT NULL,
  `StartTime` varchar(8) NOT NULL,
  `EndTime` varchar(8) NOT NULL,
  `RoomNumber` int(5) NOT NULL,
  `Status` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `docschedule`
--

INSERT INTO `docschedule` (`ID`, `scheduleID`, `HospitalName`, `DoctorName`, `Speciality`, `Date`, `StartTime`, `EndTime`, `RoomNumber`, `Status`) VALUES
(1, 3, 'asd', 'asd', 'asd', '44', '123', '321', 676, 'Yes'),
(2, 4, 'eee', 'eee', 'arrr', '4343', '55', '43', 1, 'no');

-- --------------------------------------------------------

--
-- Table structure for table `doctorconfirmation`
--

CREATE TABLE `doctorconfirmation` (
  `ID` int(11) NOT NULL,
  `scheduleID` int(11) NOT NULL,
  `HospitalName` varchar(70) NOT NULL,
  `DoctorName` varchar(70) NOT NULL,
  `Speciality` varchar(70) NOT NULL,
  `Date` varchar(10) NOT NULL,
  `StartTime` varchar(8) NOT NULL,
  `EndTime` varchar(8) NOT NULL,
  `RoomNumber` int(5) NOT NULL,
  `Status` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctorconfirmation`
--

INSERT INTO `doctorconfirmation` (`ID`, `scheduleID`, `HospitalName`, `DoctorName`, `Speciality`, `Date`, `StartTime`, `EndTime`, `RoomNumber`, `Status`) VALUES
(2, 2, 'ad', 'nmfl', 'ajaj', '2002', '12.30', '6.30', 111, 'no'),
(8, 44, 'addas', 'asd', 'adasd', '33', '44', '55', 133, 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `doctorhospital`
--

CREATE TABLE `doctorhospital` (
  `ID` int(11) NOT NULL,
  `hospitalID` int(11) NOT NULL,
  `docID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `hospitalID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `phoneNo` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `code` varchar(10) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `hospitalFee` double(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`hospitalID`, `name`, `type`, `description`, `phoneNo`, `email`, `code`, `city`, `state`, `hospitalFee`) VALUES
(1, 'Asiri Hospital', 'Private', 'AsiriKandy', '0812506916', 'asirikandy@gmail.com', '2015', 'kandy', 'central', 850.00),
(2, 'kandy teaching hospital', 'government', 'kandy main hospital', '0819765432', 'kandyhospital@gmail.com', '2400', 'kandy', 'central province', 500.00),
(3, 'Suwasewana Hospital', 'Private', 'second biggest private hospital in kandy', '0812349765', 'suwasewana@gmail.com', '1340', 'kandy', 'central province', 2450.00),
(4, 'Mobile medicare hospital', 'private', 'dental hospital', '0815544332', 'mobilemedicare@gmail.com', '5467', 'kandy', 'central province', 1500.00);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `pID` int(11) NOT NULL,
  `pFname` varchar(50) NOT NULL,
  `pLname` varchar(50) NOT NULL,
  `pAge` int(11) NOT NULL,
  `pGender` varchar(12) NOT NULL,
  `pAddress` varchar(45) NOT NULL,
  `pContactNo` varchar(15) NOT NULL,
  `pNIC` varchar(12) NOT NULL,
  `pEmail` varchar(50) NOT NULL,
  `pUsername` varchar(50) NOT NULL,
  `pPassword` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`pID`, `pFname`, `pLname`, `pAge`, `pGender`, `pAddress`, `pContactNo`, `pNIC`, `pEmail`, `pUsername`, `pPassword`) VALUES
(1, 'geethma', 'kodikara', 23, 'female', 'peradeniya,kandy', '0812056916', '987832541V', 'geethma@gmail.com', 'geethma', 'geethma123'),
(2, 'Sachini', 'Tennakoon', 20, 'female', '50,Kandy', '0768954321', '997832541V', 'sachini@gmail.com', 'sachini', 'sachini123'),
(3, 'ridmi', 'weerakotuwa', 21, 'female', '350, kandy', '0712345678', '995643521V', 'ridmi@gmail.com', 'ridmi', 'ridmi123'),
(4, 'shainee', 'delwita', 23, 'female', '15, colombo', '0768954321', '977832541V', 'shainee@gmail.com', 'shainee', 'shainee123');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentNo` int(11) NOT NULL,
  `amount` float NOT NULL,
  `paymentType` varchar(20) NOT NULL,
  `activeStatus` char(1) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `appointmentID` int(11) DEFAULT NULL,
  `patientID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentNo`, `amount`, `paymentType`, `activeStatus`, `date`, `appointmentID`, `patientID`) VALUES
(6, 2100, 'Credit Card', 'T', '2020-04-18', 2, 2),
(41, 3000, 'Debit+Card', 'T', '2020-05-03', 3, 1),
(68, 3850, 'Debit Card', 'T', '2020-05-05', 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `registereddoctors`
--

CREATE TABLE `registereddoctors` (
  `docID` int(11) NOT NULL,
  `hospitalID` int(11) NOT NULL,
  `docName` varchar(50) DEFAULT NULL,
  `docEmail` varchar(30) DEFAULT NULL,
  `docAddress` varchar(100) DEFAULT NULL,
  `specialization` varchar(50) DEFAULT NULL,
  `workingTime` time DEFAULT NULL,
  `workingDays` varchar(100) DEFAULT NULL,
  `workingHospitals` varchar(100) DEFAULT NULL,
  `docFee` float DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `registereddoctors`
--

INSERT INTO `registereddoctors` (`docID`, `hospitalID`, `docName`, `docEmail`, `docAddress`, `specialization`, `workingTime`, `workingDays`, `workingHospitals`, `docFee`, `username`, `password`) VALUES
(2, 1, 'Dr Sanath Jayasooriya', 'sanath@gmail.com', '123,kings street,colombo', 'Psychology', '07:24:12', 'Monday', 'Asiri Hospital', 1250, 'sanath', 'sanath123'),
(3, 2, 'Nalaka Herath', 'nalaka@gmail.com', '205,Malabe', 'Psychology', '35:42:16', 'Sunday', 'kandy teaching hospital', 2500, 'nalaka', 'nalaka123'),
(4, 3, 'Prasanna Sumathipala', 'prasanna@gmail.com', '125, kollupitiya', 'Physiotherapist', '31:53:04', 'Wednesday', 'Suwasewana hospital', 1400, 'prasanna', 'prasanna123'),
(5, 4, 'J Aloysius', 'aloy@gmail.com', '3/B, Malabe', 'Neurology', '25:55:29', 'Thursday', 'Mobile medicare hospital', 700, 'aloy', 'aloy123');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `ID` int(11) NOT NULL,
  `scheduleID` int(6) NOT NULL,
  `HospitalID` varchar(5) NOT NULL,
  `HospitalName` varchar(70) NOT NULL,
  `DoctorID` varchar(5) NOT NULL,
  `DoctorName` varchar(70) NOT NULL,
  `Speciality` varchar(70) NOT NULL,
  `Date` varchar(10) NOT NULL,
  `StartTime` varchar(8) NOT NULL,
  `EndTime` varchar(8) NOT NULL,
  `RoomNumber` int(5) NOT NULL,
  `Status` char(3) NOT NULL DEFAULT 'NO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`ID`, `scheduleID`, `HospitalID`, `HospitalName`, `DoctorID`, `DoctorName`, `Speciality`, `Date`, `StartTime`, `EndTime`, `RoomNumber`, `Status`) VALUES
(3, 2, 'ASH10', 'ASIRI', 'ASP11', 'Nimal', 'Neuro', '2020/03/04', '6:50:am', '8.50:am', 12, 'N'),
(4, 3, 'DDH99', 'Durdans Hospital', 'MNS15', 'Mr.Isuru Udana', 'Dermatologists', '2020/02/01', '09:30:am', '11:30:am', 200, 'N'),
(6, 4, 'DHH99', 'Durdans Hospital', 'MNN15', 'Mr.Isuru Udana', 'Dermatologists', '2020/02/01', '09:30:am', '11:30:am', 150, 'N'),
(7, 5, 'GEN11', 'Genaral', 'KUS22', 'Mrs.Kushani Gamage', 'ENT sergent', '2020/03/22', '22:30', '01:30', 233, 'N'),
(8, 77, 'sds', 'sss', 'ss', 'ss', '', '0987', '9898', '77', 3, 'yes'),
(11, 6, 'da', 'asd', 'asd', 'aasd', 'asd', '2020-04-22', '01:59', '15:01', 34, 'N'),
(13, 7, 'dca', 'dvs', 'vsd', 'sfv', 'vsd', '2020-04-21', '01:28', '04:00', 45, 'YES');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`aID`),
  ADD KEY `patientID` (`patientID`);

--
-- Indexes for table `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `paymentNo_2` (`paymentNo`),
  ADD KEY `paymentNo` (`paymentNo`);

--
-- Indexes for table `docschedule`
--
ALTER TABLE `docschedule`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `scheduleID` (`scheduleID`);

--
-- Indexes for table `doctorconfirmation`
--
ALTER TABLE `doctorconfirmation`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `scheduleID` (`scheduleID`);

--
-- Indexes for table `doctorhospital`
--
ALTER TABLE `doctorhospital`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `hospitalID` (`hospitalID`),
  ADD UNIQUE KEY `docID` (`docID`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`hospitalID`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`pID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentNo`),
  ADD UNIQUE KEY `appointmentID_2` (`appointmentID`),
  ADD KEY `appointmentID` (`appointmentID`),
  ADD KEY `patientID` (`patientID`);

--
-- Indexes for table `registereddoctors`
--
ALTER TABLE `registereddoctors`
  ADD PRIMARY KEY (`docID`),
  ADD KEY `hospitalID` (`hospitalID`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `scheduleID` (`scheduleID`),
  ADD UNIQUE KEY `HospitalID` (`HospitalID`),
  ADD UNIQUE KEY `DoctorID` (`DoctorID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `aID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `card`
--
ALTER TABLE `card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `docschedule`
--
ALTER TABLE `docschedule`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `doctorconfirmation`
--
ALTER TABLE `doctorconfirmation`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `doctorhospital`
--
ALTER TABLE `doctorhospital`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hospital`
--
ALTER TABLE `hospital`
  MODIFY `hospitalID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `pID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `paymentNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `registereddoctors`
--
ALTER TABLE `registereddoctors`
  MODIFY `docID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`pID`);

--
-- Constraints for table `card`
--
ALTER TABLE `card`
  ADD CONSTRAINT `card_ibfk_1` FOREIGN KEY (`paymentNo`) REFERENCES `payment` (`paymentNo`);

--
-- Constraints for table `docschedule`
--
ALTER TABLE `docschedule`
  ADD CONSTRAINT `docschedule_ibfk_1` FOREIGN KEY (`scheduleID`) REFERENCES `schedule` (`ID`);

--
-- Constraints for table `doctorhospital`
--
ALTER TABLE `doctorhospital`
  ADD CONSTRAINT `doctorhospital_ibfk_1` FOREIGN KEY (`docID`) REFERENCES `registereddoctors` (`docID`),
  ADD CONSTRAINT `doctorhospital_ibfk_2` FOREIGN KEY (`hospitalID`) REFERENCES `hospital` (`hospitalID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`appointmentID`) REFERENCES `appointment` (`aID`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`patientID`) REFERENCES `patient` (`pID`);

--
-- Constraints for table `registereddoctors`
--
ALTER TABLE `registereddoctors`
  ADD CONSTRAINT `registereddoctors_ibfk_1` FOREIGN KEY (`hospitalID`) REFERENCES `hospital` (`hospitalID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
