DROP TABLE IF EXISTS Perso;

CREATE TABLE Perso (
  IdPerso INT AUTO_INCREMENT NOT NULL,
  AttPerso INT,
  DefPerso INT,
  imgIdlePerso VARCHAR(255),
  imgAttPerso VARCHAR(255),
  imgDefPerso VARCHAR(255),
  imgDiePerso VARCHAR(255),
  NamePerso VARCHAR(255),
  PRIMARY KEY (IdPerso)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS Player;

CREATE TABLE Player (
  IdPlayer INT AUTO_INCREMENT NOT NULL,
  NamePlayer VARCHAR(255),
  AttPlayer INT,
  DefPlayer INT,
  LevelPlayer DOUBLE,
  IdPersoPlayer INT,
  IdPerso INT,
  PRIMARY KEY (IdPlayer)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS Team1;

CREATE TABLE Team1 (
  IdTeam1 INT AUTO_INCREMENT NOT NULL,
  Buff1 INT,
  TimeStampsTeam1 TIMESTAMP,
  PRIMARY KEY (IdTeam1)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS Battle;

CREATE TABLE Battle (
  IdBattle INT AUTO_INCREMENT NOT NULL,
  IdTeam1 INT,
  idTeam2 INT,
  TimeStampBattle TIMESTAMP,
  PRIMARY KEY (IdBattle)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS Team2;

CREATE TABLE Team2 (
  IdTeam2 INT AUTO_INCREMENT NOT NULL,
  Buff2 INT,
  TimeStampsTeam2 TIMESTAMP,
  PRIMARY KEY (IdTeam2)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS Faire_Partie_de;

CREATE TABLE Faire_Partie_de (
  IdPlayer INT AUTO_INCREMENT NOT NULL,
  IdTeam1 INT NOT NULL,
  IdTeam2 INT NOT NULL,
  IdPlayerinTeam INT,
  IdTeaminSection INT,
  PRIMARY KEY (IdPlayer, IdTeam1, IdTeam2)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS EngageTeam1;

CREATE TABLE EngageTeam1 (
  IdTeam1 INT AUTO_INCREMENT NOT NULL,
  IdBattle INT NOT NULL,
  PRIMARY KEY (IdTeam1, IdBattle)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS EngageTeam2;

CREATE TABLE EngageTeam2 (
  IdTeam2 INT AUTO_INCREMENT NOT NULL,
  IdBattle INT NOT NULL,
  PRIMARY KEY (IdTeam2, IdBattle)
) ENGINE = InnoDB;

ALTER TABLE
  Player
ADD
  CONSTRAINT FK_Player_IdPerso FOREIGN KEY (IdPerso) REFERENCES Perso (IdPerso);

ALTER TABLE
  Faire_Partie_de
ADD
  CONSTRAINT FK_Faire_Partie_de_IdPlayer FOREIGN KEY (IdPlayer) REFERENCES Player (IdPlayer);

ALTER TABLE
  Faire_Partie_de
ADD
  CONSTRAINT FK_Faire_Partie_de_IdTeam1 FOREIGN KEY (IdTeam1) REFERENCES Team1 (IdTeam1);

ALTER TABLE
  Faire_Partie_de
ADD
  CONSTRAINT FK_Faire_Partie_de_IdTeam2 FOREIGN KEY (IdTeam2) REFERENCES Team2 (IdTeam2);

ALTER TABLE
  EngageTeam1
ADD
  CONSTRAINT FK_EngageTeam1_IdTeam1 FOREIGN KEY (IdTeam1) REFERENCES Team1 (IdTeam1);

ALTER TABLE
  EngageTeam1
ADD
  CONSTRAINT FK_EngageTeam1_IdBattle FOREIGN KEY (IdBattle) REFERENCES Battle (IdBattle);

ALTER TABLE
  EngageTeam2
ADD
  CONSTRAINT FK_EngageTeam2_IdTeam2 FOREIGN KEY (IdTeam2) REFERENCES Team2 (IdTeam2);

ALTER TABLE
  EngageTeam2
ADD
  CONSTRAINT FK_EngageTeam2_IdBattle FOREIGN KEY (IdBattle) REFERENCES Battle (IdBattle);