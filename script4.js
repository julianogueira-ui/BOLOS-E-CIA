class Bolo{
    constructor(nome, receita, preparo, recheio, receitaR, preparoR, imagemURL){
        this.nome = nome;
        this.receita = receita;
        this.preparo = preparo;
        this.recheio = recheio;
        this.receitaR = receitaR;
        this.preparoR = preparoR;
        this.imagemURL = imagemURL;
    }

    gerarHtml(){
        //function renderizarGaleria() {
    //colecao.innerHTML = ''; // Limpa antes de renderizar

   // galeria.forEach(bolo => {
        const cardHTML = `
            <div class="bolo">
                <img src="${bolo.foto}" alt="${bolo.bolo}" 
                     onerror="this.src='https://via.placeholder.com/300x200?text=Sem+Foto'">
                <h3>${bolo.bolo}</h3>
                <p><strong>Cobertura:</strong> ${bolo.cobertura}</p>
                <p><strong>Ingredientes do Bolo:</strong> ${bolo.ingredientebolo}</p>
                <p><strong>Modo de Preparo do Bolo:</strong> ${bolo.preparobolo}</p>
                <p><strong>Ingredientes da Cobertura:</strong> ${bolo.ingredientecobertura}</p>
                <p><strong>Modo de Preparo da Cobertura:</strong> ${bolo.preparocobertura}</p>
            </div>
        `;
        colecao.innerHTML += cardHTML;
    };//)
}
    //}
//}

//var teste1 = new Bolo("nome teste", "reiceita teste", "preparo teste", "recheio teste", "receitaR teste", "preparoR teste", "imagemURL teste")

