const container = document.querySelector('.todosCards');

// evita que textos digitados nos cadastros quebrem o HTML
function esc(texto) {
    const div = document.createElement('div');
    div.textContent = texto === null ? '' : texto;
    return div.innerHTML;
}

// GET /api/bolos/ingredientes -> SELECT com JOIN (BOLO, BOLO_INGREDIENTE e INGREDIENTE)
fetch('/api/bolos/ingredientes')
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
                    <p><strong>Tempo:</strong> ${esc(bolo.TempoPreparo)}</p>

                    <h4 style="color: #5c3d2e;">Ingredientes:</h4>
                    <p style="white-space: pre-line;">${bolo.Ingredientes ? esc(bolo.Ingredientes) : 'Nenhum ingrediente vinculado.'}</p>

                    <h4 style="color: #5c3d2e;">Modo de Preparo:</h4>
                    <p style="white-space: pre-line;">${esc(bolo.PreparoMassa)}</p>
                </div>
            `;

            container.appendChild(card);
        });
    })
    .catch((erro)=>console.error("Erro ao buscar as receitas.", erro));
