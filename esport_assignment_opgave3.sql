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
