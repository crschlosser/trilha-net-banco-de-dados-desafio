-- DESAFIO DE PROJETO
SELECT * FROM Atores
SELECT * FROM Filmes
SELECT * FROM FilmesGenero
SELECT * FROM Generos
SELECT * FROM ElencoFilme




-- 1 - QUERY -> Buscar o nome e ano dos filmes
SELECT 
	F.Nome,
	F.Ano
FROM Filmes F

-- 2 - QUERY ->  Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
SELECT 
	F.Nome,
	F.Ano,
	F.Duracao
FROM Filmes F
ORDER BY F.Ano


-- 3 - QUERY -> Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
SELECT 
	F.Nome,
	F.Ano,
	F.Duracao
FROM Filmes F
WHERE F.Nome LIKE 'De Volta%'

-- 4 - QUERY -> Buscar os filmes lançados em 1997
SELECT 
	F.Nome,
	F.Ano,
	F.Duracao
FROM Filmes F
WHERE F.Ano = 1997

-- 5 - QUERY -> Buscar os filmes lançados APÓS o ano 2000
SELECT 
	F.Nome,
	F.Ano,
	F.Duracao
FROM Filmes F
WHERE F.Ano > 2000

-- 6 - QUERY -> Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
SELECT 
	F.Nome,
	F.Ano,
	F.Duracao
FROM Filmes F
WHERE F.Duracao>100 AND F.Duracao<150
ORDER BY F.Duracao

-- 7 - QUERY -> Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente
SELECT 
	F.Ano,
	COUNT(*) Quantidade
FROM Filmes F
GROUP BY F.Ano
ORDER BY Quantidade DESC

-- 8 - QUERY -> Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
SELECT 
	A.Id,
	A.PrimeiroNome,
	A.UltimoNome,
	A.Genero
FROM Atores A
WHERE A.Genero = 'M'

-- 9 - QUERY -> Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
SELECT 
	A.Id,
	A.PrimeiroNome,
	A.UltimoNome,
	A.Genero
FROM Atores A
WHERE A.Genero = 'F'
ORDER BY A.PrimeiroNome

-- 10 - QUERY -> Buscar o nome do filme e o gênero
SELECT 
	F.Nome,
	G.Genero
FROM Filmes F
INNER JOIN FilmesGenero FG ON F.Id = FG.IdFilme
INNER JOIN Generos G ON FG.IdGenero = G.Id

--INNER JOIN ElencoFilme EF ON F.Id = EF.IdFilme
--INNER JOIN  Atores A ON EF.IdAtor = A.Id

-- 11 - QUERY ->  Buscar o nome do filme e o gênero do tipo "Mistério"
SELECT 
	F.Nome,
	G.Genero
FROM Filmes F
INNER JOIN FilmesGenero FG ON F.Id = FG.IdFilme
INNER JOIN Generos G ON FG.IdGenero = G.Id
WHERE G.Genero='Mistério'

-- 12 - QUERY -> Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
SELECT 
	Filmes.Nome,
	Atores.PrimeiroNome,
	Atores.UltimoNome,
	ElencoFilme.Papel
FROM Filmes
INNER JOIN ElencoFilme ON Filmes.Id = ElencoFilme.IdFilme
INNER JOIN  Atores ON ElencoFilme.IdAtor = Atores.Id

-- QUERY EXTRA QUANDO NÃO HÁ 100% DE CORRRESPONDENCIAS
SELECT 
	Filmes.Nome,
	Atores.PrimeiroNome,
	Atores.UltimoNome,
	ElencoFilme.Papel,
	Generos.Genero

FROM Filmes
LEFT JOIN ElencoFilme ON Filmes.Id = ElencoFilme.IdFilme
LEFT JOIN  Atores ON ElencoFilme.IdAtor = Atores.Id
LEFT JOIN FilmesGenero ON Filmes.Id = FilmesGenero.IdFilme
LEFT JOIN Generos ON FilmesGenero.IdGenero = Generos.Id
