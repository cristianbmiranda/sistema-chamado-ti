-- Inserção de usuários
INSERT INTO Usuarios (nome, email, setor) VALUES
('Ana Costa', 'ana@empresa.com', 'Administrativo'),
('Carlos Silva', 'carlos@empresa.com', 'RH');

-- Inserção de técnicos
INSERT INTO Tecnicos (nome, email, especialidade) VALUES
('Fernanda Lima', 'fernanda@empresa.com', 'Redes'),
('João Pedro', 'joao@empresa.com', 'Manutenção');

-- Abrindo um chamado
INSERT INTO Chamados (id_usuario, titulo, descricao, data_abertura, status)
VALUES (1, 'Problema com impressora', 'Impressora não está funcionando.', CURDATE(), 'Aberto');

-- Atribuindo técnico e resolvendo chamado
UPDATE Chamados 
SET id_tecnico = 2, 
    data_fechamento = CURDATE(), 
    status = 'Fechado', 
    solucao = 'Cabo USB desconectado. Reconectado e testado com sucesso.'
WHERE id_chamado = 1;

-- Consultas
-- Listar chamados abertos
SELECT * FROM Chamados WHERE status = 'Aberto';

-- Chamados por técnico
SELECT C.id_chamado, T.nome AS tecnico, C.titulo, C.status
FROM Chamados C
JOIN Tecnicos T ON C.id_tecnico = T.id_tecnico;
