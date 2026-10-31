class Bolo {
    constructor(bolo, cobertura, ingredientebolo, preparobolo, ingredientecobertura, preparocobertura, foto) {
        this.bolo = bolo
        this.cobertura = cobertura
        this.ingredientebolo = ingredientebolo
        this.preparobolo = preparobolo
        this.ingredientecobertura = ingredientecobertura
        this.preparocobertura = preparocobertura
        this.foto = foto
    }
}

const formulario = document.getElementById('meuformulario');

formulario.addEventListener('submit', (evento) => {
    evento.preventDefault();
    console.log("Formulário submetido!");

    const boloF = document.getElementById('bolo').value;
    const coberturaF = document.getElementById('cobertura').value;
    const ingredienteboloF = document.getElementById('ingredientebolo').value;
    const preparoboloF = document.getElementById('preparobolo').value;
    const ingredientecoberturaF = document.getElementById('ingredientecobertura').value;
    const preparocoberturaF = document.getElementById('preparocobertura').value;
    const fotoF = document.getElementById('foto').value;
    
    const novoBolo = new Bolo(boloF, coberturaF, ingredienteboloF, preparoboloF, ingredientecoberturaF, preparocoberturaF, fotoF)

    fetch('/api/lista', {
        method: 'POST',
        headers: { 
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(novoBolo)
    })
    .then(resposta => resposta.json())
    .then(() => {
        alert("Bolo cadastrado!");
        formulario.reset();
        window.location.href = 'index.html'
    })
    .catch(erro => console.error("Erro ao enviar:", erro));
});
