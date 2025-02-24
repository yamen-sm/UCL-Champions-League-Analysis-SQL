# ⚽ Football Statistics Analysis - SQL Project

## 📌 Project Overview

This project is a **Football Statistics Analysis** using SQL, focusing on querying and analyzing match data, player performance, and team statistics. The dataset consists of four main tables:

- **teams**: Stores team details, including name, country, and coach.
- **players**: Contains player information such as team affiliation, position, goals scored, and assists.
- **matches**: Records match results, including goals scored by home and away teams.
- **goals**: Tracks individual goal details, including player, match, team, and goal type.

The SQL queries in this project demonstrate various techniques such as **joins, filtering, aggregation, subqueries, and window functions** to extract valuable insights from the football dataset.

---

## 📂 Dataset Description

### **teams Table**

| Column       | Data Type | Description                     |
|-------------|----------|---------------------------------|
| team_id     | INT      | Unique identifier for each team |
| team_name   | VARCHAR  | Name of the team               |
| country     | VARCHAR  | Country the team is based in   |
| coach       | VARCHAR  | Team's head coach              |

### **players Table**

| Column       | Data Type | Description                           |
|-------------|----------|---------------------------------------|
| player_id   | INT      | Unique identifier for each player     |
| player_name | VARCHAR  | Player's full name                    |
| team_id     | INT      | Team the player belongs to            |
| position    | VARCHAR  | Player's position (e.g., Forward)     |
| goals_scored| INT      | Number of goals scored by the player  |
| assists     | INT      | Number of assists made by the player  |

### **matches Table**

| Column        | Data Type | Description                         |
|--------------|----------|-------------------------------------|
| match_id     | INT      | Unique identifier for each match    |
| home_team_id | INT      | Home team ID                        |
| away_team_id | INT      | Away team ID                        |
| home_goals   | INT      | Goals scored by the home team       |
| away_goals   | INT      | Goals scored by the away team       |
| stadium      | VARCHAR  | Stadium where the match was played  |

### **goals Table**

| Column    | Data Type | Description                              |
|----------|----------|------------------------------------------|
| goal_id  | INT      | Unique identifier for each goal         |
| match_id | INT      | Match in which the goal was scored      |
| player_id| INT      | Player who scored the goal (NULL for own goals) |
| team_id  | INT      | Team that scored the goal               |
| goal_type| VARCHAR  | Type of goal (Open Play, Penalty, Own Goal) |

---

## 🔍 SQL Queries Included

This project contains SQL queries that analyze various football statistics:

### **Basic Queries**
- Retrieve all players who have scored more than 5 goals.
- Show all matches where the home team scored at least 3 goals.

### **Filtering & Aggregation**
- Find teams that have never won a match.
- Retrieve the total number of goals scored by each team.

### **Joins & Subqueries**
- Find the top 3 goal scorers along with their team names.
- Retrieve all teams with at least one player having more than 10 assists.

### **Advanced Queries**
- Find players who have scored in multiple match types (Open Play, Penalty, Own Goal).
- Retrieve the team with the highest average goals per match.
- Identify players who have scored an own goal.
- Find the match with the highest total goals scored.

---

## ⚙️ How to Use

1. **Set Up the Database**
   - Import the `teams`, `players`, `matches`, and `goals` tables into your SQL environment.
   - Use the following SQL statements to create the tables:

     ```sql
     CREATE TABLE teams (
         team_id INT PRIMARY KEY,
         team_name VARCHAR(100),
         country VARCHAR(50),
         coach VARCHAR(100)
     );

     CREATE TABLE players (
         player_id INT PRIMARY KEY,
         player_name VARCHAR(100),
         team_id INT,
         position VARCHAR(50),
         goals_scored INT,
         assists INT,
         FOREIGN KEY (team_id) REFERENCES teams(team_id)
     );

     CREATE TABLE matches (
         match_id INT PRIMARY KEY,
         home_team_id INT,
         away_team_id INT,
         home_goals INT,
         away_goals INT,
         stadium VARCHAR(100),
         FOREIGN KEY (home_team_id) REFERENCES teams(team_id),
         FOREIGN KEY (away_team_id) REFERENCES teams(team_id)
     );

     CREATE TABLE goals (
         goal_id INT PRIMARY KEY,
         match_id INT,
         player_id INT,
         team_id INT,
         goal_type VARCHAR(50),
         FOREIGN KEY (match_id) REFERENCES matches(match_id),
         FOREIGN KEY (player_id) REFERENCES players(player_id),
         FOREIGN KEY (team_id) REFERENCES teams(team_id)
     );
     ```

   - Populate the tables with sample data or use your own dataset.

2. **Run Queries**
   - Execute the SQL scripts provided in this project to analyze player performance, match results, and team statistics.

3. **Modify and Extend**
   - Modify queries based on your specific needs and extend the analysis further.

---

## 📌 Technologies Used

- **SQL** (Structured Query Language)
- **RDBMS** (Compatible with MySQL, PostgreSQL, SQL Server, SQLite, etc.)

---

## 💡 Key Learnings

- Proficiency in **SQL joins (INNER, LEFT, RIGHT, FULL OUTER)** and **subqueries**.
- Using **aggregate functions (SUM, AVG, COUNT, MAX, MIN)** to extract insights.
- Implementing **HAVING and WHERE conditions** effectively.
- Filtering data using **GROUP BY, ORDER BY, and EXISTS**.
- Analyzing **team and player performance** using structured queries.

---

## 📄 README Summary

### **Football Statistics Analysis - SQL Project**

This project provides a structured approach to analyzing football statistics using SQL. It includes various queries to extract, filter, and aggregate match and player data. The dataset consists of four tables: `teams`, `players`, `matches`, and `goals`, containing detailed football-related information.

### **Getting Started**

1. **Prerequisites**
   - A relational database management system (RDBMS) such as MySQL, PostgreSQL, SQL Server, or SQLite.
   - Basic knowledge of SQL.

2. **Setting Up the Database**
   - Create and populate the tables using the provided schema.

3. **Running the Queries**
   - Execute the SQL queries to analyze team and player statistics.

4. **Modifying and Extending**
   - Modify and extend the queries as needed for additional insights.

### **Technologies Used**

- **SQL**: The primary language used for querying the database.
- **RDBMS**: Compatible with MySQL, PostgreSQL, SQL Server, SQLite, and other relational database systems.

### **Key Learnings**

- **SQL Joins**: Using different types of joins to combine data.
- **Aggregate Functions**: Performing calculations with SUM, AVG, COUNT, etc.
- **Filtering & Subqueries**: Extracting specific insights from the dataset.
- **Performance Analysis**: Analyzing player and team performance efficiently.

