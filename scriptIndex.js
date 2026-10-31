const container = document.querySelector('.todosCards');
//console.log(container);

fetch('/api/lista')
    .then((resposta)=> resposta.json())
    .then((dados)=> {
        container.innerHTML = '';

        dados.forEach(bolo => {
            const card = document.createElement('article');
            card.classList.add('bolo');

            const imagem = bolo.foto || 
                'https://placehold.co/400x250?text=Bolo';

            card.innerHTML = `
                <img src="${imagem}" alt="${bolo.foto}"
                     onerror="this.src='https://placehold.co/400x250?text=Bolo'">

                <div class="bolo-info">
                    <h3>${bolo.bolo}</h3>
                    <p><strong>Cobertura:</strong> ${bolo.cobertura}</p>

                    <div class="detalhes-completo" style="margin-top: 15px; text-align: left;">
                        <h4 style="color: #5c3d2e; margin-top: 10px;">Ingredientes do Bolo:</h4>
                        <p style="white-space: pre-line;">${bolo.ingredientebolo}</p>

                        <h4 style="color: #5c3d2e; margin-top: 10px;">Modo de Preparo do Bolo:</h4>
                        <p style="white-space: pre-line;">${bolo.preparobolo}</p>

                        <h4 style="color: #5c3d2e; margin-top: 10px;">Ingredientes da Cobertura:</h4>
                        <p style="white-space: pre-line;">${bolo.ingredientecobertura}</p>

                        <h4 style="color: #5c3d2e; margin-top: 10px;">Modo de Preparo da Cobertura:</h4>
                        <p style="white-space: pre-line;">${bolo.preparocobertura}</p>
                    </div>
                </div>
            `;

            container.appendChild(card);
        });
    })
    .catch((erro)=>console.error("Erro ao buscar os bolos.", erro));
