-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 11 oct. 2021 à 11:59
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `festival`
--

-- --------------------------------------------------------

--
-- Structure de la table `attribution`
--

DROP TABLE IF EXISTS `attribution`;
CREATE TABLE IF NOT EXISTS `attribution` (
  `idEtab` char(8) CHARACTER SET latin1 NOT NULL,
  `idGroupe` char(4) CHARACTER SET latin1 NOT NULL,
  `nombreChambres` int(11) NOT NULL,
  PRIMARY KEY (`idEtab`,`idGroupe`),
  KEY `fk2_Attribution` (`idGroupe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `attribution`
--

INSERT INTO `attribution` (`idEtab`, `idGroupe`, `nombreChambres`) VALUES
('0350123A', 'g004', 13),
('0350123A', 'g005', 8),
('0350785N', 'g001', 11),
('0350785N', 'g002', 9),
('0351234W', 'g001', 3),
('0351234W', 'g006', 10),
('0351234W', 'g007', 7);

-- --------------------------------------------------------

--
-- Structure de la table `etablissement`
--

DROP TABLE IF EXISTS `etablissement`;
CREATE TABLE IF NOT EXISTS `etablissement` (
  `id` char(8) CHARACTER SET latin1 NOT NULL,
  `nom` varchar(45) CHARACTER SET latin1 NOT NULL,
  `adresseRue` varchar(45) CHARACTER SET latin1 NOT NULL,
  `codePostal` char(5) CHARACTER SET latin1 NOT NULL,
  `ville` varchar(35) CHARACTER SET latin1 NOT NULL,
  `tel` varchar(13) CHARACTER SET latin1 NOT NULL,
  `adresseElectronique` varchar(70) CHARACTER SET latin1 DEFAULT NULL,
  `type` tinyint(4) NOT NULL,
  `civiliteResponsable` varchar(12) CHARACTER SET latin1 NOT NULL,
  `nomResponsable` varchar(25) CHARACTER SET latin1 NOT NULL,
  `prenomResponsable` varchar(25) CHARACTER SET latin1 DEFAULT NULL,
  `nombreChambresOffertes` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `etablissement`
--

INSERT INTO `etablissement` (`id`, `nom`, `adresseRue`, `codePostal`, `ville`, `tel`, `adresseElectronique`, `type`, `civiliteResponsable`, `nomResponsable`, `prenomResponsable`, `nombreChambresOffertes`) VALUES
('0350123A', 'Collège Lamartine', '3, avenue des corsaires', '35404', 'Paramé', '0299561459', '', 1, 'Mme', 'Lefort', 'Anne', 58),
('0350785N', 'Collège de Moka', '2 avenue Aristide Briand BP 6', '35401', 'Saint-Malo', '0299206990', NULL, 1, 'M.', 'Dupont', 'Alain', 20),
('0351234W', 'Collège Léonard de Vinci', '2 rue Rabelais', '35418', 'Saint-Malo', '0299117474', NULL, 1, 'M.', 'Durand', 'Pierre', 60),
('11111111', 'Centre de rencontres internationales', '37 avenue du R.P. Umbricht BP 108', '35407', 'Saint-Malo', '0299000000', NULL, 0, 'M.', 'Guenroc', 'Guy', 200);

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

DROP TABLE IF EXISTS `groupe`;
CREATE TABLE IF NOT EXISTS `groupe` (
  `id` char(4) CHARACTER SET latin1 NOT NULL,
  `nom` varchar(40) CHARACTER SET latin1 NOT NULL,
  `identiteResponsable` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `adressePostale` varchar(120) CHARACTER SET latin1 DEFAULT NULL,
  `nombrePersonnes` int(11) NOT NULL,
  `nomPays` varchar(40) CHARACTER SET latin1 NOT NULL,
  `hebergement` char(1) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `groupe`
--

INSERT INTO `groupe` (`id`, `nom`, `identiteResponsable`, `adressePostale`, `nombrePersonnes`, `nomPays`, `hebergement`) VALUES
('g001', 'Ligue de Basket', '', '', 40, 'Bachkirie', 'O'),
('g002', 'Ligue de Foot', NULL, NULL, 25, 'Bolivie', 'O'),
('g003', 'Ligue de Tennis', NULL, NULL, 34, 'Brésil', 'O'),
('g004', 'Ligue de Natation', NULL, NULL, 38, 'Bulgarie', 'O'),
('g005', 'Ligue de Tennis de Table', NULL, NULL, 22, 'Cameroun', 'O'),
('g006', 'Ligue de Pétanque ', NULL, NULL, 29, 'Corée du Sud', 'O'),
('g007', 'Ligue de Volley-Ball', NULL, NULL, 19, 'Ecosse', 'O'),
('g008', 'Ligue de Badminton', NULL, NULL, 5, 'Espagne', 'O'),
('g009', 'Ligue de Ski', NULL, NULL, 21, 'Jersey', 'O'),
('g010', 'Ligue de Skateboard', NULL, NULL, 30, 'Emirats arabes unis', 'O'),
('g011', 'Ligue de Snowboard', NULL, NULL, 38, 'Mexique', 'O'),
('g012', 'Ligue de Judo', NULL, NULL, 22, 'Panama', 'O'),
('g013', 'Ligue de Karaté ', NULL, NULL, 13, 'Papouasie', 'O'),
('g014', 'Ligue de Boxe ', NULL, NULL, 26, 'Paraguay', 'O'),
('g015', 'Ligue d\'Aïkido', NULL, NULL, 8, 'Québec', 'O'),
('g016', 'Ligue de Gym', NULL, NULL, 40, 'République de Bachkirie', 'O'),
('g017', 'Ligue de Cricket ', NULL, NULL, 40, 'Turquie', 'O'),
('g018', 'Ligue de Baseball ', NULL, NULL, 43, 'Russie', 'O'),
('g019', 'Ligue de Bowling ', NULL, NULL, 27, 'Sri Lanka', 'O'),
('g020', 'Ligue de Billard ', NULL, NULL, 34, 'France - Provence', 'O'),
('g021', 'Ligue de Cyclisme ', NULL, NULL, 40, 'France - Provence', 'O'),
('g022', 'Ligue de Danse ', NULL, NULL, 1, 'France - Bretagne', 'O'),
('g023', 'Ligue de Futsal ', NULL, NULL, 5, 'France - Bretagne', 'O'),
('g024', 'Ligue de Golf ', NULL, NULL, 5, 'France - Bretagne', 'O'),
('g025', 'Ligue de Handball ', NULL, NULL, 2, 'France - Bretagne', 'O'),
('g026', 'Ligue de Baby-Foot', NULL, NULL, 0, 'France - Bretagne', 'N'),
('g027', 'Ligue de Catch', NULL, NULL, 0, 'France - Bretagne', 'N'),
('g028', 'Ligue de CrossFit', NULL, NULL, 0, 'France - Bretagne', 'N'),
('g029', 'Ligue de Dodgeball', NULL, NULL, 0, 'France - Bretagne', 'N'),
('g030', 'Ligue d\'Escalade ', NULL, NULL, 0, 'France - Bretagne', 'N'),
('g031', 'Ligue de Formule 1', NULL, NULL, 0, 'France - Bretagne', 'N'),
('g032', 'Ligue de Football Américain ', NULL, NULL, 0, 'France - Bretagne', 'N'),
('g033', 'Ligue de Hockey ', NULL, NULL, 0, 'France - Bretagne', 'N'),
('g034', 'Ligue de Ju-Jitsu ', NULL, NULL, 0, 'France - Bretagne', 'N'),
('g035', 'Ligue de Kayak', NULL, NULL, 0, 'France - Bretagne', 'N'),
('g036', 'Ligue de Kung Fu', NULL, NULL, 0, 'France - Bretagne', 'N'),
('g037', 'Ligue de Krav Maga ', NULL, NULL, 0, 'France - Bretagne', 'N'),
('g038', 'Ligue de Lutte ', NULL, NULL, 0, 'France - Bretagne', 'N'),
('g039', 'Ligue de Lancer de Javelot ', NULL, NULL, 0, 'France - Bretagne', 'N'),
('g040', 'Ligue de Lancer de Poids ', NULL, NULL, 0, 'France - Bretagne', 'N'),
('g041', 'Ligue de Motoneige ', NULL, NULL, 0, 'France - Bretagne', 'N'),
('g042', 'Ligue de MMA ', NULL, NULL, 0, 'France - Bretagne', 'N'),
('g043', 'Ligue de Parkour ', NULL, NULL, 0, 'France - Bretagne', 'N'),
('g044', 'Ligue de Quad ', NULL, NULL, 0, 'France - Bretagne', 'N');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `attribution`
--
ALTER TABLE `attribution`
  ADD CONSTRAINT `fk1_Attribution` FOREIGN KEY (`idEtab`) REFERENCES `etablissement` (`id`),
  ADD CONSTRAINT `fk2_Attribution` FOREIGN KEY (`idGroupe`) REFERENCES `groupe` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
