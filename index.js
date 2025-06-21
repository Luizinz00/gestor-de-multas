const express = require('express');
const cors = require('cors');
const mysql = require('mysql2');

const app = express();
const PORT = 3000;

app.use(cors());
app.use(express.json());

// CONEXÃO COM O BANCO DE DADOS
const db = mysql.createConnection({
  host: 'localhost',
  user: 'SEU_USUARIO_AQUI',    // ex: 'root'
  password: 'SUA_SENHA_AQUI',  // ex: '1234'
  database: 'gestor_multas',
  decimalNumbers: true
});

db.connect((err) => {
  if (err) {
    console.error('Erro na conexão com o banco:', err);
  } else {
    console.log('Conectado ao banco de dados MySQL!');
  }
});

// ROTA PRINCIPAL (PING)
app.get('/', (req, res) => {
  res.send('API do Gestor de Multas rodando! 🚗💥');
});

// 🔍 ROTA: Buscar multas por placa
app.get('/api/multas/:placa', (req, res) => {
  const { placa } = req.params;

  const query = `
    SELECT m.*, v.placa, c.nome AS cliente_nome
    FROM multa m
    JOIN veiculo v ON m.id_veiculo = v.id_veiculo
    JOIN cliente c ON v.id_cliente = c.id_cliente
    WHERE v.placa = ?;
  `;

  db.query(query, [placa], (err, results) => {
    if (err) {
      console.error('Erro ao buscar multas:', err);
      return res.status(500).json({ erro: 'Erro no servidor' });
    }

    res.json(results);
  });
});



// 📊 ROTA: Estatísticas gerais
app.get('/api/estatisticas/:placa', (req, res) => {
  const { placa } = req.params;

  const query = `
    SELECT 
      COUNT(*) AS total,
      SUM(CASE WHEN m.status = 'PENDENTE' THEN 1 ELSE 0 END) AS pendentes,
      SUM(CASE WHEN m.status = 'PAGO' THEN 1 ELSE 0 END) AS pagas,
      SUM(CASE WHEN m.status = 'RECORRENDO' THEN 1 ELSE 0 END) AS recorrendo
    FROM multa m
    JOIN veiculo v ON m.id_veiculo = v.id_veiculo
    WHERE v.placa = ?;
  `;

  db.query(query, [placa], (err, results) => {
    if (err) {
      console.error('Erro nas estatísticas por placa:', err);
      return res.status(500).json({ erro: 'Erro no servidor' });
    }

    res.json(results[0]);
  });
});


app.listen(PORT, () => {
  console.log(`🚀 Servidor rodando em http://localhost:${PORT}`);
});
