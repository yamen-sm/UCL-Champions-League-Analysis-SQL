-- SQL Questions

-- 1. Retrieve all players who have scored more than 5 goals.

-- SELECT 
-- 	* 
-- FROM 
-- 	players
-- WHERE 
-- 	goals_scored > 5



-- 2. Find the teams that have scored more goals at home than away.

-- SELECT
--     home_team_id,
--     away_team_id,
-- 	home_goals,
-- 	away_goals
-- FROM 
-- 	matches
-- WHERE 
-- 	away_goals > home_goals
-- ORDER BY
-- 	away_goals DESC 



-- 3. Show all matches where the home team scored 3 or more goals.

-- SELECT
--     match_id,
--     home_team_id,
--     home_goals
-- FROM
--     matches
-- WHERE
--     home_goals >= 3



-- 4. List players with NULL values in the assists column.

-- SELECT
--     *
-- FROM 
--     players
-- WHERE 
--     assists IS NULL



-- 5. Retrieve all teams that have at least one player with more than 10 assists.

-- SELECT 
--     t.team_id,
--     t.team_name
-- FROM
--     teams t
-- JOIN
--     players p ON t.team_id = p.team_id
-- WHERE
--     p.assists > 10



-- 6. Show the top 3 goal scorers along with their team names.

-- SELECT 
--     p.player_id,
--     p.player_name,
--     p.goals_scored,
--     t.team_name 
-- FROM
--     players AS p
-- JOIN 
--     teams AS t ON t.team_id = p.team_id
-- ORDER BY 
--     goals_scored DESC
-- LIMIT 3



-- 7. Find the teams that have never won a match.

-- WITH team_never_won AS(
--     SELECT home_team_id AS team_id
--     FROM matches
--     WHERE home_goals > away_goals
--     UNION
--     SELECT away_team_id AS team_id
--     FROM matches
--     WHERE away_goals > home_goals
-- )
-- SELECT 
--     t.team_id,
--     t.team_name
    
-- FROM 
--     teams AS t
-- LEFT JOIN 
--     team_never_won AS tw ON t.team_id = tw.team_id
-- WHERE 
--     tw.team_id IS NULL



-- 8. Retrieve the number of goals scored by each team in all matches.

-- SELECT 
--     t.team_name,
--     COUNT(*) AS total_goals_scored
-- FROM 
--     goals AS g
-- LEFT JOIN 
--     teams AS t ON t.team_id = g.team_id
-- GROUP By 
--     t.team_name



-- 9. Show all players who have scored at least one penalty.

-- SELECT 
--     p.player_id,
--     p.player_name,
--     g.goal_type 
-- FROM 
--     players AS p
-- LEFT JOIN 
--     goals AS g ON p.player_id = g.player_id
-- WHERE 
--     goal_type = 'Penalty'



-- 10. Retrieve all teams and the count of matches they have played.

-- SELECT 
--     t.team_id,
--     t.team_name,
--     COUNT(match_id) AS total_matches_played 
-- FROM 
--     teams as t
-- LEFT JOIN 
--     matches as m ON t.team_id = m.match_id
-- GROUP BY 
--     t.team_id



-- 11. List players who have scored an own goal.

-- SELECT 
--     p.player_id,
--     p.player_name,
--     g.goal_type 
-- FROM 
--     players AS p
-- LEFT JOIN 
--     goals AS g ON p.player_id = g.player_id
-- WHERE 
--     goal_type = 'Own Goal'



-- 12. Find the match with the highest total goals scored.

-- SELECT 
--     m.match_id,
--     COUNT(g.goal_id) AS total_goals
-- FROM 
--     matches AS m
-- LEFT JOIN 
--     goals AS g ON g.match_id = m.match_id
-- GROUP BY 
--     m.match_id
-- ORDER BY total_goals



-- 13. Show all players who haven't scored a goal yet.

-- SELECT 
--     goals_scored,
--     player_name
-- FROM
--     players
-- WHERE goals_scored IS NULL



-- 14. Retrieve teams along with the total number of goals scored by their players.

-- SELECT 
--     t.team_name,
--     SUM(p.goals_scored) AS total_goals_scored
-- FROM 
--     teams AS t
-- JOIN 
--     players AS p ON t.team_id = p.team_id
-- GROUP BY 
--     t.team_name



-- 15. Find the player with the highest goal contribution (goals + assists).

-- SELECT 
--     player_name,
--     (COALESCE(goals_scored, 0) + COALESCE(assists, 0)) AS total_contribution
-- FROM 
--     players
-- ORDER BY 
--     total_contribution DESC;



-- 16. List all players who have scored more than the average number
-- of goals.


-- WITH avg_goals AS (
--     SELECT AVG(goals_scored) AS avg_goals
--     FROM players
-- )
-- SELECT 
--     player_id,
--     player_name,
--     goals_scored
-- FROM 
--     players
-- WHERE 
--     goals_scored > (SELECT avg_goals FROM avg_goals);



-- 17. Retrieve the top 3 stadiums where the most goals have been scored.

-- SELECT
--     stadium,
--     (home_goals+away_goals) AS scored_goals
-- FROM 
--     matches
-- ORDER BY 
--     scored_goals DESC
-- LIMIT 3


-- 18. Show the number of matches each team has played as home and away teams.

-- SELECT 
--     t.team_id,
--     t.team_name,
--     COUNT(mh.match_id) AS home_matches,
--     COUNT(ma.match_id) AS away_matches
-- FROM 
--     teams AS t
-- LEFT JOIN 
--     matches AS mh ON t.team_id = mh.home_team_id
-- LEFT JOIN 
--     matches AS ma ON t.team_id = ma.away_team_id
-- GROUP BY 
--     t.team_id

-- 19. Find players who have scored in multiple match types (Open Play, Penalty, Own Goal).


-- SELECT 
--     p.player_id,
--     p.player_name,
--     COUNT(DISTINCT g.goal_type) AS goal_types_count
-- FROM 
--     players AS p
-- JOIN 
--     goals AS g ON p.player_id = g.player_id
-- WHERE 
--     g.goal_type IN ('Open Play', 'Penalty', 'Own Goal')
-- GROUP BY 
--     p.player_id, p.player_name
-- HAVING 
--     COUNT(DISTINCT g.goal_type) > 1

-- 20. Retrieve the team with the highest average goals per match.


-- SELECT 
--     t.team_id,
--     t.team_name,
--     COUNT(g.goal_id) AS avg_goals_per_match
-- FROM 
--     teams AS t
-- JOIN 
--     goals AS g ON t.team_id = g.team_id
-- GROUP BY 
--     t.team_id, t.team_name
-- ORDER BY 
--     avg_goals_per_match DESC
-- LIMIT 1
