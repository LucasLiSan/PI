CREATE DEFINER=`root`@`localhost` PROCEDURE `mediaNotas` ()
BEGIN
	SELECT pontos.nomePonto, AVG(avaliacoesPontos.nota) AS media
    FROM pontos
    INNER JOIN pontosAvaliados ON pontos.id = pontosAvaliados.idPonto
    INNER JOIN avaliacoesPontos ON pontosAvaliados.idAvaliacao = avaliacoesPontos.id
    GROUP BY pontos.id, pontos.nomePonto;
END
