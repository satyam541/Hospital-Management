/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.14-MariaDB : Database - hospital_management
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hospital_management` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `hospital_management`;

/*Table structure for table `accountants` */

DROP TABLE IF EXISTS `accountants`;

CREATE TABLE `accountants` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `accountants` */

/*Table structure for table `appointments` */

DROP TABLE IF EXISTS `appointments`;

CREATE TABLE `appointments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` bigint(20) unsigned NOT NULL,
  `nurse_id` bigint(20) unsigned DEFAULT NULL,
  `doctor_id` bigint(20) unsigned NOT NULL,
  `intime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `outtime` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `appointments_patient_id_foreign` (`patient_id`),
  KEY `appointments_nurse_id_foreign` (`nurse_id`),
  KEY `appointments_doctor_id_foreign` (`doctor_id`),
  CONSTRAINT `appointments_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  CONSTRAINT `appointments_nurse_id_foreign` FOREIGN KEY (`nurse_id`) REFERENCES `nurses` (`id`),
  CONSTRAINT `appointments_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `appointments` */

/*Table structure for table `beds` */

DROP TABLE IF EXISTS `beds`;

CREATE TABLE `beds` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` bigint(20) unsigned NOT NULL,
  `patient_id` bigint(20) unsigned DEFAULT NULL,
  `alloted_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discharge_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `beds_room_id_foreign` (`room_id`),
  KEY `beds_patient_id_foreign` (`patient_id`),
  CONSTRAINT `beds_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`),
  CONSTRAINT `beds_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `beds` */

insert  into `beds`(`id`,`room_id`,`patient_id`,`alloted_time`,`discharge_time`,`created_at`,`updated_at`) values 
(1,2,NULL,NULL,NULL,'2022-11-16 09:27:45','2022-11-16 09:27:45'),
(2,2,NULL,NULL,NULL,'2022-11-16 09:27:45','2022-11-16 09:27:45'),
(3,3,NULL,NULL,NULL,'2022-11-16 09:27:45','2022-11-16 09:27:45'),
(4,4,NULL,NULL,NULL,'2022-11-16 09:27:45','2022-11-16 09:27:45'),
(5,5,NULL,NULL,NULL,'2022-11-16 09:27:45','2022-11-16 09:27:45');

/*Table structure for table `bills` */

DROP TABLE IF EXISTS `bills`;

CREATE TABLE `bills` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `patients_id` bigint(20) unsigned NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payed` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bills_patients_id_foreign` (`patients_id`),
  CONSTRAINT `bills_patients_id_foreign` FOREIGN KEY (`patients_id`) REFERENCES `patients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `bills` */

insert  into `bills`(`id`,`patients_id`,`amount`,`payed`,`created_at`,`updated_at`,`deleted_at`) values 
(1,5,'4037',0,'2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(2,5,'3885',1,'2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(3,2,'1169',1,'2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(4,1,'1874',0,'2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(5,3,'222',1,'2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(6,2,'917',1,'2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(7,3,'2587',0,'2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(8,2,'967',1,'2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(9,4,'1000',1,'2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(10,3,'3978',1,'2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(11,4,'692',0,'2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(12,4,'1194',0,'2022-11-16 09:27:45','2022-11-16 09:27:45',NULL);

/*Table structure for table `birthreports` */

DROP TABLE IF EXISTS `birthreports`;

CREATE TABLE `birthreports` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `patient` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `doctor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `birthreports` */

insert  into `birthreports`(`id`,`patient`,`description`,`doctor`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'ADdL9lX5uQ','OJJ50JaVcAsk2zEspmEpVwJAG0gZh2tI5BET6OFr','Bxm6FDIYJ1',NULL,NULL,NULL),
(2,'2C4PGYI9mn','IUrG0jTMcKInkMURH2UBEuJFq3UkM0DXu6cC9SMb','PSqEaQTmHg',NULL,NULL,NULL),
(3,'7Ix8eJx8GP','JfJQnVoTVoL9Jvslew0GaQZtGg6litOKRuGybr9f','np122K503V',NULL,NULL,NULL),
(4,'4gyB3LGos9','a7shiNdFxaMLaTdkOjw2MEhL5LwY97RXq4Gsp3F0','mapFvRpIxf',NULL,NULL,NULL),
(5,'lG4cSzSJ63','SPuR5oinUExWfsS2Jb5weUoaJPxXM6j2G8gjRBMc','WJlXhT1b2w',NULL,NULL,NULL),
(6,'MiqtmEBlyi','tqjF49HnvRDpCuFrUnwpUJETnLS967ELzqdMffO5','owtjmrP9Qd',NULL,NULL,NULL),
(7,'dpn6Wo7px9','CqTkouYCenehruOgKgUeuNL540JjaUAlpUPnfuEi','pBNiuaeSIA',NULL,NULL,NULL),
(8,'g2zc7mo80c','GJ1v10CluaY6XkTh5FiDYEqa0awxhz7ayCNWYbu7','ETrK4qyO1Q',NULL,NULL,NULL),
(9,'rW9HWk33td','kNfxmHyiVrNfZie3uut4j5hBXIFcj95CTILQXBSN','T9zNJoVjjr',NULL,NULL,NULL),
(10,'ZxGO669AZ5','t9NaqK7PqqSHNyZQPjgihIHC4yekr6VH8gpb7S8Q','OKXoQL7BLp',NULL,NULL,NULL),
(11,'MNheVrei2t','HgbVCxaUW3pO3ydyBkt00wVOXPTvR0cX9Tj1Tveu','2NLqhwvV38',NULL,NULL,NULL),
(12,'7KVkyFFETb','Rmg6TuDJ0hjgEnt4VTHOmzlgUnR422XuJZFwGtqe','ORXxNvctdL',NULL,NULL,NULL),
(13,'IlwtpQwC5C','4yYkbvjyv7UXgre7knzOvqXnVmck8R287dr4Xh6F','7fImNLQNUN',NULL,NULL,NULL),
(14,'rtEKgOTmtH','4V61wGXsLKPBgXiW2TPD3O4gcEoKeU6XbpquRKHJ','DXBal2Ikjl',NULL,NULL,NULL),
(15,'NaQU3xWOQS','oZVZ3ub3ScPJS2ga036hMu9LoUfleWoiui3AKLZQ','8eN8D407OK',NULL,NULL,NULL),
(16,'fHHQ2FFCXz','E7NRzLlP4yfirhuuuQlwGq46ZhAN0KsQCTQcjfOY','RvJ60XaPiz',NULL,NULL,NULL),
(17,'l8fSxHnBlT','WbvgHBXKGk9cQZRr61Lk6np0cxUkzmjmXCfqaloA','KYnBhSVQvd',NULL,NULL,NULL),
(18,'7AbYoCjeEx','A1m8kD8d9evsID70bsGKq1OQSq5742DrIoz3l2sA','DGReRlawJg',NULL,NULL,NULL),
(19,'5V6PtNTzYc','foSnTm40b9Au6a7S4xxfUms0E2ruS26Sael3HxkM','1FmQJcfrwZ',NULL,NULL,NULL),
(20,'1LtX9Tu2Jm','KQkisQKvMMkBr5BKCIPF3HND40mwMtlwb8vsOrt7','oBxRmX2UWt',NULL,NULL,NULL),
(21,'vO8fUMhv7C','EVNcqKkPAhkuHWAr3TTIEq0RI4yeSUSWiWgL5bgf','clCeQHZecE',NULL,NULL,NULL),
(22,'wSvxxotjrP','L5rzeYHFQGC9tb5Lrnjazb19DLbOW0eB4srJR2Hj','7h7CLkeaSr',NULL,NULL,NULL),
(23,'om08MiuKdN','507eeCY9YpRO03Av5GWGHvWRyrepCCG79MLfkeCg','I2swSckpmH',NULL,NULL,NULL),
(24,'sykavvHWbc','IMNfo1b5m7gvsfkdelwoO424K2cL8E5iCWNOD7Ee','3N8QkBZN1O',NULL,NULL,NULL),
(25,'ckaPVwMQgC','KVXxUMU6t3rqTI7iio9tPkYZdho1cdfmOkrZLkTp','bW4U2BavsK',NULL,NULL,NULL),
(26,'rl8mF8xEzt','ufuiwMqeRu6ZU5cXF7CwRrAAdbBjzIZzNCFz6JhS','2VUub5OXz6',NULL,NULL,NULL),
(27,'hh2mgGzOow','nsxIQzJHofDMDGcUSm3zfmTapIKCTVL5a1Z9JXC5','aOGF0PF6qy',NULL,NULL,NULL),
(28,'eaJLZfYg3Z','GBLq0COulVkXqdQFXCqCnoaNdR1b5YbOwYq57Z9t','ebQcISZ9Ha',NULL,NULL,NULL),
(29,'IJSd5y15DM','9unUQOgfxGRrWVFiGEsU0NYDqQTGWwHs19uV0yOP','qdyHbSidNt',NULL,NULL,NULL),
(30,'E4j4iylhrE','tD7B7Zuy8RmYAQsHSftlh07DUzIs7nM3AUc7j0u3','eArjwV758K',NULL,NULL,NULL),
(31,'X13D3khF2b','yCW4ta9QawulfK50fuZbeX98Ge1RCYPrGas7xDve','ulAWaSHL1i',NULL,NULL,NULL),
(32,'uPFeL3xeCR','6vYMVOBJneJJY0oN9AYPeBg5N5Rps5NfOamf8AUc','gbwXti4MyW',NULL,NULL,NULL),
(33,'ya4gGMKruu','hRvs3mYM8voK37l7qFtFfJsB6o5BOchSjcRvGSXk','48GeuOFG7k',NULL,NULL,NULL),
(34,'QqE7JpqqeP','i3A34phKjNc59n8pwCVYYoMwlHxhw4aaVsxx8n3e','N7jbvr6c0m',NULL,NULL,NULL),
(35,'WaEwyf6JKL','3EtZYlrdQ4JWZcU5pBjLqZHyDFjhwQH3rpjidkUM','g38E5FYyky',NULL,NULL,NULL),
(36,'xExJDcjEy6','kfnU8Qy8zIlb1QLGSsg6Uxub9eUYCVeSTsZ7d7Ys','Wj8PRi9Rp2',NULL,NULL,NULL),
(37,'6SYBQOJMdN','x0Qj7cK9jzh2c23gDFNSFloNESxLRDZKNDPiyQbp','EQRB8z6vCl',NULL,NULL,NULL),
(38,'4X2xAP7I1q','BaWwWCQa7o77EFC7B1qDNgDcWvCPEdYgzrDjDtjF','ogMihN2RTe',NULL,NULL,NULL),
(39,'4pixhvnsIp','UB8F35EQLvkrvOrs8TLzkfj2D64wkKq6h7eXpVG8','GWbi2uvNfr',NULL,NULL,NULL),
(40,'NKfmFCQ4ec','5IZAFKRcy5aAyJ2doQM1ck7Bqz8aFlyAcy8PXUz7','408mS2UY20',NULL,NULL,NULL),
(41,'ID47msRPuU','uX1s2IJRgflrE5Pu8a8yLwCtIeX3VDKZuZkAFvWq','5PkgrJ7Ldi',NULL,NULL,NULL),
(42,'uOlZELMncV','YfmGo1PU6P4jYgwBYXmPUtAN9FqNtTicJAE1GbAs','v4Gad9uYcE',NULL,NULL,NULL),
(43,'S4oqbTi1xU','l6fPn2rCBoR5Dvk83Q7nnkQXYmwAiRGoOmM0UeHu','Q0OM9acyAW',NULL,NULL,NULL),
(44,'4OmD8r5kFA','lq12DUZNNPlSX0aSVnDeTF1N3DeEqHyvOshazRwq','YZx99wZWiM',NULL,NULL,NULL),
(45,'jpUcE0XWuJ','rqoWsZtPuRSHNof1FgvpV5SX1iPpSyExXSZdOp56','1hKoxboBp1',NULL,NULL,NULL),
(46,'DF5oth96dS','JBjVr5ZzW1sIjcsju9UHayJu3pV8LKxSpHdrM5VC','52nkRs7XrB',NULL,NULL,NULL),
(47,'OxGbxQnz9C','bzsGTVGyAox9VxICq4nfCpIIqvgTLWNbxHC9sniC','8VX2wMCnzo',NULL,NULL,NULL),
(48,'IM0qR8klAd','CTmkuJzIx5uYkrdO75MD8msQkkC2I0gDZSB65816','labYNOewWJ',NULL,NULL,NULL),
(49,'J8KZLtlyPg','xrb3xxxQv2H2m6KI77quvlOHT0xBmVaaCsi29G5e','X2AMrfbmaJ',NULL,NULL,NULL),
(50,'XrFzGl384k','woWTrESrboATjKktjcI7Wxbs7YPMEZEdtg1ShWpK','PnIT6WZUHu',NULL,NULL,NULL),
(51,'O4QL1RmkgU','7AXsQDlL9Q5UaTprTty0cplXToxv6DCxZDbljeNI','Wqa0ZG5CCv',NULL,NULL,NULL),
(52,'hnvUcoSba7','tMblCWo6CLt6JAc7P2v5POFB2sjNYwsuImghA0Jv','3TZWQhtA6k',NULL,NULL,NULL),
(53,'ParP8Sa72C','lx5Ce5ZMOmCVgobmpm2mM2neGsFZchPdG73UFMdI','y7pgWn0bZ1',NULL,NULL,NULL),
(54,'DYnRaS7ppX','khIqGyuHwUK5bZdiW2EyKKmHUFrhZJtpvh2PzUdf','PybUSat5Cj',NULL,NULL,NULL),
(55,'9qcbYE4Cnw','1sLMxRHVxDIUmhDqSiU2X0sZ3avTqB5N9hYMyqAq','86saoEQQjS',NULL,NULL,NULL),
(56,'wsfb7gRlCm','oM2fxVjpKTh8Dbbv9djvj0R3cqC2TWq8JvbZUCR0','Z5cVPo6k5G',NULL,NULL,NULL),
(57,'PIIjorjILd','CtMhSiEaiHBH56AFsVnUceADMFlm1HEiigG3js9W','YA37Z6m1py',NULL,NULL,NULL),
(58,'eY4rwlAy1z','NuJVg2wwRETM6bKjKm8WC45MXKoK2PXNO9tnSh17','OlBDZgq2nj',NULL,NULL,NULL),
(59,'G9bKrGIRly','Kvbk3A0gj6fkl1hAQ9v2eILzmaSUjlQQ0lB1qORW','UhMyml1wkM',NULL,NULL,NULL),
(60,'l5uvzp6od3','uR6o0uK39hJ1IUYyuGZ2hsToOAI9nO7Ur6vHYFS3','rbfA1gUtNH',NULL,NULL,NULL),
(61,'3cPPSlSjBd','qlXjhw1FYhpB6qXqaxYxhzllFRckbHmH87zPGvHb','msNnHuoKHw',NULL,NULL,NULL),
(62,'SJfGQ6peZB','oLCWkMiurEB5eU7F7tgC54d7ghKQIjeEQshzPDNk','q6jefTxj6V',NULL,NULL,NULL),
(63,'uPDxXTeTSf','W99jMHZjJCYku8ZSQS1j91MXbp3VZnYQIw3lhHiB','lF2krpES8I',NULL,NULL,NULL),
(64,'3Xosp0Wi69','FQ0NC7fgjwygo8PrqOWw2cDa88JJCZSxVt6vcDx0','Z8PtZ26zf6',NULL,NULL,NULL),
(65,'xTm4IShc9A','R86L4c5NMbze0KBGbsKtxf5VPLNuT2iFR5hRYGhB','zYBJsvQ1jb',NULL,NULL,NULL),
(66,'sLf6wvTxK5','5kSQiIzRcLiGpEHKLOk7ktjvxnYTUEcuAaMf1mnf','5YJIgQhJJO',NULL,NULL,NULL),
(67,'erOoQJrcL4','3rqkFyM6SJNUTFg5qmWYMDqbSjzlLYl81gCMxXYq','xeHLMJE8Hp',NULL,NULL,NULL),
(68,'2B1FkIwjwq','6Jf7lJHt3VBiecMRaZLtJfiIt6uJwjGoc0YemOP4','jOV2UpR60F',NULL,NULL,NULL),
(69,'RdOC5fGMTn','FDVe2xKMupcqyOPDwtLW369S1qhnMRqkYKz563W2','A9FdcoZbXd',NULL,NULL,NULL),
(70,'pUady9QOp9','uLXjf3xsEK6vtPdU4oOEtngc9iXUltVKSvUCZS1u','EpfwMu3e9l',NULL,NULL,NULL),
(71,'2NWnc35Ok2','wogBHW3uDyALEwTj9zFZSuLgZJgOxeGWnrVERqDQ','7i4ixmw4rb',NULL,NULL,NULL),
(72,'RpuPbMgLwJ','nXIA3bxsV2LZhg12Ts6IaQbgbgm4LMdwfnU0M1Zp','txmVQf7kLh',NULL,NULL,NULL),
(73,'1q6DvHQMX2','WiiOFBUu475op2q7bO1enuUHt0nDqT4PqsfQoebi','bFIDhFTai4',NULL,NULL,NULL),
(74,'xERiMWliza','VqCObAH88CYlGPFr9hqpWzaV0Tp6NiQGrIeEbNoT','kawYWIPC6W',NULL,NULL,NULL),
(75,'oDar8xwtq2','3MTtzfHEvja2uREFAFhqXh27b9XdSIVwjvWD63G4','lmKXEa25wO',NULL,NULL,NULL),
(76,'ID68Pxed2h','ZC87r9O70072nJCm5y4GF0PPmNfnu3lg2bJTRAbG','t7ERwDFIyr',NULL,NULL,NULL),
(77,'EPiqiGKNLO','JqS0xa9Xk4cwiLeBTwLrc4h3A3qBOgNmAKFePJxf','Szrr6udi0M',NULL,NULL,NULL),
(78,'NWjNhKG52B','iQWT0cjlAwqE8NXACXLZ9y7n1ybmnD8TeP2C4me8','XH0K1w5iUS',NULL,NULL,NULL),
(79,'Zuk7okvZf8','61MUWVFRXxdih5SwqXfm68DnvxcW6N6rPGk1ztZH','56ICYGjuwL',NULL,NULL,NULL),
(80,'CWe4rHSWIG','U78WvBpXtvyCXfeXLC0rkbxm68R1OE74IFlvRPj9','JqqowVphtd',NULL,NULL,NULL),
(81,'G2N1tKHaHF','6w9Szndmct3qVQLLloqVh1eRpoBmaSsNFc2U7OAE','ylheBB0ms7',NULL,NULL,NULL),
(82,'GrvY2YKKQ7','5NsHVnMdE7McYs6QeBpyRLswb9nlR57Nv7QApexu','otwZ0FCvWS',NULL,NULL,NULL),
(83,'qtYXjBr1Eh','XqXLPOPVMsPLBkYIkKIisrlcMiQ6k0yRMvvFvAkH','59175FmZO0',NULL,NULL,NULL),
(84,'wl25uMxZgF','E8p6oxag8lSnxQkrIlLP2CD0yyCcgJLnQCMloiFq','vCD0VHJB89',NULL,NULL,NULL),
(85,'RtaiUrTPPN','dYYQ2aGP1qZuekPK1WtukryiMGxxSwpXx5AAksEL','eFpFGaEcUX',NULL,NULL,NULL),
(86,'cRsTlRNFIr','mh9o1chKtMIKlTwPT5nfMRPm9f1jydt0LVgoE20w','SLqWqxidqW',NULL,NULL,NULL),
(87,'vGf76kj2TF','zeLciWLNmPxhXYvbY8hIV9xbyeI5mwjbGId0IWA8','aq4KBwLVSD',NULL,NULL,NULL),
(88,'7bOKkrdGvC','oxKigoLwRxbgXRpEASUJIoEWH8pIWxN9XEQWp1fP','5OibPNQm9I',NULL,NULL,NULL),
(89,'56umWewcVu','KWBJeKjA9VHtyDXfJ5uBqwFMJHqui7MmijwSCJ8Q','AzFZcPciJG',NULL,NULL,NULL),
(90,'PnNQyBW8Pa','BJw6ZIiBjL12BNIR3Jf9dOho8w8yLc57wHR4WM99','A7WWvda5Wj',NULL,NULL,NULL),
(91,'qmzxM1IdhM','20jgpD3yzma4BfFktXg7mXlZCkGEvkYcM9VQ4DKC','3d6tlaMK5T',NULL,NULL,NULL),
(92,'VkMRGoSk1w','fsnGaY53JDeix6vLrhu724DJG9nLKF6pW9MSZtwg','Xf2j0MWl5U',NULL,NULL,NULL),
(93,'GxzBlPWyF1','0XBBW4i92AasZogsmiWe11vw4CVp7TmFwV5ubxtR','zjMNki4fQi',NULL,NULL,NULL),
(94,'cncIKOD5Cr','Jc8C44BDeiIXLXXLx1YobvWo4B1xEKWY5XhAriOM','bgySfAXNCY',NULL,NULL,NULL),
(95,'DAOP0LQMzk','vLyOjoqdhGSZ5YAuVEOBsh6yMJNbtGti178pLHOk','xzsdZXKpYF',NULL,NULL,NULL),
(96,'VF9LDsqV2E','CGzMquxZRuyAWlMoH5OLbdTWa84g8mbsjCruYLOV','OnikWrjMfq',NULL,NULL,NULL),
(97,'TUG0HQZNDa','6MbJpgBtcQp75lFzr79nKaQUvjfPFNtNRuDEt46C','hM0BHoxEeK',NULL,NULL,NULL),
(98,'eSdrsIWoNl','rkn8CUAQCj9GVMzdZ04gmrjp7ySzUwO0uU5vfY9g','bp0sjyDXyZ',NULL,NULL,NULL),
(99,'JxTiqZm2Sj','16DI9IiY5l4pxNt3ysdX6IeWkrokmkcg2Z51UkWI','v26k5OnxMx',NULL,NULL,NULL),
(100,'09oqy73Ere','2FLn6GSoESkveozfAXAgzQv88JKvdsfjgmIij64U','S9aVRMUTdZ',NULL,NULL,NULL);

/*Table structure for table `blocks` */

DROP TABLE IF EXISTS `blocks`;

CREATE TABLE `blocks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `blockfloor` int(10) unsigned NOT NULL,
  `blockcode` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `blocks` */

insert  into `blocks`(`id`,`blockfloor`,`blockcode`,`created_at`,`updated_at`,`deleted_at`) values 
(1,3,298,'2022-11-16 09:27:43','2022-11-16 09:27:43',NULL),
(2,2,494,'2022-11-16 09:27:43','2022-11-16 09:27:43',NULL),
(3,8,133,'2022-11-16 09:27:43','2022-11-16 09:27:43',NULL),
(4,3,367,'2022-11-16 09:27:43','2022-11-16 09:27:43',NULL),
(5,1,397,'2022-11-16 09:27:43','2022-11-16 09:27:43',NULL);

/*Table structure for table `contacts` */

DROP TABLE IF EXISTS `contacts`;

CREATE TABLE `contacts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `contacts` */

insert  into `contacts`(`id`,`name`,`email`,`phone`,`subject`,`message`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'mr-Name0baba','randEmail0@test.com','+923988545207','test subject-0','a simple test message from users . message number 0','2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(2,'mr-Name1baba','randEmail1@test.com','+923884682894','test subject-1','a simple test message from users . message number 1','2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(3,'mr-Name2baba','randEmail2@test.com','+923617520495','test subject-2','a simple test message from users . message number 2','2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(4,'mr-Name3baba','randEmail3@test.com','+923651951203','test subject-3','a simple test message from users . message number 3','2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(5,'mr-Name4baba','randEmail4@test.com','+923648402768','test subject-4','a simple test message from users . message number 4','2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(6,'mr-Name5baba','randEmail5@test.com','+923295153708','test subject-5','a simple test message from users . message number 5','2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(7,'mr-Name6baba','randEmail6@test.com','+923482410071','test subject-6','a simple test message from users . message number 6','2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(8,'mr-Name7baba','randEmail7@test.com','+923824110816','test subject-7','a simple test message from users . message number 7','2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(9,'mr-Name8baba','randEmail8@test.com','+923512810786','test subject-8','a simple test message from users . message number 8','2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(10,'mr-Name9baba','randEmail9@test.com','+923356431791','test subject-9','a simple test message from users . message number 9','2022-11-16 09:27:45','2022-11-16 09:27:45',NULL);

/*Table structure for table `departments` */

DROP TABLE IF EXISTS `departments`;

CREATE TABLE `departments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hod_id` bigint(20) unsigned NOT NULL,
  `block_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `departments` */

insert  into `departments`(`id`,`name`,`description`,`photo_path`,`hod_id`,`block_id`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'Department 0','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Porro, provident\'.0.\'. ','http://127.0.0.1:8000/images/department.jpg',1,3,'2022-11-16 09:27:43','2022-11-16 09:27:43',NULL),
(2,'Department 1','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Porro, provident\'.1.\'. ','http://127.0.0.1:8000/images/department.jpg',5,3,'2022-11-16 09:27:43','2022-11-16 09:27:43',NULL),
(3,'Department 2','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Porro, provident\'.2.\'. ','http://127.0.0.1:8000/images/department.jpg',2,0,'2022-11-16 09:27:43','2022-11-16 09:27:43',NULL),
(4,'Department 3','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Porro, provident\'.3.\'. ','http://127.0.0.1:8000/images/department.jpg',1,3,'2022-11-16 09:27:43','2022-11-16 09:27:43',NULL),
(5,'Department 4','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Porro, provident\'.4.\'. ','http://127.0.0.1:8000/images/department.jpg',1,3,'2022-11-16 09:27:43','2022-11-16 09:27:43',NULL);

/*Table structure for table `doctors` */

DROP TABLE IF EXISTS `doctors`;

CREATE TABLE `doctors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `specialization` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `doctors` */

insert  into `doctors`(`id`,`name`,`email`,`password`,`address`,`phone`,`department`,`specialization`,`photo_path`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'tauseed0zamana','example0@test.me','$2y$10$0ZxKc2uuLrE32/7ngFIAW.lKq36ACgGddPagMdW5VpgJxNN1MPOVW','sorana 0 steet','+92123456789','1','\'.0+1.\'MBBS \'.0.\'','http://127.0.0.1:8000/images/doctor_01.jpg','2022-11-16 09:27:43','2022-11-16 09:27:43',NULL),
(2,'tauseed1zamana','example1@test.me','$2y$10$u/cQUL3kZyR/JlGQa8u0.eqrun6n7X68s73I57yUI6PtqvZO.m8Z2','sorana 1 steet','+92123456789','1','\'.1+1.\'MBBS \'.1.\'','http://127.0.0.1:8000/images/doctor_01.jpg','2022-11-16 09:27:43','2022-11-16 09:27:43',NULL),
(3,'tauseed2zamana','example2@test.me','$2y$10$RczI753Y9Q43S9eaqjAHdeGDFvWwCE2umEKQhxEvOeJ86OL.Rjoz6','sorana 2 steet','+92123456789','2','\'.2+1.\'MBBS \'.2.\'','http://127.0.0.1:8000/images/doctor_01.jpg','2022-11-16 09:27:44','2022-11-16 09:27:44',NULL),
(4,'tauseed3zamana','example3@test.me','$2y$10$Usll6bUoWuEMH1FtFglf9.G7cd2Ti5K.2nFlnm5tF/VV1F2lXw24C','sorana 3 steet','+92123456789','5','\'.3+1.\'MBBS \'.3.\'','http://127.0.0.1:8000/images/doctor_01.jpg','2022-11-16 09:27:44','2022-11-16 09:27:44',NULL),
(5,'tauseed4zamana','example4@test.me','$2y$10$pBadZSaseyuEhMzobTtAgelOj7NepPUniGWD6PpiCqaLLVLKECB5a','sorana 4 steet','+92123456789','2','\'.4+1.\'MBBS \'.4.\'','http://127.0.0.1:8000/images/doctor_01.jpg','2022-11-16 09:27:44','2022-11-16 09:27:44',NULL),
(6,'tauseed5zamana','example5@test.me','$2y$10$NR8qVUrjwWQprnMjGWiShOTBlZPZmBreaVBV3Edm9ggwBPOz5/YpO','sorana 5 steet','+92123456789','2','\'.5+1.\'MBBS \'.5.\'','http://127.0.0.1:8000/images/doctor_01.jpg','2022-11-16 09:27:44','2022-11-16 09:27:44',NULL),
(7,'tauseed6zamana','example6@test.me','$2y$10$nZyp/8scu4Wk1b1ezX6ETuRj9KI8TlLxdT7xYVNI6ZqFoHCuBNrFm','sorana 6 steet','+92123456789','4','\'.6+1.\'MBBS \'.6.\'','http://127.0.0.1:8000/images/doctor_01.jpg','2022-11-16 09:27:44','2022-11-16 09:27:44',NULL),
(8,'tauseed7zamana','example7@test.me','$2y$10$QkxhLxF16hB76RwfVF8Phu4pqgr0rcqujTKYZj9vDka4/6cfSerqa','sorana 7 steet','+92123456789','3','\'.7+1.\'MBBS \'.7.\'','http://127.0.0.1:8000/images/doctor_01.jpg','2022-11-16 09:27:44','2022-11-16 09:27:44',NULL),
(9,'tauseed8zamana','example8@test.me','$2y$10$3.3hQtj8DphUV5Ev/AIkmu.Zsrnk1liM46d3NWz4wWS5wMrQ1SnUW','sorana 8 steet','+92123456789','2','\'.8+1.\'MBBS \'.8.\'','http://127.0.0.1:8000/images/doctor_01.jpg','2022-11-16 09:27:44','2022-11-16 09:27:44',NULL),
(10,'tauseed9zamana','example9@test.me','$2y$10$vuR/Wr8UJ6F.P2eFUMdihOYh.CkxP56LRDXJwmM0Jf0.76lbh6Jw6','sorana 9 steet','+92123456789','2','\'.9+1.\'MBBS \'.9.\'','http://127.0.0.1:8000/images/doctor_01.jpg','2022-11-16 09:27:44','2022-11-16 09:27:44',NULL),
(11,'tauseed10zamana','example10@test.me','$2y$10$ElRE8CeaCSgnvyV3xmpgn.HrgxW/G5fokvBhKByorC9TWfcVSjhJO','sorana 10 steet','+92123456789','1','\'.10+1.\'MBBS \'.10.\'','http://127.0.0.1:8000/images/doctor_01.jpg','2022-11-16 09:27:44','2022-11-16 09:27:44',NULL),
(12,'tauseed11zamana','example11@test.me','$2y$10$Mz7oqCdvQKLvqVz4LDPiouYpbfP6jxXvBwMvABcPW5/CeiP6LGY7O','sorana 11 steet','+92123456789','2','\'.11+1.\'MBBS \'.11.\'','http://127.0.0.1:8000/images/doctor_01.jpg','2022-11-16 09:27:44','2022-11-16 09:27:44',NULL),
(13,'tauseed12zamana','example12@test.me','$2y$10$hItf8x.YDyyTe82t22Ket.oeMXDHpce6.wKmF0ZpPkJwfvLwbO4LO','sorana 12 steet','+92123456789','5','\'.12+1.\'MBBS \'.12.\'','http://127.0.0.1:8000/images/doctor_01.jpg','2022-11-16 09:27:44','2022-11-16 09:27:44',NULL),
(14,'tauseed13zamana','example13@test.me','$2y$10$e010Dc9iKUh1TgRCdD5rfOQCNSlXYeNJVkj1iSRXnfQbCreMuB4YC','sorana 13 steet','+92123456789','2','\'.13+1.\'MBBS \'.13.\'','http://127.0.0.1:8000/images/doctor_01.jpg','2022-11-16 09:27:44','2022-11-16 09:27:44',NULL),
(15,'tauseed14zamana','example14@test.me','$2y$10$JoyQ4lwUo7PczYRgZPyzbeMSZKE3P3dwySrV9m.jxycbsgemChIqC','sorana 14 steet','+92123456789','1','\'.14+1.\'MBBS \'.14.\'','http://127.0.0.1:8000/images/doctor_01.jpg','2022-11-16 09:27:44','2022-11-16 09:27:44',NULL),
(16,'tauseed15zamana','example15@test.me','$2y$10$Be5LjSBdGjZgh97s0jC.aOrpzWCBb18nygyJC3xRdZwmf0VgWBrZK','sorana 15 steet','+92123456789','2','\'.15+1.\'MBBS \'.15.\'','http://127.0.0.1:8000/images/doctor_01.jpg','2022-11-16 09:27:44','2022-11-16 09:27:44',NULL),
(17,'tauseed16zamana','example16@test.me','$2y$10$//Ft64XnvWSbgpnrPW.EDuV6huRfhbWDZ0uMqRMnYNm6ixSOUFxYq','sorana 16 steet','+92123456789','1','\'.16+1.\'MBBS \'.16.\'','http://127.0.0.1:8000/images/doctor_01.jpg','2022-11-16 09:27:44','2022-11-16 09:27:44',NULL),
(18,'tauseed17zamana','example17@test.me','$2y$10$S.n9oo3NgIE2C3Owg/.xyuA9s77kjT/fOg1gATKvgaNMsmR5.w4xK','sorana 17 steet','+92123456789','5','\'.17+1.\'MBBS \'.17.\'','http://127.0.0.1:8000/images/doctor_01.jpg','2022-11-16 09:27:44','2022-11-16 09:27:44',NULL),
(19,'tauseed18zamana','example18@test.me','$2y$10$ezj/.HxJ9sx25vIFkjNA9OvDSmo73PFRcSKcEGSinvSgKn1KRznaW','sorana 18 steet','+92123456789','3','\'.18+1.\'MBBS \'.18.\'','http://127.0.0.1:8000/images/doctor_01.jpg','2022-11-16 09:27:44','2022-11-16 09:27:44',NULL),
(20,'tauseed19zamana','example19@test.me','$2y$10$7w99jPnZasM2ZM/RH0piFuxEpP6MzCfmblckKlKTbn3CaQ8ciCqf2','sorana 19 steet','+92123456789','1','\'.19+1.\'MBBS \'.19.\'','http://127.0.0.1:8000/images/doctor_01.jpg','2022-11-16 09:27:44','2022-11-16 09:27:44',NULL);

/*Table structure for table `employees` */

DROP TABLE IF EXISTS `employees`;

CREATE TABLE `employees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `employees` */

insert  into `employees`(`id`,`name`,`email`,`phone`,`address`,`gender`,`job`,`salary`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'Employee-0','employee0@test.me','+923059358923','G8 street 0Islamabad pakistan','Male','Nurse','20000','2022-11-16 09:27:43','2022-11-16 09:27:43',NULL),
(2,'Employee-1','employee1@test.me','+923623898671','G8 street 1Islamabad pakistan','Female','Store Man','12000','2022-11-16 09:27:43','2022-11-16 09:27:43',NULL),
(3,'Employee-2','employee2@test.me','+923670731681','G8 street 2Islamabad pakistan','Female','Nurse','20000','2022-11-16 09:27:43','2022-11-16 09:27:43',NULL),
(4,'Employee-3','employee3@test.me','+923660320788','G8 street 3Islamabad pakistan','Female','Doctor','10000','2022-11-16 09:27:43','2022-11-16 09:27:43',NULL),
(5,'Employee-4','employee4@test.me','+923316550648','G8 street 4Islamabad pakistan','Female','Store Man','50000','2022-11-16 09:27:43','2022-11-16 09:27:43',NULL);

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `general_settings` */

DROP TABLE IF EXISTS `general_settings`;

CREATE TABLE `general_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `favicon_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_logo_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `working_horse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `general_settings` */

/*Table structure for table `hods` */

DROP TABLE IF EXISTS `hods`;

CREATE TABLE `hods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `doctor_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `hods` */

insert  into `hods`(`id`,`doctor_id`,`created_at`,`updated_at`) values 
(1,1,'2022-11-16 09:27:43','2022-11-16 09:27:43'),
(2,2,'2022-11-16 09:27:43','2022-11-16 09:27:43');

/*Table structure for table `laboratorists` */

DROP TABLE IF EXISTS `laboratorists`;

CREATE TABLE `laboratorists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `laboratorists` */

/*Table structure for table `medicines` */

DROP TABLE IF EXISTS `medicines`;

CREATE TABLE `medicines` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `medicines` */

insert  into `medicines`(`id`,`price`,`quantity`,`code`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'1257','26','12345DFG','2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(2,'2800','23','12345DFG','2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(3,'3583','35','12345DFG','2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(4,'141','19','12345DFG','2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(5,'901','36','12345DFG','2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(6,'3759','48','12345DFG','2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(7,'3118','31','12345DFG','2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(8,'264','47','12345DFG','2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(9,'4550','32','12345DFG','2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(10,'2645','44','12345DFG','2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(11,'1872','7','12345DFG','2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(12,'3930','9','12345DFG','2022-11-16 09:27:45','2022-11-16 09:27:45',NULL);

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2021_04_15_121020_create_nurses_table',1),
(5,'2021_04_15_121116_create_accountants_table',1),
(6,'2021_04_15_121139_create_patients_table',1),
(7,'2021_04_15_121200_create_pharmacists_table',1),
(8,'2021_04_15_121225_create_laboratorists_table',1),
(9,'2021_04_15_121316_create_departments_table',1),
(10,'2021_04_15_121327_create_rooms_table',1),
(11,'2021_04_15_121345_create_bills_table',1),
(12,'2021_04_15_121814_create_beds_table',1),
(13,'2021_04_15_121832_create_payments_table',1),
(14,'2021_04_16_151056_create_general_settings_table',1),
(15,'2021_04_18_170212_create_birthreports_table',1),
(16,'2021_04_18_170447_create_operationreports_table',1),
(17,'2021_04_19_065533_create_records_table',1),
(18,'2021_04_19_070537_create_employees_table',1),
(19,'2021_04_19_071309_create_medicines_table',1),
(20,'2021_05_06_051620_create_doctors_table',1),
(21,'2021_05_09_092124_create_patient_checkups_table',1),
(22,'2021_05_28_021243_create_stays_table',1),
(23,'2021_05_28_022310_create_blocks_table',1),
(24,'2021_05_28_022900_create_appointments_table',1),
(25,'2021_05_29_024419_create_requested_appointments_table',1),
(26,'2021_05_29_063531_create_hods_table',1),
(27,'2021_05_30_073236_create_subscribers_table',1),
(28,'2021_05_31_092459_create_contacts_table',1);

/*Table structure for table `nurses` */

DROP TABLE IF EXISTS `nurses`;

CREATE TABLE `nurses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qualification` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `registered` tinyint(1) NOT NULL,
  `photo_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `nurses` */

insert  into `nurses`(`id`,`name`,`email`,`phone`,`gender`,`address`,`qualification`,`position`,`registered`,`photo_path`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'Nurse-0','nurse0@gmail.com','+923889316534','Male','G8 street 0Islamabad pakistan','Bla','blabla',1,'http://127.0.0.1:8000/images/nurse.png','2022-11-16 09:27:44','2022-11-16 09:27:44',NULL),
(2,'Nurse-1','nurse1@gmail.com','+923456518327','Male','G8 street 1Islamabad pakistan','BSN','blabla',1,'http://127.0.0.1:8000/images/nurse.png','2022-11-16 09:27:44','2022-11-16 09:27:44',NULL),
(3,'Nurse-2','nurse2@gmail.com','+923539393012','Male','G8 street 2Islamabad pakistan','BSN','Side Room',1,'http://127.0.0.1:8000/images/nurse.png','2022-11-16 09:27:44','2022-11-16 09:27:44',NULL),
(4,'Nurse-3','nurse3@gmail.com','+923133335435','Male','G8 street 3Islamabad pakistan','BSN','Side Room',0,'http://127.0.0.1:8000/images/nurse.png','2022-11-16 09:27:44','2022-11-16 09:27:44',NULL),
(5,'Nurse-4','nurse4@gmail.com','+923814478910','Male','G8 street 4Islamabad pakistan','BSN','blaa',1,'http://127.0.0.1:8000/images/nurse.png','2022-11-16 09:27:44','2022-11-16 09:27:44',NULL);

/*Table structure for table `operationreports` */

DROP TABLE IF EXISTS `operationreports`;

CREATE TABLE `operationreports` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `patient` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `doctor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `operationreports` */

insert  into `operationreports`(`id`,`patient`,`description`,`doctor`,`time`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'HsY3I3rBxb','DPXFHcFNlnp8X7tHClEs','DPx4KUAavD','5:26:32 AM',NULL,NULL,NULL),
(2,'CUAoNSydoB','j5WanFOPCEBNKLnmV9Qt','cRcjpZdpiW','3:39:54 AM',NULL,NULL,NULL),
(3,'ryq0jN1KGM','ZaLC5fPZKDjkzJPe3bK9','Xq2m5D869j','10:30:54 AM',NULL,NULL,NULL),
(4,'TWdgHNtBrJ','fr014MNGo3EjvI9yWTvj','ls48RaTVP0','4:11:51 AM',NULL,NULL,NULL),
(5,'1wwUSqwTXQ','95t3ENVDuujqRWptZcsa','Y8sSZ4xfrk','12:6:21 AM',NULL,NULL,NULL);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `patient_checkups` */

DROP TABLE IF EXISTS `patient_checkups`;

CREATE TABLE `patient_checkups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `patient_checkups` */

/*Table structure for table `patients` */

DROP TABLE IF EXISTS `patients`;

CREATE TABLE `patients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bloodgroup` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `patients` */

insert  into `patients`(`id`,`name`,`email`,`phone`,`address`,`gender`,`age`,`bloodgroup`,`photo_path`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'tauseed0 zamana','example0@test.me','+92123456789','sorana0','Female','18','B-','patient.png','2022-11-16 09:27:43','2022-11-16 09:27:43',NULL),
(2,'tauseed1 zamana','example1@test.me','+92123456789','sorana1','Female','10','B+','patient.png','2022-11-16 09:27:43','2022-11-16 09:27:43',NULL),
(3,'tauseed2 zamana','example2@test.me','+92123456789','sorana2','Female','112','AB','patient.png','2022-11-16 09:27:43','2022-11-16 09:27:43',NULL),
(4,'tauseed3 zamana','example3@test.me','+92123456789','sorana3','Female','94','AB','patient.png','2022-11-16 09:27:43','2022-11-16 09:27:43',NULL),
(5,'tauseed4 zamana','example4@test.me','+92123456789','sorana4','Female','16','AB','patient.png','2022-11-16 09:27:43','2022-11-16 09:27:43',NULL),
(6,'tauseed5 zamana','example5@test.me','+92123456789','sorana5','Female','37','B+','patient.png','2022-11-16 09:27:43','2022-11-16 09:27:43',NULL),
(7,'tauseed6 zamana','example6@test.me','+92123456789','sorana6','Female','111','B-','patient.png','2022-11-16 09:27:43','2022-11-16 09:27:43',NULL),
(8,'tauseed7 zamana','example7@test.me','+92123456789','sorana7','Female','84','B-','patient.png','2022-11-16 09:27:43','2022-11-16 09:27:43',NULL),
(9,'tauseed8 zamana','example8@test.me','+92123456789','sorana8','Female','53','B-','patient.png','2022-11-16 09:27:43','2022-11-16 09:27:43',NULL),
(10,'tauseed9 zamana','example9@test.me','+92123456789','sorana9','Female','52','B-','patient.png','2022-11-16 09:27:43','2022-11-16 09:27:43',NULL),
(11,'tauseed10 zamana','example10@test.me','+92123456789','sorana10','Female','38','B-','patient.png','2022-11-16 09:27:43','2022-11-16 09:27:43',NULL),
(12,'tauseed11 zamana','example11@test.me','+92123456789','sorana11','Female','7','A+','patient.png','2022-11-16 09:27:43','2022-11-16 09:27:43',NULL),
(13,'tauseed12 zamana','example12@test.me','+92123456789','sorana12','Female','109','B+','patient.png','2022-11-16 09:27:43','2022-11-16 09:27:43',NULL),
(14,'tauseed13 zamana','example13@test.me','+92123456789','sorana13','Female','83','AB','patient.png','2022-11-16 09:27:43','2022-11-16 09:27:43',NULL),
(15,'tauseed14 zamana','example14@test.me','+92123456789','sorana14','Female','24','A+','patient.png','2022-11-16 09:27:43','2022-11-16 09:27:43',NULL),
(16,'tauseed15 zamana','example15@test.me','+92123456789','sorana15','Female','98','A+','patient.png','2022-11-16 09:27:43','2022-11-16 09:27:43',NULL),
(17,'tauseed16 zamana','example16@test.me','+92123456789','sorana16','Female','104','A-','patient.png','2022-11-16 09:27:43','2022-11-16 09:27:43',NULL),
(18,'tauseed17 zamana','example17@test.me','+92123456789','sorana17','Female','37','AB','patient.png','2022-11-16 09:27:43','2022-11-16 09:27:43',NULL),
(19,'tauseed18 zamana','example18@test.me','+92123456789','sorana18','Female','94','B-','patient.png','2022-11-16 09:27:43','2022-11-16 09:27:43',NULL),
(20,'tauseed19 zamana','example19@test.me','+92123456789','sorana19','Female','5','B+','patient.png','2022-11-16 09:27:43','2022-11-16 09:27:43',NULL);

/*Table structure for table `payments` */

DROP TABLE IF EXISTS `payments`;

CREATE TABLE `payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `payments` */

/*Table structure for table `pharmacists` */

DROP TABLE IF EXISTS `pharmacists`;

CREATE TABLE `pharmacists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `pharmacists` */

/*Table structure for table `records` */

DROP TABLE IF EXISTS `records`;

CREATE TABLE `records` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `patients_id` bigint(20) unsigned NOT NULL,
  `appointment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `records` */

/*Table structure for table `requested_appointments` */

DROP TABLE IF EXISTS `requested_appointments`;

CREATE TABLE `requested_appointments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `phone` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `doctor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(600) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `stime` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `requested_appointments` */

/*Table structure for table `rooms` */

DROP TABLE IF EXISTS `rooms`;

CREATE TABLE `rooms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `department_id` bigint(20) unsigned NOT NULL,
  `roomtype` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `available` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rooms_department_id_foreign` (`department_id`),
  CONSTRAINT `rooms_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `rooms` */

insert  into `rooms`(`id`,`department_id`,`roomtype`,`available`,`created_at`,`updated_at`,`deleted_at`) values 
(1,5,'example room type 0',0,'2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(2,3,'example room type 1',1,'2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(3,2,'example room type 2',1,'2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(4,2,'example room type 3',0,'2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(5,1,'example room type 4',0,'2022-11-16 09:27:45','2022-11-16 09:27:45',NULL);

/*Table structure for table `stays` */

DROP TABLE IF EXISTS `stays`;

CREATE TABLE `stays` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` bigint(20) unsigned NOT NULL,
  `room_id` bigint(20) unsigned NOT NULL,
  `start_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '1668590863',
  `end_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '1668590863',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stays_patient_id_foreign` (`patient_id`),
  KEY `stays_room_id_foreign` (`room_id`),
  CONSTRAINT `stays_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`),
  CONSTRAINT `stays_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `stays` */

/*Table structure for table `subscribers` */

DROP TABLE IF EXISTS `subscribers`;

CREATE TABLE `subscribers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'email',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `subscribers` */

insert  into `subscribers`(`id`,`email`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'randEmail0@test.com','2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(2,'randEmail1@test.com','2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(3,'randEmail2@test.com','2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(4,'randEmail3@test.com','2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(5,'randEmail4@test.com','2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(6,'randEmail5@test.com','2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(7,'randEmail6@test.com','2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(8,'randEmail7@test.com','2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(9,'randEmail8@test.com','2022-11-16 09:27:45','2022-11-16 09:27:45',NULL),
(10,'randEmail9@test.com','2022-11-16 09:27:45','2022-11-16 09:27:45',NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_super_admin` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`role`,`is_super_admin`,`remember_token`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'admin','admin@gmail.com',NULL,'$2y$10$HsMO2AM3gtJCDDBkk/QLbuJ558SlUqsXrzfgSsevkFAXyEkB/dYn.','super admin',1,'ZVvhlYX8AtUf17Alivu7J7t1vSQyhgTVVbHUL0RnWS4GIaBnE9un1RDi7NZs','2022-11-16 09:27:43','2022-11-16 09:27:43',NULL),
(2,'test','test@gmail.com',NULL,'$2y$10$F3i1J7ivh0gQQ8zNwdRbqOzKAhNVplKBb32HadcESd.prKyZGRQp2',NULL,0,NULL,'2022-11-16 09:58:24','2022-11-16 09:58:24',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
