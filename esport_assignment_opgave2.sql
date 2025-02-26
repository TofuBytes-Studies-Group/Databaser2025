-- SQL-FORESPØRGSLER opgaver:

-- 2.1:
Select * from Tournaments t where t.start_date between curdate() and date_add(curdate(), interval 30 day);

-- 2.2
select count(*) from Tournament_Registrations where player_id='5';

-- 2.3
select * from Players p left join Tournament_Registrations tr on p.player_id = tr.player_id where tr.tournament_id = 3;

-- 2.4
select * from Players p where (select MAX(count(*)) where p.player_id = m.winner_id);