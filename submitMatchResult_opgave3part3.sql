CREATE PROCEDURE `submitMatchResult` (
    IN m_winner_id INT,
    IN m_match_id INT
)
BEGIN
    UPDATE Matches
    SET winner_id = m_winner_id
    WHERE match_id = m_match_id;
END