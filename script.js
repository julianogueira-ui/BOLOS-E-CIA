const colecao = document.getElementById('colecao'); // Certifique-se que existe uma div com id="colecao" no HTML

let galeria = [];

const conteudoDaGaveta = localStorage.getItem("meusBolos");

if (conteudoDaGaveta) {
    galeria = JSON.parse(conteudoDaGaveta);
}
else{
  galeria = [];
}



// Renderiza a galeria ao carregar a página
renderizarGaleria();

// ==================== FORMULÁRIO ====================

const formulario = document.getElementById('meuformulario');

formulario.addEventListener('submit', function (evento) {
    evento.preventDefault();

    // Cria o novo objeto
    const novoBolo = {
        bolo: document.getElementById('bolo').value,
        cobertura: document.getElementById('cobertura').value,
        ingredientebolo: document.getElementById('ingredientebolo').value,
        preparobolo: document.getElementById('preparobolo').value,
        ingredientecobertura: document.getElementById('ingredientecobertura').value,
        preparocobertura: document.getElementById('preparocobertura').value,
        foto: document.getElementById('foto').value,
    };

    // Adiciona o novo bolo ao array
    galeria.push(novoBolo);

    // Salva no LocalStorage
    localStorage.setItem('meusBolos', JSON.stringify(galeria));

    // Renderiza novamente a galeria (incluindo o novo item)
    renderizarGaleria();

    // Limpa o formulário
    formulario.reset();

    // Opcional: feedback para o usuário
    alert('Bolo adicionado com sucesso!');
});
