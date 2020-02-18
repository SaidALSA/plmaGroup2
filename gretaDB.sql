CREATE DATABASE  IF NOT EXISTS `greta` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `greta`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: greta
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `a_contacter`
--

DROP TABLE IF EXISTS `a_contacter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `a_contacter` (
  `NUM_SECU_SOC` char(32) NOT NULL,
  `NOM` varchar(50) DEFAULT NULL,
  `PRENOM` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`NUM_SECU_SOC`),
  KEY `I_FK_A_CONTACTER_PERSONNE_EXT` (`NOM`,`PRENOM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_contacter`
--

LOCK TABLES `a_contacter` WRITE;
/*!40000 ALTER TABLE `a_contacter` DISABLE KEYS */;
/*!40000 ALTER TABLE `a_contacter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a_de_experience`
--

DROP TABLE IF EXISTS `a_de_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `a_de_experience` (
  `NUM_SECU_SOC` char(32) NOT NULL,
  `INTITULE_POSTE` char(45) NOT NULL,
  `NB_ANNEES` int NOT NULL,
  `NOM_ENTREPRISE` char(32) NOT NULL,
  `LIEU` char(32) NOT NULL,
  PRIMARY KEY (`NUM_SECU_SOC`,`INTITULE_POSTE`),
  KEY `I_FK_A_DE_EXPERIENCE_PERSONNE_INT` (`NUM_SECU_SOC`),
  KEY `I_FK_A_DE_EXPERIENCE_EXPERIENCE_PRO` (`INTITULE_POSTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_de_experience`
--

LOCK TABLES `a_de_experience` WRITE;
/*!40000 ALTER TABLE `a_de_experience` DISABLE KEYS */;
/*!40000 ALTER TABLE `a_de_experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activite`
--

DROP TABLE IF EXISTS `activite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activite` (
  `NOM_ACTIVITE` char(32) NOT NULL,
  `ID` int DEFAULT NULL,
  PRIMARY KEY (`NOM_ACTIVITE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activite`
--

LOCK TABLES `activite` WRITE;
/*!40000 ALTER TABLE `activite` DISABLE KEYS */;
/*!40000 ALTER TABLE `activite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administratif`
--

DROP TABLE IF EXISTS `administratif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administratif` (
  `NUM_SECU_SOC` char(32) NOT NULL,
  `FONCTION` char(32) NOT NULL,
  PRIMARY KEY (`NUM_SECU_SOC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administratif`
--

LOCK TABLES `administratif` WRITE;
/*!40000 ALTER TABLE `administratif` DISABLE KEYS */;
/*!40000 ALTER TABLE `administratif` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competence`
--

DROP TABLE IF EXISTS `competence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competence` (
  `NOM_ACTIVITE` char(32) NOT NULL,
  `INTITULE_COMPETENCE` char(32) NOT NULL,
  `DESCRIPTION` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`NOM_ACTIVITE`,`INTITULE_COMPETENCE`),
  KEY `I_FK_COMPETENCE_ACTIVITE` (`NOM_ACTIVITE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competence`
--

LOCK TABLES `competence` WRITE;
/*!40000 ALTER TABLE `competence` DISABLE KEYS */;
/*!40000 ALTER TABLE `competence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `couvre_activites`
--

DROP TABLE IF EXISTS `couvre_activites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `couvre_activites` (
  `NOM_ACTIVITE` char(32) NOT NULL,
  `INTITULE_FORMATION` char(32) NOT NULL,
  `VILLE` char(32) NOT NULL,
  `DATE_DEBUT` date NOT NULL,
  `NIVEAU_MINI` int NOT NULL,
  `NB_HEURE_TOTAL` int NOT NULL,
  PRIMARY KEY (`NOM_ACTIVITE`,`INTITULE_FORMATION`,`VILLE`,`DATE_DEBUT`),
  KEY `I_FK_COUVRE_ACTIVITES_ACTIVITE` (`NOM_ACTIVITE`),
  KEY `I_FK_COUVRE_ACTIVITES_FORMATION` (`INTITULE_FORMATION`,`VILLE`,`DATE_DEBUT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `couvre_activites`
--

LOCK TABLES `couvre_activites` WRITE;
/*!40000 ALTER TABLE `couvre_activites` DISABLE KEYS */;
/*!40000 ALTER TABLE `couvre_activites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demandeur_emploi`
--

DROP TABLE IF EXISTS `demandeur_emploi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `demandeur_emploi` (
  `NUM_SECU_SOC` char(32) NOT NULL,
  `TYPE` char(32) NOT NULL,
  `DATE_INSCRIPTION` date NOT NULL,
  `NUMERO_INSCRIPTION` char(32) NOT NULL,
  `TYPE_INDEMNISATION` char(32) DEFAULT NULL,
  `DATE_FIN_DERNIER_POSTE` date DEFAULT NULL,
  `TYPE_DERNIER_CONTRAT` char(32) DEFAULT NULL,
  PRIMARY KEY (`NUM_SECU_SOC`),
  KEY `I_FK_DEMANDEUR_EMPLOI_PRESCRIPTEUR` (`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demandeur_emploi`
--

LOCK TABLES `demandeur_emploi` WRITE;
/*!40000 ALTER TABLE `demandeur_emploi` DISABLE KEYS */;
/*!40000 ALTER TABLE `demandeur_emploi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diplome`
--

DROP TABLE IF EXISTS `diplome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diplome` (
  `INTITULE` char(45) NOT NULL,
  `LIEU` char(45) NOT NULL,
  `ID` int DEFAULT NULL,
  PRIMARY KEY (`INTITULE`,`LIEU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diplome`
--

LOCK TABLES `diplome` WRITE;
/*!40000 ALTER TABLE `diplome` DISABLE KEYS */;
/*!40000 ALTER TABLE `diplome` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enseigne_competence`
--

DROP TABLE IF EXISTS `enseigne_competence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enseigne_competence` (
  `NUM_SECU_SOC` char(32) NOT NULL,
  `NOM_ACTIVITE` char(32) NOT NULL,
  `INTITULE_COMPETENCE` char(32) NOT NULL,
  PRIMARY KEY (`NUM_SECU_SOC`,`NOM_ACTIVITE`,`INTITULE_COMPETENCE`),
  KEY `I_FK_ENSEIGNE_COMPETENCE_FORMATEUR` (`NUM_SECU_SOC`),
  KEY `I_FK_ENSEIGNE_COMPETENCE_COMPETENCE` (`NOM_ACTIVITE`,`INTITULE_COMPETENCE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enseigne_competence`
--

LOCK TABLES `enseigne_competence` WRITE;
/*!40000 ALTER TABLE `enseigne_competence` DISABLE KEYS */;
/*!40000 ALTER TABLE `enseigne_competence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entreprise`
--

DROP TABLE IF EXISTS `entreprise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entreprise` (
  `NUM_SIRET` char(32) NOT NULL,
  `NOM` char(32) NOT NULL,
  `ADRESSE` varchar(128) NOT NULL,
  `CODE_POSTAL` char(32) NOT NULL,
  `VILLES` char(32) NOT NULL,
  `TELEPHONE` char(32) DEFAULT NULL,
  `E_MAIL` char(32) DEFAULT NULL,
  PRIMARY KEY (`NUM_SIRET`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entreprise`
--

LOCK TABLES `entreprise` WRITE;
/*!40000 ALTER TABLE `entreprise` DISABLE KEYS */;
/*!40000 ALTER TABLE `entreprise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `est_diplome`
--

DROP TABLE IF EXISTS `est_diplome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `est_diplome` (
  `NUM_SECU_SOC` char(32) NOT NULL,
  `INTITULE` char(45) NOT NULL,
  `LIEU` char(45) NOT NULL,
  `ANNÉE_OBTENTION` date NOT NULL,
  `SPECIALITE` char(32) NOT NULL,
  `DERNIERE_CLASSE` char(32) DEFAULT NULL,
  `DERNIER_DOMAINE` char(32) DEFAULT NULL,
  PRIMARY KEY (`NUM_SECU_SOC`,`INTITULE`,`LIEU`),
  KEY `I_FK_EST_DIPLOME_PERSONNE_INT` (`NUM_SECU_SOC`),
  KEY `I_FK_EST_DIPLOME_DIPLOME` (`INTITULE`,`LIEU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `est_diplome`
--

LOCK TABLES `est_diplome` WRITE;
/*!40000 ALTER TABLE `est_diplome` DISABLE KEYS */;
/*!40000 ALTER TABLE `est_diplome` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `est_disponible`
--

DROP TABLE IF EXISTS `est_disponible`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `est_disponible` (
  `NUM_SEMAINE` int NOT NULL,
  `JOUR` date NOT NULL,
  `HEURE_DEBUT` time NOT NULL,
  `NUM_SECU_SOC` char(32) NOT NULL,
  `POUR_DUREE` int NOT NULL,
  PRIMARY KEY (`NUM_SEMAINE`,`JOUR`,`HEURE_DEBUT`,`NUM_SECU_SOC`),
  KEY `I_FK_EST_DISPONIBLE_SEANCE` (`NUM_SEMAINE`,`JOUR`,`HEURE_DEBUT`),
  KEY `I_FK_EST_DISPONIBLE_FORMATEUR` (`NUM_SECU_SOC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `est_disponible`
--

LOCK TABLES `est_disponible` WRITE;
/*!40000 ALTER TABLE `est_disponible` DISABLE KEYS */;
/*!40000 ALTER TABLE `est_disponible` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experience_pro`
--

DROP TABLE IF EXISTS `experience_pro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experience_pro` (
  `INTITULE_POSTE` char(45) NOT NULL,
  `STATUT` char(32) DEFAULT NULL,
  PRIMARY KEY (`INTITULE_POSTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experience_pro`
--

LOCK TABLES `experience_pro` WRITE;
/*!40000 ALTER TABLE `experience_pro` DISABLE KEYS */;
/*!40000 ALTER TABLE `experience_pro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fait_cours`
--

DROP TABLE IF EXISTS `fait_cours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fait_cours` (
  `NUM_SECU_SOC` char(32) NOT NULL,
  `INTITULE_FORMATION` char(32) NOT NULL,
  `VILLE` char(32) NOT NULL,
  `DATE_DEBUT` date NOT NULL,
  `NUM_SEMAINE` int NOT NULL,
  `JOUR` date NOT NULL,
  `HEURE_DEBUT` time NOT NULL,
  `NOM_ACTIVITE` char(32) NOT NULL,
  `INTITULE_COMPETENCE` char(32) NOT NULL,
  `DUREE_COURS` int NOT NULL,
  `OUTILS` char(32) DEFAULT NULL,
  PRIMARY KEY (`NUM_SECU_SOC`,`INTITULE_FORMATION`,`VILLE`,`DATE_DEBUT`,`NUM_SEMAINE`,`JOUR`,`HEURE_DEBUT`,`NOM_ACTIVITE`,`INTITULE_COMPETENCE`),
  KEY `I_FK_FAIT_COURS_FORMATEUR` (`NUM_SECU_SOC`),
  KEY `I_FK_FAIT_COURS_FORMATION` (`INTITULE_FORMATION`,`VILLE`,`DATE_DEBUT`),
  KEY `I_FK_FAIT_COURS_SEANCE` (`NUM_SEMAINE`,`JOUR`,`HEURE_DEBUT`),
  KEY `I_FK_FAIT_COURS_COMPETENCE` (`NOM_ACTIVITE`,`INTITULE_COMPETENCE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fait_cours`
--

LOCK TABLES `fait_cours` WRITE;
/*!40000 ALTER TABLE `fait_cours` DISABLE KEYS */;
/*!40000 ALTER TABLE `fait_cours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formateur`
--

DROP TABLE IF EXISTS `formateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formateur` (
  `NUM_SECU_SOC` char(32) NOT NULL,
  `ID` int DEFAULT NULL,
  PRIMARY KEY (`NUM_SECU_SOC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formateur`
--

LOCK TABLES `formateur` WRITE;
/*!40000 ALTER TABLE `formateur` DISABLE KEYS */;
/*!40000 ALTER TABLE `formateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formateur_salarie`
--

DROP TABLE IF EXISTS `formateur_salarie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formateur_salarie` (
  `NUM_SECU_SOC` char(32) NOT NULL,
  `NUM_SIRET` char(32) NOT NULL,
  `ID` int DEFAULT NULL,
  PRIMARY KEY (`NUM_SECU_SOC`),
  KEY `I_FK_FORMATEUR_SALARIE_ENTREPRISE` (`NUM_SIRET`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formateur_salarie`
--

LOCK TABLES `formateur_salarie` WRITE;
/*!40000 ALTER TABLE `formateur_salarie` DISABLE KEYS */;
/*!40000 ALTER TABLE `formateur_salarie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formation`
--

DROP TABLE IF EXISTS `formation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formation` (
  `INTITULE_FORMATION` char(32) NOT NULL,
  `VILLE` char(32) NOT NULL,
  `DATE_DEBUT` date NOT NULL,
  `DATE_FIN` date NOT NULL,
  `NOMBRE_HEURES` int NOT NULL,
  `DISPOSITIF` char(32) NOT NULL,
  `NOM_FINANCEUR` char(32) NOT NULL,
  `CONVENTION_CONTRAT_FORMATION` char(32) NOT NULL,
  `INFO_SUPL` char(32) DEFAULT NULL,
  PRIMARY KEY (`INTITULE_FORMATION`,`VILLE`,`DATE_DEBUT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formation`
--

LOCK TABLES `formation` WRITE;
/*!40000 ALTER TABLE `formation` DISABLE KEYS */;
/*!40000 ALTER TABLE `formation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personne_ext`
--

DROP TABLE IF EXISTS `personne_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personne_ext` (
  `NOM` varchar(50) NOT NULL,
  `PRENOM` varchar(50) NOT NULL,
  `TELEPHONE` char(32) NOT NULL,
  `PORTABLE` char(32) NOT NULL,
  `LIEN_PARENTE` char(32) NOT NULL,
  PRIMARY KEY (`NOM`,`PRENOM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personne_ext`
--

LOCK TABLES `personne_ext` WRITE;
/*!40000 ALTER TABLE `personne_ext` DISABLE KEYS */;
/*!40000 ALTER TABLE `personne_ext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personne_int`
--

DROP TABLE IF EXISTS `personne_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personne_int` (
  `NOM` char(32) NOT NULL,
  `NOM_JEUNE_FILLE` char(45) DEFAULT NULL,
  `PRENOM` char(32) NOT NULL,
  `TELEPHONE` char(32) NOT NULL,
  `SEXE` char(32) NOT NULL,
  `NATIONALITE` char(32) NOT NULL,
  `ADRESSE` varchar(128) NOT NULL,
  `CODE_POSTAL` char(32) NOT NULL,
  `VILLE` char(32) NOT NULL,
  `E_MAIL` char(32) NOT NULL,
  `DATE_NAISSANCE` date NOT NULL,
  `VILLE_NAISSANCE` char(32) NOT NULL,
  `PAYS_NAISSANCE` char(32) NOT NULL,
  `NUM_SECU_SOC` char(32) NOT NULL,
  `CLE` int NOT NULL,
  `SITUATION_FAMILLIALE` char(32) NOT NULL,
  PRIMARY KEY (`NUM_SECU_SOC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personne_int`
--

LOCK TABLES `personne_int` WRITE;
/*!40000 ALTER TABLE `personne_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `personne_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescripteur`
--

DROP TABLE IF EXISTS `prescripteur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescripteur` (
  `TYPE` char(32) NOT NULL,
  `ADRESSE` char(45) NOT NULL,
  `CODE_POSTAL` char(32) NOT NULL,
  `VILLE` char(32) NOT NULL,
  `NOM_REFERENT` char(32) NOT NULL,
  `E_MAIL` char(32) NOT NULL,
  `TELEPHONE` char(32) DEFAULT NULL,
  PRIMARY KEY (`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescripteur`
--

LOCK TABLES `prescripteur` WRITE;
/*!40000 ALTER TABLE `prescripteur` DISABLE KEYS */;
/*!40000 ALTER TABLE `prescripteur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seance`
--

DROP TABLE IF EXISTS `seance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seance` (
  `NUM_SEMAINE` int NOT NULL,
  `JOUR` date NOT NULL,
  `HEURE_DEBUT` time NOT NULL,
  `ID` int DEFAULT NULL,
  PRIMARY KEY (`NUM_SEMAINE`,`JOUR`,`HEURE_DEBUT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seance`
--

LOCK TABLES `seance` WRITE;
/*!40000 ALTER TABLE `seance` DISABLE KEYS */;
/*!40000 ALTER TABLE `seance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stagiaire`
--

DROP TABLE IF EXISTS `stagiaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stagiaire` (
  `NUM_SECU_SOC` char(32) NOT NULL,
  `PHOTO` longblob,
  `AGE` int NOT NULL,
  `METIER_SOUHAITE` char(32) DEFAULT NULL,
  `COMMENT_CONNU_GRETA` char(32) DEFAULT NULL,
  `PERMIS_DE_CONDUIRE` smallint DEFAULT NULL,
  `A_UN_VEHICULE` char(32) DEFAULT NULL,
  `STATUT_HANDICAPE` smallint DEFAULT NULL,
  PRIMARY KEY (`NUM_SECU_SOC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stagiaire`
--

LOCK TABLES `stagiaire` WRITE;
/*!40000 ALTER TABLE `stagiaire` DISABLE KEYS */;
/*!40000 ALTER TABLE `stagiaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stagiaire_salarie`
--

DROP TABLE IF EXISTS `stagiaire_salarie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stagiaire_salarie` (
  `NUM_SECU_SOC` char(32) NOT NULL,
  `NUM_SIRET` char(32) NOT NULL,
  `INTITULE_POSTE` char(32) NOT NULL,
  `DATE_DEBUT` date NOT NULL,
  `TYPE_CONTRAT` char(32) NOT NULL,
  PRIMARY KEY (`NUM_SECU_SOC`),
  KEY `I_FK_STAGIAIRE_SALARIE_ENTREPRISE` (`NUM_SIRET`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stagiaire_salarie`
--

LOCK TABLES `stagiaire_salarie` WRITE;
/*!40000 ALTER TABLE `stagiaire_salarie` DISABLE KEYS */;
/*!40000 ALTER TABLE `stagiaire_salarie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `INTITULE` char(32) NOT NULL,
  `ID` int DEFAULT NULL,
  PRIMARY KEY (`INTITULE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suit`
--

DROP TABLE IF EXISTS `suit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suit` (
  `NUM_SECU_SOC` char(32) NOT NULL,
  `INTITULE_FORMATION` char(32) NOT NULL,
  `VILLE` char(32) NOT NULL,
  `DATE_DEBUT` date NOT NULL,
  PRIMARY KEY (`NUM_SECU_SOC`,`INTITULE_FORMATION`,`VILLE`,`DATE_DEBUT`),
  KEY `I_FK_SUIT_STAGIAIRE` (`NUM_SECU_SOC`),
  KEY `I_FK_SUIT_FORMATION` (`INTITULE_FORMATION`,`VILLE`,`DATE_DEBUT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suit`
--

LOCK TABLES `suit` WRITE;
/*!40000 ALTER TABLE `suit` DISABLE KEYS */;
/*!40000 ALTER TABLE `suit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacataire`
--

DROP TABLE IF EXISTS `vacataire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacataire` (
  `NUM_SECU_SOC` char(32) NOT NULL,
  `INTITULE` char(32) NOT NULL,
  `ID` int DEFAULT NULL,
  PRIMARY KEY (`NUM_SECU_SOC`),
  KEY `I_FK_VACATAIRE_STATUS` (`INTITULE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacataire`
--

LOCK TABLES `vacataire` WRITE;
/*!40000 ALTER TABLE `vacataire` DISABLE KEYS */;
/*!40000 ALTER TABLE `vacataire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'greta'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-17 22:38:12
