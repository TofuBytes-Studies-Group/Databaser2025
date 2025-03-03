CREATE PROCEDURE `jointournament` (
	IN tr_tournament_id INT,
    IN tr_player_id INT
    )
BEGIN
	INSERT INTO Tournament_Registrations(tournament_id, player_id)
    VALUES (tr_tournament_id, tr_player_id);
END
