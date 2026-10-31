const express = require('express');
const app = express()

app.use(express.json());

app.use(express.static('site'));

let lista = [
    {
        bolo: "bolo 1", 
        cobertura: "Chocolate",
        ingredientebolo: "Farinha, Aveia, Banana",
        preparobolo: "Misture tudo",
        ingredientecobertura: "Chocolate, Manteiga",
        preparocobertura: "Coloque em fogo baixo",
        foto: "https://getImage.fic.com"
    },
    {
        bolo: "bolo 2", 
        cobertura: "Morango",
        ingredientebolo: "Massa pronta, Aveia, Banana",
        preparobolo: "Misture tudo",
        ingredientecobertura: "Morango, Manteiga",
        preparocobertura: "Coloque em fogo alto",
        foto: "https://getImage.fic.com"
    }
];

app.get('/api/lista', (dados, resposta) => {
    //console.log(res)
    resposta.json(lista);
});

app.post('/api/lista', (dados, resposta) => {
    const novoBolo = dados.body;
    lista.push(novoBolo);
    resposta.json({ status: "sucesso"});
});

app.listen(3000, () => {
    console.log("escutando na porta 3000");
});

