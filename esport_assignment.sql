CREATE DATABASE if not exists esport_assignment;
use esport_assignment;

-- Create Tables 
CREATE TABLE if not exists Players (
	player_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(125) UNIQUE NOT NULL,
    ranking INT,
    created_at DATE DEFAULT(CURRENT_DATE) NOT NULL 
);

CREATE TABLE if not exists Tournaments (
	tournament_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    tname VARCHAR(50) NOT NULL,
    game VARCHAR(255) NOT NULL,
    max_players INT NOT NULL,
    start_date date NOT NULL,
    created_at DATE DEFAULT(CURRENT_DATE) NOT NULL
);

CREATE TABLE if not exists Tournament_Registrations (
	registration_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    tournament_id INT NOT NULL,
    player_id INT NOT NULL,
    registered_at DATETIME DEFAULT(CURRENT_TIMESTAMP) NOT NULL,
	FOREIGN KEY (tournament_id) references Tournaments(tournament_id) ON DELETE CASCADE,
    FOREIGN KEY (player_id) references Players(player_id) ON DELETE CASCADE
);

CREATE TABLE if not exists Matches (
	match_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	tournament_id INT NOT NULL,
    player1_id INT NOT NULL,
    player2_id INT NOT NULL,
    winner_id INT,
    match_date date NOT NULL,
	FOREIGN KEY (tournament_id) references Tournaments(tournament_id) ON DELETE CASCADE,
    FOREIGN KEY (player1_id) references Players(player_id),
	FOREIGN KEY (player2_id) references Players(player_id),
    FOREIGN KEY (winner_id) references Players(player_id)
);

-- Insert Players 
INSERT INTO Players (username, email, ranking) VALUES
('ShadowSlayer', 'shadow@esports.com', 1500),
('PixelPhantom', 'phantom@esports.com', 1700),
('LagBeGone', 'lag@esports.com', 1600),
('CriticalHit', 'crit@esports.com', 1800),
('NoScopeNinja', 'ninja@esports.com', 1750),
('TurboTactician', 'turbo@esports.com', 1650),
('FlashFury', 'flash@esports.com', 1725),
('HeadshotHarry', 'harry@esports.com', 1550),
('StealthSniper', 'stealth@esports.com', 1680),
('BoomerangGamer', 'boomer@esports.com', 1590),
('MetaMage', 'mage@esports.com', 1850),
('CyberCrusader', 'crusader@esports.com', 1620),
('EliteAssassin', 'elite@esports.com', 1775),
('GlitchHunter', 'glitch@esports.com', 1610),
('RogueRanger', 'ranger@esports.com', 1695);

-- Insert Tournaments
INSERT INTO Tournaments (tname, game, max_players, start_date) VALUES
('Champions Cup', 'Valorant', 16, '2025-03-01'),
('Battle Royale Showdown', 'Fortnite', 32, '2025-03-10'),
('Ultimate Clash', 'League of Legends', 8, '2025-04-01'),
('Street Fight Masters', 'Tekken 8', 16, '2025-04-15'),
('Cosmic Arena', 'Super Smash Bros', 8, '2025-05-01');

-- Insert Tournament Registrations 
INSERT INTO Tournament_Registrations (tournament_id, player_id) VALUES
-- Champions Cup
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7), (1, 8),
-- Battle Royale Showdown
(2, 3), (2, 4), (2, 5), (2, 6), (2, 7), (2, 8), (2, 9), (2, 10),
-- Ultimate Clash
(3, 1), (3, 5), (3, 9), (3, 10), (3, 11), (3, 12),
-- Street Fight Masters
(4, 2), (4, 6), (4, 8), (4, 10), (4, 13), (4, 14), (4, 15),
-- Cosmic Arena
(5, 3), (5, 4), (5, 7), (5, 8), (5, 12), (5, 13), (5, 14);

-- Insert Matches 
INSERT INTO Matches (tournament_id, player1_id, player2_id, winner_id, match_date) VALUES
-- Champions Cup
(1, 1, 2, 2, '2025-03-02'),
(1, 3, 4, 3, '2025-03-03'),
(1, 5, 6, 5, '2025-03-04'),
(1, 7, 8, 7, '2025-03-05'),
-- Battle Royale Showdown
(2, 3, 4, 3, '2025-03-11'),
(2, 5, 6, 5, '2025-03-12'),
(2, 7, 8, 8, '2025-03-13'),
(2, 9, 10, 9, '2025-03-14'),
-- Ultimate Clash
(3, 1, 5, 1, '2025-04-02'),
(3, 9, 10, 10, '2025-04-03'),
-- Street Fight Masters
(4, 2, 6, 2, '2025-04-16'),
(4, 8, 10, 10, '2025-04-17'),
(4, 13, 14, 13, '2025-04-18'),
(4, 15, 2, 2, '2025-04-19'),
-- Cosmic Arena
(5, 3, 4, 4, '2025-05-02'),
(5, 7, 8, 8, '2025-05-03'),
(5, 12, 13, NULL, '2025-05-04'); -- Match pending

