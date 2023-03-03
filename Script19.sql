SELECT * 
FROM Customer

-- PROJEÇÃO

-- Limite
SELECT *
FROM Customer
LIMIT 10;

-- Contador
SELECT COUNT(*)
FROM Customer

-- Colunas especificas
SELECT 
	FirstName,
	LastName,
	City
FROM Customer
LIMIT 10

-- Ordenação de Dados
SELECT 
	FirstName,
	LastName,
	City
FROM Customer
ORDER BY FirstName DESC
LIMIT 10

SELECT 
	FirstName,
	LastName,
	City
FROM Customer
ORDER BY 3 ASC

SELECT *
FROM Customer
ORDER BY 6 ASC

-- Apelidos e Alias
SELECT 
	FirstName as Nome,
	LastName as Sobrenome, 
	City as "Cidade do Cliente"
FROM Customer
ORDER BY Nome ASC
LIMIT 10

-- SELEÇÃO - FILTRO

SELECT *
FROM Album
WHERE Title = "Big Ones"
ORDER BY 2 ASC

-- Quando usar string deve se diferenciar maisculas e minusculas (case sensitive)

SELECT *
FROM Album
WHERE ArtistId = 17

-- Listando apenas valores não NULOS

SELECT *
FROM Album 
WHERE Column1 NOTNULL 

SELECT *
FROM Album 
WHERE Column1 is NULL 

SELECT COUNT (*)
FROM Album
 
-- Filtros com valores lógicos

SELECT *
FROM Album 
WHERE AlbumId >= 100
			
SELECT *
FROM Album 
WHERE AlbumId 
	BETWEEN 10 and 22 

SELECT *
FROM Album 
WHERE AlbumId >= 100
	AND ArtistId = 22
	
SELECT *
FROM Album 
WHERE AlbumId >= 100
	OR ArtistId = 22
	
-- USANDO O COMANDO LIKE, substitui o sinal de = e não é case sensitive, pode usar o % depois do termo.
	
SELECT *
FROM Album
WHERE Title LIKE "FACE%"
	
SELECT *
FROM Album
WHERE Title LIKE "LED%"

SELECT *
FROM Album
WHERE Title LIKE "%LIVE"

SELECT *
FROM Album
WHERE Title LIKE "%LOVE%"

SELECT *
FROM Album
WHERE Title LIKE "%BABY%"

SELECT *
FROM Artist 
WHERE Name LIKE "R_E_M_"

-- MANIPULACAO DE DADOS

SELECT * 
FROM Genre

SELECT *
FROM Genre
WHERE Name LIKE "MPB"
	
INSERT INTO Genre (GenreID, Name)
VALUES (NULL, "MPB")

-- ID 26

SELECT *
FROM Artist
ORDER BY Name 

INSERT INTO Artist (ArtistID, Name)
VALUES (NULL, "Toquinho")

SELECT *
FROM Artist
WHERE Name LIKE "Toquinho"

-- ID 276

SELECT COUNT(*)
FROM Track

SELECT *
FROM Track

INSERT INTO Track 
VALUES
(NULL, "Aquarela", NULL, 2, 26, 276, 344.000, 12.000, 0.99),
(NULL, "Aquarela e Arco Íris", NULL, 2, 26, 276, 314.000, 11.000, 1.99),
(NULL, "Aquarela e Beija Flor", NULL, 2, 26, 276, 274.000, 10.000, 2.99)

SELECT *
FROM Track
WHERE Name LIKE "%Aquarela%"

-- Atualização de Dados de uma Tabela

SELECT *
FROM Track
WHERE TrackID BETWEEN 3504 and 3506

UPDATE Track 
SET Composer = "Toquinho e Tinoco"
WHERE TrackID BETWEEN 3504 AND 3506

SELECT *
FROM Customer
WHERE Country LIKE "Bra_il"

UPDATE Customer 
SET Country = "Brasil"
WHERE Country LIKE "Brazil"

-- Exclusão de Registros - DELETE 

SELECT *
FROM Invoice

SELECT COUNT(*)
FROM Invoice

SELECT *
FROM Invoice
WHERE Total >= 10
	AND BillingCountry LIKE "Brazil"
	
SELECT *
FROM Invoice
WHERE BillingState = "SP"

DELETE 
FROM Invoice
WHERE Total >= 10
	AND BillingCountry LIKE "Brazil"
	
-- Junção dos Dados
	
SELECT *
FROM Album

SELECT *
FROM Artist

-- FORMA ERRADA DE FAZER A JUNÇÃO DE TABELAS
SELECT *
FROM Artist, Album

-- JOIN

SELECT
	Album.Title,
	Artist.Name
FROM Album
INNER JOIN Artist
	ON Album.ArtistId = Artist.ArtistId 
WHERE Name LIKE "The Police"

--- juntando 3 tabelas com JOIN 
SELECT
	Album.Title as "Título do Album",
	Artist.Name as "Nome do Artista",
	Track.Name as "Nome da Música" 
FROM Album
INNER JOIN Artist
	ON Album.ArtistId = Artist.ArtistId
INNER JOIN Track
	ON Track.AlbumId = Album.AlbumId 
WHERE "Nome do Artista" LIKE "Audioslave"

--- Criando uma Tabela

CREATE TABLE Alunos(
	AlunoID INTEGER PRIMARY KEY AUTOINCREMENT,
	Nome VARCHAR(30),
	Sobrenome VARCHAR(30),
	Matricula INTEGER
);

SELECT * 
FROM Alunos

--- Deletando uma tabela

DROP TABLE Alunos

--- INSERINDO DADOS NA TABELA

SELECT *
FROM Alunos

INSERT INTO Alunos (Nome, Sobrenome, Matricula)
	VALUES
		("Glauber", "Franco", 1721),
		("João", "Batista", 1214),
		("Paulo", "Tarso", 1628)