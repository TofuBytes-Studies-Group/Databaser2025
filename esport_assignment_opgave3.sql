-- Opgave 3 --
-- Stored procedures --
-- 3.1 -- 
CALL registerplayer ('Cyanide Sandy', 'menacetosociety@warcriminal.org', 1337);
-- 3.2 --
CALL jointournament ( 6, 16);
-- 3.3 -- 
CALL submitMatchResult (13, 17);
-- FUNCTIONS --
-- 3.1 --
SELECT getTotalWins(13);
-- 3.2 --
SELECT getTournamentStatus(7);
-- TRIGGERS --
-- 3.1 --
DELIMITER //
CREATE TRIGGER before_insert_registration
BEFORE INSERT ON Tournament_Registrations
FOR EACH ROW
BEGIN
	DECLARE player_count INT;
    
    Select count(*) into player_count
    from Tournament_Registrations
    where tournament_id = NEW.tournament_id;
    
    IF player_count >= (SELECT max_players 
						FROM Tournaments 
                        WHERE tournament_id = 
                        NEW.tournament_id) 
	THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Error: Tournament is full!'; 
    END IF;
END;
//
DELIMITER ;

CALL jointournament (5, 10);
-- 3.2 -- 
DELIMITER //
CREATE TRIGGER after_update_match_winner
AFTER UPDATE ON Matches
FOR EACH ROW
BEGIN
    IF NEW.winner_id IS NOT NULL AND OLD.winner_id IS NULL THEN
        UPDATE Players
        SET ranking = ranking + 30
        WHERE player_id = NEW.winner_id;
    END IF;
END;
//
DELIMITER ;
INSERT INTO Matches (tournament_id, player1_id, player2_id, winner_id, match_date) VALUES

(7, 16, 5, null,'2025-03-03');

 CALL submitMatchResult (16, 18);
