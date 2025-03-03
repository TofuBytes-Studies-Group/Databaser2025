CREATE DEFINER=`root`@`%` FUNCTION `getTotalWins`(player_id INT) RETURNS int
    DETERMINISTIC
BEGIN
DECLARE win_count INT;
	select count(*) 
    INTO win_count
	from Matches 
	where winner_id = player_id;
    
RETURN win_count;
END