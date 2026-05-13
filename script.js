const formulario = document.getElementById('meuformulario'); 

  formulario.addEventListener('submit', function (evento){
    evento.preventDefault();
    
    const bolo = {
    bolo: document.getElementById('bolo').value,
    cobertura: document.getElementById('cobertura').value,
    ingredientebolo: document.getElementById('ingredientebolo').value,
    preparobolo: document.getElementById('preparobolo').value,
    ingredientecobertura: document.getElementById('ingredientecobertura').value,
    preparocobertura: document.getElementById('preparocobertura').value,
    foto: document.getElementById('foto').value,
  };

    const cardHTML = `
        <div class="bolo">
            <img src="${bolo.foto}" alt="${bolo.bolo}" onerror="this.src='https://via.placeholder.com/300x200?text=Sem+Foto'">
            <h3>${bolo.bolo}</h3>
            <p><strong>Cobertura: </strong> ${bolo.cobertura}</p>
            <p><strong>Ingredientes do Bolo: </strong> ${bolo.ingredientebolo}</p>
            <p><strong>Modo de Preparo do Bolo: </strong> ${bolo.preparobolo}</p>
            <p><strong>Ingredientes da Cobertura: </strong> ${bolo.ingredientecobertura}</p>
            <p><strong>Modo de Preparo da Cobertura: </strong> ${bolo.preparocobertura}</p>
        </div>
    `;
    
    colecao.innerHTML+=cardHTML;
    formulario.reset()

});
