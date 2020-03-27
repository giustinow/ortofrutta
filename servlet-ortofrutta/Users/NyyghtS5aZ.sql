-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Mar 27, 2020 alle 08:45
-- Versione del server: 8.0.13-4
-- Versione PHP: 7.2.24-0ubuntu0.18.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `NyyghtS5aZ`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `Carrello`
--

CREATE TABLE `Carrello` (
  `idProdotto` int(11) NOT NULL,
  `nome` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `quantita` int(11) NOT NULL,
  `prezzo` int(11) NOT NULL,
  `totale` int(11) NOT NULL,
  `idScontrino` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Magazzino`
--

CREATE TABLE `Magazzino` (
  `nome` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `quantita` int(11) NOT NULL,
  `prezzo` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `descrizione` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dump dei dati per la tabella `Magazzino`
--

INSERT INTO `Magazzino` (`nome`, `quantita`, `prezzo`, `descrizione`) VALUES
('Amuchina', 1, '75.0', 'Rarita Prodotto: 100'),
('arance', 88, '2.0', 'Sicilia'),
('banana', 98, '2.0', 'Chiquita'),
('burro', 6, '4.0', 'cacao'),
('fragole', 29, '5.0', 'rosse'),
('mandarino', 170, '10.0', 'arancione'),
('mela', 72, '10.0', 'golden'),
('papaya', 200, '5.0', 'jamaica');

-- --------------------------------------------------------

--
-- Struttura della tabella `Scontrino`
--

CREATE TABLE `Scontrino` (
  `idScontrino` int(11) NOT NULL,
  `data` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `idProdotto` int(11) NOT NULL,
  `totale` int(11) NOT NULL,
  `username` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Utente`
--

CREATE TABLE `Utente` (
  `username` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `eta` int(11) NOT NULL,
  `idScontrino` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Vendite`
--

CREATE TABLE `Vendite` (
  `nome` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `quantita` varchar(45) COLLATE utf8_unicode_ci DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dump dei dati per la tabella `Vendite`
--

INSERT INTO `Vendite` (`nome`, `quantita`) VALUES
('Amuchina', '20'),
('arance', '12'),
('banana', '2'),
('burro', '0'),
('fragole', '1'),
('mandarino', '30'),
('mela', '28'),
('papaya', '0');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `Carrello`
--
ALTER TABLE `Carrello`
  ADD PRIMARY KEY (`idProdotto`);

--
-- Indici per le tabelle `Magazzino`
--
ALTER TABLE `Magazzino`
  ADD PRIMARY KEY (`nome`);

--
-- Indici per le tabelle `Scontrino`
--
ALTER TABLE `Scontrino`
  ADD PRIMARY KEY (`idScontrino`,`username`,`idProdotto`);

--
-- Indici per le tabelle `Utente`
--
ALTER TABLE `Utente`
  ADD PRIMARY KEY (`username`,`idScontrino`),
  ADD KEY `fk_Scontrino_idScontrino_idx` (`idScontrino`);

--
-- Indici per le tabelle `Vendite`
--
ALTER TABLE `Vendite`
  ADD PRIMARY KEY (`nome`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `Carrello`
--
ALTER TABLE `Carrello`
  MODIFY `idProdotto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `Scontrino`
--
ALTER TABLE `Scontrino`
  MODIFY `idScontrino` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
