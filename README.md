# 🚗 Gestor de Multas

Sistema completo para gerenciamento de **multas de veículos por placa**.  
Desenvolvido com **Node.js (Express)**, **MySQL** e um **frontend HTML + Bootstrap**, o projeto simula o fluxo de uma empresa que gerencia infrações de trânsito para seus clientes.

---

## ✨ Funcionalidades

- 🔍 Consulta de multas por placa de carro
- 📊 Visualização de estatísticas por placa
- 💾 Dados simulados com MySQL
- 🖥️ Interface simples e responsiva com Bootstrap
- 🔐 Estrutura pronta para expansão (login, dashboard, cadastro de multas)

---

## 🧱 Tecnologias utilizadas

- **Backend:** Node.js, Express.js, MySQL2
- **Frontend:** HTML, CSS (Bootstrap), JavaScript puro
- **Banco de Dados:** MySQL
- **Dev Tools:** Nodemon, Live Server (VSCode)

---

## ⚙️ Como rodar localmente

### 🔧 Pré-requisitos

- Node.js (v16+ recomendado)
- MySQL instalado e rodando localmente
- VS Code com extensão **Live Server**

---

### 📥 Clonando o projeto

```bash
git clone https://github.com/Luizinz00/gestor-de-multas
cd gestor-de-multas
```

---

### 📦 Instalando as dependências

```bash
npm install
```

---

### 🗃️ Configurando o banco de dados

1. Abra o MySQL Workbench
2. Crie um novo banco de dados chamado `gestor_multas`
3. Copie o conteúdo do arquivo `gestor_multas.sql`
4. Execute no Workbench para criar todas as tabelas e inserir dados de exemplo

---

### ⚙️ Configurando a conexão com o banco

No arquivo `index.js`, edite os dados de conexão com o MySQL:

```js
const db = mysql.createConnection({
  host: 'localhost',
  user: 'SEU_USUARIO_AQUI',    // ex: 'root'
  password: 'SUA_SENHA_AQUI',  // ex: '1234'
  database: 'gestor_multas'
});
```

---

### 🚀 Iniciando o servidor

```bash
npm run dev
```

A API estará disponível em:  
```
http://localhost:3000
```

---

### 🌐 Abrindo o frontend

1. Abra o arquivo `index.html` com **Live Server** no VSCode
2. Digite uma placa (ex: `ABC1D23`) e clique em "Buscar"
3. O sistema mostrará as multas e estatísticas daquela placa

---

## 📡 Endpoints da API

| Método | Rota                            | Descrição                               |
|--------|----------------------------------|------------------------------------------|
| GET    | `/api/multas/:placa`            | Retorna todas as multas da placa         |
| GET    | `/api/estatisticas/:placa`      | Retorna estatísticas filtradas por placa |

---

## 🧪 Dados de teste incluídos

O arquivo `gestor_multas.sql` inclui:

- 3 clientes fictícios
- 5 veículos registrados
- 10 multas simuladas
- 3 registros de pagamento

---

## 🗂️ Estrutura do projeto

```
gestor_multas/
├── static/
│   ├── css/style.css
│   └── js/script.js
├── gestor_multas.sql
├── index.html
├── index.js
├── package.json
├── package-lock.json
└── README.md
```

---

## 📌 Próximas melhorias

- [ ] Formulário para cadastro de novas multas
- [ ] Filtros por status (pendente, pago, recorrendo)
- [ ] Login de usuários e painel de administração
- [ ] Exportar dados para PDF
- [ ] Visualização com Chart.js
- [ ] Deploy no Render (API) + Vercel (Frontend)

---

## 🧠 Aprendizados

Esse projeto foi desenvolvido com foco em:

- Praticar integração entre backend, frontend e banco de dados
- Consolidar conhecimento em APIs REST e SQL
- Criar um sistema funcional e visual do zero
- Organizar o projeto para publicação no GitHub

---

## 📚 Licença

Projeto open-source para fins educacionais e portfólio.

---

## 🙋‍♂️ Autor

Desenvolvido por **Luís Henrique Lindoso**  
💼 Escritor e Programador  
📧 [luishenrik07@hotmail.com]  
🌎 [https://www.linkedin.com/in/luis-henrique-lindoso-1b97192bb/]
