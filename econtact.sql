-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Ven 13 Novembre 2020 à 22:42
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `econtact`
--

-- --------------------------------------------------------

--
-- Structure de la table `facturation`
--

CREATE TABLE `facturation` (
  `type` text COLLATE utf8mb4_unicode_ci,
  `nb` int(255) DEFAULT NULL,
  `ide` int(255) NOT NULL,
  `idv` int(255) NOT NULL,
  `dateD` date NOT NULL,
  `dateF` date NOT NULL,
  `valeur` int(50) NOT NULL,
  `etat` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `facturation`
--

INSERT INTO `facturation` (`type`, `nb`, `ide`, `idv`, `dateD`, `dateF`, `valeur`, `etat`) VALUES
(NULL, NULL, 16, 1, '2020-11-02', '2020-11-04', 200, 'bon'),
(NULL, NULL, 18, 2, '2020-11-03', '2020-11-25', 200, 'bon'),
('de', 3, 16, 17, '2020-11-24', '2020-11-30', 3, 'ded');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(255) NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mdp` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `usertype` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `email`, `mdp`, `usertype`) VALUES
(16, 'test', 'test@gmail.com', '$6FrCaT/v0dwE', 'client'),
(17, 'laala', 'la@test.com', '$6FrCaT/v0dwE', 'loueur'),
(18, 'test2', 'test2@gmail.com', '$6FrCaT/v0dwE', 'client'),
(19, 'testman', 'test@test.com', '$6FrCaT/v0dwE', 'loueur');

-- --------------------------------------------------------

--
-- Structure de la table `vehicule`
--

CREATE TABLE `vehicule` (
  `id` int(255) NOT NULL,
  `typev` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `nb` int(255) NOT NULL,
  `caract` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locationv` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `idvl` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `vehicule`
--

INSERT INTO `vehicule` (`id`, `typev`, `nb`, `caract`, `locationv`, `photo`, `idvl`) VALUES
(1, 'Fiat Panda', 26, 'moteur : essence, vitesse : manuelle', 'disponible', '', 19),
(2, 'peugeot 306', 10, 'moteur : essence, vitesse : manuelle', 'disponible', '', 17),
(17, 'brrb', 3, 'bien', 'loué', 'non', 17),
(18, 'grege', 222, 'fefef', 'En revision', 'non', 17);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `facturation`
--
ALTER TABLE `facturation`
  ADD KEY `ide` (`ide`),
  ADD KEY `idv` (`idv`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `vehicule`
--
ALTER TABLE `vehicule`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT pour la table `vehicule`
--
ALTER TABLE `vehicule`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `facturation`
--
ALTER TABLE `facturation`
  ADD CONSTRAINT `facturation_ibfk_1` FOREIGN KEY (`ide`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `facturation_ibfk_2` FOREIGN KEY (`idv`) REFERENCES `vehicule` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
