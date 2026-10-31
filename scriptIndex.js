const container = document.querySelector('.todosCards');
//console.log(container);

fetch('/api/lista')
    .then((resposta)=> resposta.json())
    .then((dados)=> {
        container.innerHTML = '';

        dados.forEach(Bolo => {
            container.innerHTML += `
            <div class="bolo">
                <img src="${Bolo.foto}" alt="${Bolo.bolo}" 
                     onerror="this.src='https://via.placeholder.com/300x200?text=Sem+Foto'">
                <h3>${Bolo.bolo}</h3>
                <p><strong>Cobertura:</strong> ${Bolo.cobertura}</p>
                <p><strong>Ingredientes do Bolo:</strong> ${Bolo.ingredientebolo}</p>
                <p><strong>Modo de Preparo do Bolo:</strong> ${Bolo.preparobolo}</p>
                <p><strong>Ingredientes da Cobertura:</strong> ${Bolo.ingredientecobertura}</p>
                <p><strong>Modo de Preparo da Cobertura:</strong> ${Bolo.preparocobertura}</p>
            </div>
            `;
        });
    })
    .catch((erro)=>console.error("Erro ao buscar os bolos.", erro));
