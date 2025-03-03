CREATE PROCEDURE `registerplayer` (
	IN p_username VARCHAR(50),
    IN p_email VARCHAR(125),
    IN p_ranking INT 
)
BEGIN
	INSERT INTO Players (username, email, ranking)
    VALUES (p_username, p_email, p_ranking);
END