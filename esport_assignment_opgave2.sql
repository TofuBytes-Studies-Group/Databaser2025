-- SQL-FORESPØRGSLER opgaver:

-- 2.1:
Select * from Tournaments t where t.start_date between curdate() and date_add(curdate(), interval 30 day);

-- 2.2
select count(*) from Tournament_Registrations where player_id='5';

-- 2.3
select * from Players p left join Tournament_Registrations tr on p.player_id = tr.player_id where tr.tournament_id = 3;

-- 2.4 
WITH win_counts AS (
    SELECT winner_id, COUNT(*) AS wins
    FROM Matches
    WHERE tournament_id = 5
    GROUP BY winner_id
)
SELECT p.*
FROM Players p
JOIN win_counts wc ON p.player_id = wc.winner_id
WHERE wc.wins = (SELECT MAX(wins) FROM win_counts);
