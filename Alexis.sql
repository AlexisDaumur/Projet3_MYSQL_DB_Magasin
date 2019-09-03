# Database magasin
# ------------------------------------------------------------


CREATE DATABASE `magasin` DEFAULT CHARACTER SET = `utf8`;
USE `magasin`;


# Table pointure
# ------------------------------------------------------------



CREATE TABLE `pointure` (
  `id` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `taille` INT(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# Table marque
# ------------------------------------------------------------


CREATE TABLE `marque` (
  `id` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# Table chaussure
# ------------------------------------------------------------


CREATE TABLE `chaussure` (
`id` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`modele` varchar(255) NOT NULL,
`couleur` varchar(255) NOT NULL,
`prix` INT(11) NOT NULL,
`id_marque` INT(11) NOT NULL,
`id_pointure` INT(11) NOT NULL,
KEY `fk_id_marque` (`id_marque`),
KEY `fk_id_pointure` (`id_pointure`),
CONSTRAINT `fk_id_marque` FOREIGN KEY (`id_marque`) REFERENCES `marque` (id),
CONSTRAINT `fk_id_pointure` FOREIGN KEY (`id_pointure`) REFERENCES `pointure` (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# Table client
# ------------------------------------------------------------


CREATE TABLE `client` (
  `id` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# Table adresse
# ------------------------------------------------------------


CREATE TABLE `adresse` (
  `id` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `numéro` INT(11) NOT NULL,
  `rue` varchar(255) NOT NULL,
  `cp` INT(11) NOT NULL,
  `ville` varchar(255) NOT NULL,
  `pays` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# Table commande
# ------------------------------------------------------------


CREATE TABLE `commande` (
`id` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`id_client` INT(11) NOT NULL,
`id_adresse` INT(11) NOT NULL,
KEY `fk_id_client` (`id_client`),
KEY `fk_id_adresse` (`id_adresse`),
CONSTRAINT `fk_id_client` FOREIGN KEY (`id_client`) REFERENCES `client` (id),
CONSTRAINT `fk_id_adresse` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




# Table commande_chaussure
# ------------------------------------------------------------


CREATE TABLE `commande_chaussure` (
  `id_chaussure` INT(11) NOT NULL,
  `id_commande` INT(11) NOT NULL,
  PRIMARY KEY (`id_chaussure`,`id_commande`),
  KEY `fk_id_chaussure` (`id_chaussure`),
  KEY `fk_id_commande` (`id_commande`),
  CONSTRAINT `fk_id_chaussure` FOREIGN KEY (`id_chaussure`) REFERENCES `chaussure` (id),
  CONSTRAINT `fk_id_commande` FOREIGN KEY (`id_commande`) REFERENCES `commande` (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
