CREATE TABLE Teams (
 team_id SERIAL PRIMARY KEY,
 team_name VARCHAR(100) NOT NULL,
 country VARCHAR(50),
 coach VARCHAR(100)
);


CREATE TABLE Players (
 player_id SERIAL PRIMARY KEY,
 player_name VARCHAR(100) NOT NULL,
 team_id INT,
 position VARCHAR(50),
 goals_scored INT,
 assists INT,
 FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);


CREATE TABLE Matches (
 match_id SERIAL PRIMARY KEY,
 home_team_id INT,
 away_team_id INT,
 home_goals INT,
 away_goals INT,
 stadium VARCHAR(100),
 FOREIGN KEY (home_team_id) REFERENCES
Teams(team_id),
 FOREIGN KEY (away_team_id) REFERENCES Teams(team_id)
);


CREATE TABLE Goals (
 goal_id SERIAL PRIMARY KEY,
 match_id INT,
 player_id INT,
 team_id INT,
 goal_type VARCHAR(50), -- Own Goal, Penalty, Open Play
 FOREIGN KEY (match_id) REFERENCES Matches(match_id),
 FOREIGN KEY (player_id) REFERENCES Players(player_id),
 FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);