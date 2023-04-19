
--SELECT *
--FROM software_houses
--WHERE country LIKE 'United States'

--SELECT *
--FROM players
--WHERE city LIKE 'Rogahnland' 

--SELECT *
--FROM players
--WHERE name LIKE '%a' 

--SELECT *
--FROM reviews
--WHERE player_id = 800

--SELECT COUNT(*)
--FROM tournaments
--WHERE year = 2015

--SELECT *
--FROM awards
--WHERE description LIKE '%facere%'

--SELECT DISTINCT videogame_id 
--FROM category_videogame
--WHERE category_id = 2 OR category_id = 6

--SELECT *
--FROM reviews
--WHERE rating >= 2 AND rating <= 4

--SELECT *
--FROM videogames
--WHERE YEAR(release_date) = 2020

--SELECT DISTINCT videogame_id
--FROM reviews
--WHERE rating = 5

--SELECT COUNT(*) AS Number , AVG(rating) AS Average
--FROM reviews
--WHERE videogame_id = 412

--SELECT COUNT(*) AS Videogames
--FROM videogames
--WHERE software_house_id = 1 AND YEAR(release_date) = 2018 

--SELECT country, COUNT(country)
--FROM software_houses
--GROUP BY country 

--SELECT COUNT(videogame_id)
--FROM reviews
--GROUP BY videogame_id 

--SELECT pegi_label_id, COUNT(*)
--FROM pegi_label_videogame 
--GROUP BY pegi_label_id 

--SELECT YEAR(release_date), COUNT(*) 
--FROM videogames
--GROUP BY year(release_date) 

--SELECT device_id, COUNT(*)
--FROM device_videogame
--GROUP BY device_id

--SELECT videogame_id, AVG(rating) as avg_rating
--FROM reviews
--GROUP BY videogame_id ORDER BY avg_rating DESC

--SELECT DISTINCT players.* 
--FROM players
--	JOIN reviews
--		ON reviews.player_id = players.id

--SELECT DISTINCT videogames.name
--FROM tournaments
--	JOIN tournament_videogame
--		ON tournament_videogame.tournament_id = tournaments.id
--	JOIN videogames
--		ON videogames.id = tournament_videogame.videogame_id
--WHERE tournaments.year = 2016

--SELECT videogames.name, categories.name
--FROM videogames
--	JOIN category_videogame
--		ON category_videogame.videogame_id = videogames.id
--	JOIN categories
--		ON category_videogame.category_id = categories.id

--SELECT DISTINCT software_houses.*
--FROM videogames
--JOIN software_houses
--	ON videogames.software_house_id = software_houses.id
--WHERE YEAR(videogames.release_date) >= 2020

--SELECT software_houses.name, awards.name
--FROM software_houses
--	JOIN videogames
--		ON videogames.software_house_id = software_houses.id
--	JOIN award_videogame
--		ON award_videogame.videogame_id = videogames.id
--	JOIN awards
--		ON award_videogame.award_id = awards.id

--SELECT DISTINCT videogames.name, categories.name, pegi_labels.name 
--FROM videogames
--	JOIN category_videogame
--		ON category_videogame.videogame_id  = videogames.id
--	JOIN categories
--		ON category_videogame.category_id = categories.id
--	JOIN pegi_label_videogame
--		ON pegi_label_videogame.videogame_id  = videogames.id
--	JOIN pegi_labels
--		ON pegi_label_videogame.pegi_label_id = pegi_labels.id
--	JOIN reviews
--		ON reviews.videogame_id = videogames.id
--WHERE reviews.rating >= 4

--SELECT DISTINCT v.id, v.name
--FROM videogames v
--JOIN tournament_videogame tv ON v.id = tv.videogame_id
--JOIN tournaments t ON tv.tournament_id = t.id
--JOIN player_tournament pt ON t.id = pt.tournament_id
--JOIN players p ON pt.player_id = p.id
--WHERE p.name LIKE 'S%'

--SELECT DISTINCT tournaments.city
--FROM tournaments
--	JOIN tournament_videogame
--		ON tournament_videogame.tournament_id  = tournaments.id
--	JOIN videogames
--		ON tournament_videogame.videogame_id  = videogames.id
--	JOIN award_videogame
--		ON award_videogame.videogame_id  = videogames.id
--	JOIN awards
--		ON award_videogame.award_id = awards.id
--WHERE award_videogame.year = 2018 AND awards.name LIKE 'Gioco dell''anno'

--SELECT players.name 
--FROM tournaments
--	JOIN tournament_videogame
--		ON tournament_videogame.tournament_id  = tournaments.id
--	JOIN player_tournament
--		ON player_tournament.tournament_id  = tournaments.id
--	JOIN players
--		ON player_tournament.player_id = players.id
--	JOIN videogames
--		ON tournament_videogame.videogame_id  = videogames.id
--	JOIN award_videogame
--		ON award_videogame.videogame_id  = videogames.id
--	JOIN awards
--		ON award_videogame.award_id = awards.id
--WHERE award_videogame.year = 2018 AND awards.name LIKE 'Gioco più atteso' AND tournaments.year  = 2019

--SELECT software_houses.*, videogames.* 
--FROM software_houses
--	JOIN videogames
--		ON videogames.software_house_id = software_houses.id 
--WHERE videogames.release_date = (SELECT MIN(videogames.release_date) FROM videogames)

--SELECT TOP 1 v.id, v.name, COUNT(r.id) as total_reviews
--FROM videogames v
--JOIN reviews r ON v.id = r.videogame_id
--GROUP BY v.id, v.name
--ORDER BY total_reviews DESC;

--SELECT TOP 1 software_houses.id, software_houses.name, COUNT(*) AS num_awards
--FROM software_houses
--INNER JOIN videogames ON software_houses.id = videogames.software_house_id
--INNER JOIN award_videogame ON videogames.id = award_videogame.videogame_id
--INNER JOIN awards ON award_videogame.award_id = awards.id
--WHERE award_videogame.year BETWEEN 2015 AND 2016
--GROUP BY software_houses.id, software_houses.name
--ORDER BY num_awards DESC;

--SELECT DISTINCT c.id AS category_id, c.name AS category_name
--FROM videogames v
--INNER JOIN reviews r ON v.id = r.videogame_id
--INNER JOIN category_videogame cv ON v.id = cv.videogame_id
--INNER JOIN categories c ON cv.category_id = c.id
--GROUP BY v.id, c.id, c.name
--HAVING AVG(r.rating) < 2