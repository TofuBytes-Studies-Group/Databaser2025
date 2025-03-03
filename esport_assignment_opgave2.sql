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
-- 2.5 --
    SELECT * FROM Matches m WHERE player1_id = 5 OR player2_id = 5;
-- 2.6 --
WITH joined_tourns AS (
    SELECT tournament_id
    FROM Tournament_Registrations
    WHERE player_id = 3
)
SELECT * from Tournaments tr
JOIN joined_tourns jt on tr.tournament_id = jt.tournament_id;
-- 2.7 --
select * from Players order by ranking desc limit 5;
-- 2.8 --
select avg(ranking) from Players;
-- 2.9 -- 
WITH min_five AS (
  select tournament_id 
  from Tournament_Registrations 
  group by tournament_id 
  having count(player_id) > 4
)
select * from Tournaments t
JOIN min_five mf on t.tournament_id = mf.tournament_id;
-- 2.10 --
select count(*) as 'total players in system'from Players;
-- 2.11 -- 
select * from Matches where winner_id is null;
-- 2.12 -- 
  select game, count(*) as popgame
  from Tournaments 
  group by game 
  having count(Tournaments.game)
  order by popgame desc;
  -- 2.13 --
  select * 
  from Tournaments
  order by created_at desc limit 5;
  -- 2.14 --
WITH turn_reg AS (
select player_id, count(*) as 'Players registered > 3 tournaments'
from Tournament_Registrations
group by player_id
having count(Tournament_Registrations.player_id) > 3
)
Select * from Players p
JOIN turn_reg tr on p.player_id = tr.player_id;
-- 2.15 -- 
select * from Matches m where tournament_id = 5

order by m.match_date;




