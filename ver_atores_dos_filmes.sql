DROP VIEW IF EXISTS ver_atores_dos_filmes;

CREATE VIEW ver_atores_dos_filmes AS
SELECT
	f.film_id,
    f.title,
    a.actor_id,
    CONCAT( a.first_name, ' ', a.last_name ) AS name
FROM film f 
INNER JOIN film_actor fa ON f.film_id=fa.film_id
INNER JOIN actor a ON a.actor_id=fa.actor_id;

SELECT * FROM ver_atores_dos_filmes;
