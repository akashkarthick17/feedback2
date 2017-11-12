-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: feedback
-- ------------------------------------------------------
-- Server version	5.7.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `fr_2018_odd`
--

DROP TABLE IF EXISTS `fr_2018_odd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fr_2018_odd` (
  `staff_name` varchar(45) DEFAULT NULL,
  `sub_name` varchar(45) DEFAULT NULL,
  `subject_code` varchar(25) DEFAULT NULL,
  `question_no` int(11) DEFAULT NULL,
  `question` longtext,
  `rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fr_2018_odd`
--

LOCK TABLES `fr_2018_odd` WRITE;
/*!40000 ALTER TABLE `fr_2018_odd` DISABLE KEYS */;
INSERT INTO `fr_2018_odd` VALUES ('STAFF1','CS6501','SUBJECT1',1,'The teacher is skilled and knowledge in the subject.',5),('STAFF1','CS6501','SUBJECT1',2,'The teacher is well prepared to handle the classes.',4),('STAFF1','CS6501','SUBJECT1',3,'The teacher teaches the fundamental concepts in the subject clearly.',3),('STAFF1','CS6501','SUBJECT1',4,'The written materials (E.g. Handouts, lecture notes etc.), black-board writing and other teaching aids (E.g. PPT, ohp, models etc.) are effective.',2),('STAFF1','CS6501','SUBJECT1',5,'The teachers voice is clear and audible.',1),('STAFF1','CS6501','SUBJECT1',6,'The teacher encourages class participation and interaction. ',5),('STAFF1','CS6501','SUBJECT1',7,'The teacher uses practical examples to explain the subject and teaches topics beyond syllabus.',4),('STAFF1','CS6501','SUBJECT1',8,' The teacher is punctual and uses the class time effectively.',3),('STAFF1','CS6501','SUBJECT1',9,'The test/exam evaluation by the teacher is fair and helps self-improvement.',5),('STAFF1','CS6501','SUBJECT1',10,'The teacher inspires the students to attain academic excellence.',4),('STAFF1','CS6501','SUBJECT1',1,'The teacher is skilled and knowledge in the subject.',4),('STAFF1','CS6501','SUBJECT1',2,'The teacher is well prepared to handle the classes.',4),('STAFF1','CS6501','SUBJECT1',3,'The teacher teaches the fundamental concepts in the subject clearly.',2),('STAFF1','CS6501','SUBJECT1',4,'The written materials (E.g. Handouts, lecture notes etc.), black-board writing and other teaching aids (E.g. PPT, ohp, models etc.) are effective.',1),('STAFF1','CS6501','SUBJECT1',5,'The teachers voice is clear and audible.',3),('STAFF1','CS6501','SUBJECT1',6,'The teacher encourages class participation and interaction. ',4),('STAFF1','CS6501','SUBJECT1',7,'The teacher uses practical examples to explain the subject and teaches topics beyond syllabus.',2),('STAFF1','CS6501','SUBJECT1',8,' The teacher is punctual and uses the class time effectively.',1),('STAFF1','CS6501','SUBJECT1',9,'The test/exam evaluation by the teacher is fair and helps self-improvement.',5),('STAFF1','CS6501','SUBJECT1',10,'The teacher inspires the students to attain academic excellence.',3),('STAFF11','CS6511','SUBJECT11',1,'The teacher is skilled and knowledge in the subject.',2),('STAFF11','CS6511','SUBJECT11',2,'The teacher is well prepared to handle the classes.',4),('STAFF11','CS6511','SUBJECT11',3,'The teacher teaches the fundamental concepts in the subject clearly.',1),('STAFF11','CS6511','SUBJECT11',4,'The written materials (E.g. Handouts, lecture notes etc.), black-board writing and other teaching aids (E.g. PPT, ohp, models etc.) are effective.',4),('STAFF11','CS6511','SUBJECT11',5,'The teachers voice is clear and audible.',5),('STAFF11','CS6511','SUBJECT11',6,'The teacher encourages class participation and interaction. ',2),('STAFF11','CS6511','SUBJECT11',7,'The teacher uses practical examples to explain the subject and teaches topics beyond syllabus.',3),('STAFF11','CS6511','SUBJECT11',8,' The teacher is punctual and uses the class time effectively.',2),('STAFF11','CS6511','SUBJECT11',9,'The test/exam evaluation by the teacher is fair and helps self-improvement.',4),('STAFF11','CS6511','SUBJECT11',10,'The teacher inspires the students to attain academic excellence.',3);
/*!40000 ALTER TABLE `fr_2018_odd` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-18 14:10:16
