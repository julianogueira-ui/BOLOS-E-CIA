const container = document.querySelector('.todosCards');

// evita que textos digitados nos cadastros quebrem o HTML
function esc(texto) {
    const div = document.createElement('div');
    div.textContent = texto === null ? '' : texto;
    return div.innerHTML;
}

// GET /api/bolos -> SELECT com JOIN (BOLO, CATEGORIA, COBERTURA e USUARIO)
fetch('/api/bolos')
    .then((resposta) => resposta.json())
    .then((dados) => {
        container.innerHTML = '';

        dados.forEach(bolo => {
            const card = document.createElement('article');
            card.classList.add('bolo');

            card.innerHTML = `
                <img src="${esc(bolo.Imagem)}" alt="${esc(bolo.NomeBolo)}"
                     onerror="this.src='https://placehold.co/400x250?text=Bolo'">

                <div class="bolo-info">
                    <h3>${esc(bolo.NomeBolo)}</h3>
                    <p>${esc(bolo.Descricao)}</p>
                    <p><strong>Categoria:</strong> ${esc(bolo.Categoria)}</p>
                    <p><strong>Cobertura:</strong> ${esc(bolo.Cobertura)}</p>
                    <p><strong>Rende:</strong> ${esc(bolo.RendimentoPorcao)} porções &nbsp;|&nbsp;
                       <strong>Tempo:</strong> ${esc(bolo.TempoPreparo)} &nbsp;|&nbsp;
                       <strong>Nível:</strong> ${esc(bolo.Dificuldade)}</p>
                    <p><strong>Receita de:</strong> ${esc(bolo.Autor)}</p>

                    <div class="detalhes-completo" style="margin-top: 15px; text-align: left;">
                        <h4 style="color: #5c3d2e; margin-top: 10px;">Modo de Preparo do Bolo:</h4>
                        <p style="white-space: pre-line;">${esc(bolo.PreparoMassa)}</p>

                        <h4 style="color: #5c3d2e; margin-top: 10px;">Modo de Preparo da Cobertura:</h4>
                        <p style="white-space: pre-line;">${esc(bolo.PreparoCobertura)}</p>
                    </div>
                </div>
            `;

            container.appendChild(card);
        });
    })
    .catch((erro)=>console.error("Erro ao buscar os bolos.", erro));
