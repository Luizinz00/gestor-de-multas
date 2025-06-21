document.getElementById('searchForm').addEventListener('submit', function (e) {
  e.preventDefault();
  const placa = document.getElementById('placaInput').value.toUpperCase().trim();

  console.log("Placa digitada:", placa);

  if (!placa) {
    alert('Digite uma placa válida.');
    return;
  }

  buscarMultas(placa);
});

function buscarMultas(placa) {
  console.log("Buscando multas para:", placa);

  // 🔹 Multas
  fetch(`http://localhost:3000/api/multas/${placa}`)
    .then(res => {
      console.log("Resposta da API:", res);
      return res.json();
    })
    .then(data => {
      console.log("Dados recebidos:", data);

      const container = document.getElementById('resultado');

      if (data.length === 0) {
        container.innerHTML = `<div class="alert alert-warning">Nenhuma multa encontrada para <strong>${placa}</strong>.</div>`;
        return;
      }

      let html = `<h5>Multas da placa <strong>${placa}</strong>:</h5><ul class="list-group">`;

      data.forEach(multa => {
        html += `
          <li class="list-group-item">
            <strong>${multa.tipo_infracao}</strong><br>
            ${multa.descricao}<br>
            <small>Data: ${new Date(multa.data_infracao).toLocaleDateString()} | Valor: R$ ${parseFloat(multa.valor).toFixed(2)} | Status: ${multa.status}</small>
          </li>
        `;
      });

      html += '</ul>';
      container.innerHTML = html;
    })
    .catch(err => {
      console.error('Erro na busca:', err);
    });

  // 🔹 Estatísticas da PLACA
  fetch(`http://localhost:3000/api/estatisticas/${placa}`)
    .then(res => res.json())
    .then(est => {
      document.getElementById('totalMultas').textContent = est.total;
      document.getElementById('pendentes').textContent = est.pendentes;
      document.getElementById('pagas').textContent = est.pagas;
      document.getElementById('recorrendo').textContent = est.recorrendo;
    })
    .catch(err => {
      console.error('Erro nas estatísticas da placa:', err);
    });
}
