const express = require('express');
const mysql = require('mysql2/promise');
const app = express();

app.use(express.json());
app.use(express.static('site'));

// Conexão com o banco (ajuste usuário e senha do seu MySQL)
const banco = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '040809',
    database: 'mydb'
});

// ---------------------------------------------------------------
// SELECTs com JOIN (usados em 3 telas)
// ---------------------------------------------------------------

// Tela 1 - index.html (catálogo): BOLO + CATEGORIA + COBERTURA + USUARIO
const sqlBolos = `
    SELECT b.idBolo, b.NomeBolo, b.RendimentoPorcao, b.Dificuldade, b.TempoPreparo,
           b.Descricao, b.PreparoMassa, b.Imagem,
           ca.NomeCategoria AS Categoria,
           co.NomeCobertura AS Cobertura, co.PreparoCobertura,
           u.Nome AS Autor
    FROM BOLO b
    JOIN CATEGORIA ca ON ca.idCategoria = b.idCategoria
    JOIN COBERTURA co ON co.idCobertura = b.idCobertura
    JOIN USUARIO u ON u.idUsuario = b.idUsuario
    ORDER BY b.idBolo`;

// Tela 2 - receita.html: BOLO + BOLO_INGREDIENTE + INGREDIENTE
const sqlBolosIngredientes = `
    SELECT b.idBolo, b.NomeBolo, b.Imagem, b.TempoPreparo, b.PreparoMassa,
           GROUP_CONCAT(
               CONCAT(TRIM(TRAILING '.00' FROM bi.QuantidadeBolo), ' ', bi.UnidadeMedidaBolo, ' de ', i.NomeIngrediente)
               SEPARATOR '\n') AS Ingredientes
    FROM BOLO b
    LEFT JOIN BOLO_INGREDIENTE bi ON bi.idBolo = b.idBolo
    LEFT JOIN INGREDIENTE i ON i.idIngrediente = bi.idIngrediente
    GROUP BY b.idBolo, b.NomeBolo, b.Imagem, b.TempoPreparo, b.PreparoMassa
    ORDER BY b.idBolo`;

// Tela 3 - cobertura.html: COBERTURA + COBERTURA_INGREDIENTE + INGREDIENTE
const sqlCoberturas = `
    SELECT c.idCobertura, c.NomeCobertura, c.PreparoCobertura,
           GROUP_CONCAT(
               CONCAT(TRIM(TRAILING '.00' FROM ci.QuantidadeCobertura), ' ', ci.UnidadeMedidaCobertura, ' de ', i.NomeIngrediente)
               SEPARATOR '\n') AS Ingredientes
    FROM COBERTURA c
    LEFT JOIN COBERTURA_INGREDIENTE ci ON ci.idCobertura = c.idCobertura
    LEFT JOIN INGREDIENTE i ON i.idIngrediente = ci.idIngrediente
    GROUP BY c.idCobertura, c.NomeCobertura, c.PreparoCobertura
    ORDER BY c.idCobertura`;

app.get('/api/bolos/ingredientes', async (req, res) => {
    const [linhas] = await banco.query(sqlBolosIngredientes);
    res.json(linhas);
});

// ---------------------------------------------------------------
// CRUD das entidades (listar, cadastrar e remover)
// ---------------------------------------------------------------
const cadastros = {
    usuarios: {
        tabela: 'USUARIO', id: 'idUsuario',
        campos: ['Nome', 'Email'],
        sql: 'SELECT * FROM USUARIO ORDER BY idUsuario'
    },
    categorias: {
        tabela: 'CATEGORIA', id: 'idCategoria',
        campos: ['NomeCategoria'],
        sql: 'SELECT * FROM CATEGORIA ORDER BY idCategoria'
    },
    ingredientes: {
        tabela: 'INGREDIENTE', id: 'idIngrediente',
        campos: ['NomeIngrediente'],
        sql: 'SELECT * FROM INGREDIENTE ORDER BY idIngrediente'
    },
    coberturas: {
        tabela: 'COBERTURA', id: 'idCobertura',
        campos: ['NomeCobertura', 'PreparoCobertura'],
        sql: sqlCoberturas
    },
    bolos: {
        tabela: 'BOLO', id: 'idBolo',
        campos: ['idCobertura', 'idUsuario', 'idCategoria', 'NomeBolo', 'RendimentoPorcao',
                 'Dificuldade', 'Descricao', 'PreparoMassa', 'Imagem', 'TempoPreparo'],
        sql: sqlBolos
    }
};

Object.keys(cadastros).forEach((nome) => {
    const cad = cadastros[nome];

    app.get('/api/' + nome, async (req, res) => {
        const [linhas] = await banco.query(cad.sql);
        res.json(linhas);
    });

    app.post('/api/' + nome, async (req, res) => {
        try {
            const valores = cad.campos.map((campo) => req.body[campo]);
            const interrogacoes = cad.campos.map(() => '?').join(', ');
            await banco.query(
                `INSERT INTO ${cad.tabela} (${cad.campos.join(', ')}) VALUES (${interrogacoes})`,
                valores
            );
            res.json({ status: 'sucesso' });
        } catch (erro) {
            console.error(erro.message);
            res.status(400).json({ status: 'erro', mensagem: 'Não foi possível cadastrar.' });
        }
    });

    app.delete('/api/' + nome + '/:id', async (req, res) => {
        try {
            await banco.query(`DELETE FROM ${cad.tabela} WHERE ${cad.id} = ?`, [req.params.id]);
            res.json({ status: 'sucesso' });
        } catch (erro) {
            console.error(erro.message);
            res.status(400).json({ status: 'erro', mensagem: 'Registro em uso, não pode ser removido.' });
        }
    });
});

app.listen(3000, () => {
    console.log("escutando na porta 3000");
});
