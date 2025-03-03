CREATE DEFINER=`root`@`%` FUNCTION `getTournamentStatus`(tournament_id INT) RETURNS varchar(255) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE ts_status varchar(20);
    DECLARE tournament_date date;
    
    select start_date
    into tournament_date 
    from Tournaments 
    where tournament_id = ts_tournament_id;
    
    if tournament_date = CURDATE() then set ts_status = "ongoing";
    elseif tournament_date > curdate() then set ts_status = "completed";
    else set ts_status = "upcoming";
    end if;
RETURN ts_status;
END