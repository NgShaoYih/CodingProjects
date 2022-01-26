/*Task 1*/
ALTER TABLE category ADD CONSTRAINT PK_CATEGORYID PRIMARY KEY (category_id);
ALTER TABLE language ADD CONSTRAINT PK_LANGUAGEID PRIMARY KEY (language_id);

ALTER TABLE film ADD CONSTRAINT UN_DESCRIPTION UNIQUE (description);

ALTER TABLE actor ADD CONSTRAINT CK_FNAME CHECK (first_name IS NOT NULL);
ALTER TABLE actor ADD CONSTRAINT CK_LNAME CHECK (last_name IS NOT NULL);
ALTER TABLE category ADD CONSTRAINT CK_CATNAME CHECK (name IS NOT NULL);
ALTER TABLE language ADD CONSTRAINT CK_LANNAME CHECK (name IS NOT NULL);
ALTER TABLE film ADD CONSTRAINT CK_TITLE CHECK (title IS NOT NULL);


ALTER TABLE film ADD CONSTRAINT CK_RELEASEYR CHECK (release_year <= 2020);
ALTER TABLE film ADD CONSTRAINT CK_RATING CHECK (rating = 'G' OR rating = 'PG' OR rating = 'PG-13' OR rating = 'R' OR rating = 'NC-17');
ALTER TABLE film ADD CONSTRAINT CK_SPFEATURES CHECK (special_features IS NULL OR special_features = 'Trailers' OR special_features = 'Commentaries' OR special_features = 'Deleted Scenes' OR special_features = 'Behind the Scenes');

ALTER TABLE film ADD CONSTRAINT FK_LANGUAGEID FOREIGN KEY (language_id) REFERENCES language (language_id);
ALTER TABLE film ADD CONSTRAINT FK_ORLANGUAGEID FOREIGN KEY (original_language_id) REFERENCES language (language_id);
ALTER TABLE film_actor ADD CONSTRAINT FK_ACTORID FOREIGN KEY (actor_id) REFERENCES actor (actor_id);
ALTER TABLE film_category ADD CONSTRAINT FK_CATEGORYID FOREIGN KEY (category_id) REFERENCES category (category_id);
ALTER TABLE film_category ADD CONSTRAINT FK_FIlMID2 FOREIGN KEY (film_id) REFERENCES film (film_id);

/*Task 2*/
CREATE SEQUENCE "FILM_ID_SEQ" MINVALUE 20010 MAXVALUE 999999999999 INCREMENT BY 10 START WITH 20010;

CREATE OR REPLACE TRIGGER "BI_FILM_ID" 
BEFORE INSERT ON "FILM" 
FOR EACH ROW 
BEGIN 
SELECT "FILM_ID_SEQ".NEXTVAL 
INTO :NEW.FILM_ID FROM DUAL; 
END;
/

CREATE OR REPLACE TRIGGER "BI_FILM_DESP" BEFORE INSERT ON "FILM" FOR EACH ROW
DECLARE 
	ORI_LANG VARCHAR2(20);
	RE_LANG VARCHAR2(20);
	SEQ_NO NUMBER;
BEGIN
SELECT name INTO ORI_LANG FROM language WHERE language_id = :NEW.original_language_id;
SELECT name INTO RE_LANG FROM language WHERE language_id = :NEW.language_id;
SELECT COUNT(*)+1 INTO SEQ_NO FROM film WHERE rating = :NEW.rating;
SELECT (:NEW.description || :NEW.rating || '-' || SEQ_NO || ': Originally in ' || ORI_LANG || '. Re-released in ' || RE_LANG || '.') INTO :NEW.description FROM DUAL;
END;
/

/*Task 3*/
SELECT f.title, f.length
FROM film f, film_category fc
WHERE fc.category_id = 1
ORDER BY length;

CREATE OR REPLACE VIEW MIN_ACTION_ACTORS AS
SELECT DISTINCT a.actor_id, a.first_name, a.last_name
FROM actor a, film_actor fa, film f
WHERE fa.film_id = (SELECT f.film_id 
					FROM film f, film_category fc
					WHERE fc.category_id = 1
					ORDER BY length;);

CREATE OR REPLACE VIEW V_ACTION_ACTORS_2012 AS
SELECT DISTINCT a.actor_id, a.first_name, a.last_name
FROM actor a, film_actor fa, film f, film_category fc
WHERE f.release_year = 2012
AND fc.category_id = 1;

CREATE MATERIALIZED VIEW MV_ACTION_ACTORS_2012 
BUILD IMMEDIATE
AS
SELECT DISTINCT a.actor_id, a.first_name, a.last_name
FROM actor a, film_actor fa, film f, film_category fc
WHERE f.release_year = 2012
AND fc.category_id = 1;

/*Task 4*/
SELECT *
FROM film
WHERE description LIKE '%Boat%'
ORDER BY film.title
FETCH FIRST 100 ROWS ONLY;

CREATE INDEX IDX_BOAT
ON film(description,title);

SELECT COUNT(film_id), release_year, rating, special_features
FROM film
GROUP BY release_year, rating,special_features;

/*Task 5*/
Analyze index PK_FILMID Validate Structure;

SELECT HEIGHT FROM INDEX_STATS;
SELECT LF_BLKS FROM INDEX_STATS;
SELECT BLKS_GETS_PER_ACCESS FROM INDEX_STATS;