const formulario = document.getElementById('meuformulario');
const lista = document.getElementById('lista');
const rota = lista.dataset.rota;
const campoId = lista.dataset.id;
const colunas = lista.dataset.colunas ? lista.dataset.colunas.split(',') : null;

// Preenche os <select> com dados do servidor (GET)
document.querySelectorAll('select[data-rota]').forEach((select) => {
    fetch(select.dataset.rota)
        .then((resposta) => resposta.json())
        .then((dados) => {
            dados.forEach((item) => {
                const opcao = document.createElement('option');
                opcao.value = item[select.dataset.valor];
                opcao.textContent = item[select.dataset.texto];
                select.appendChild(opcao);
            });
        })
        .catch((erro) => console.error("Erro ao carregar opções:", erro));
});

// Mostra os registros já cadastrados (GET)
function carregarLista() {
    fetch(rota)
        .then((resposta) => resposta.json())
        .then((dados) => {
            lista.innerHTML = '';

            dados.forEach((item) => {
                const card = document.createElement('article');
                card.classList.add('card-bolo');

                if (item.Imagem) {
                    const imagem = document.createElement('img');
                    imagem.src = item.Imagem;
                    imagem.onerror = () => { imagem.src = 'https://placehold.co/400x250?text=Bolo'; };
                    card.appendChild(imagem);
                }

                const conteudo = document.createElement('div');
                conteudo.classList.add('card-conteudo');

                const chaves = colunas || Object.keys(item).filter((k) => k !== campoId && k !== 'Imagem');
                chaves.forEach((chave, posicao) => {
                    const valor = item[chave] === null ? '—' : item[chave];
                    if (posicao === 0) {
                        const titulo = document.createElement('h3');
                        titulo.textContent = valor;
                        conteudo.appendChild(titulo);
                    } else {
                        const linha = document.createElement('p');
                        const rotulo = document.createElement('strong');
                        rotulo.textContent = chave + ': ';
                        linha.appendChild(rotulo);
                        linha.appendChild(document.createTextNode(valor));
                        conteudo.appendChild(linha);
                    }
                });

                const botao = document.createElement('button');
                botao.classList.add('btn-remover');
                botao.textContent = 'Remover';
                botao.addEventListener('click', () => remover(item[campoId]));
                conteudo.appendChild(botao);

                card.appendChild(conteudo);
                lista.appendChild(card);
            });
        })
        .catch((erro) => console.error("Erro ao buscar os registros.", erro));
}

// Remove um registro (DELETE)
function remover(id) {
    if (!confirm('Remover este registro?')) return;

    fetch(rota + '/' + id, { method: 'DELETE' })
        .then((resposta) => resposta.json())
        .then((resposta) => {
            if (resposta.status === 'sucesso') {
                carregarLista();
            } else {
                alert(resposta.mensagem);
            }
        })
        .catch((erro) => console.error("Erro ao remover:", erro));
}

// Cadastra um novo registro (POST)
formulario.addEventListener('submit', (evento) => {
    evento.preventDefault();

    const dados = Object.fromEntries(new FormData(formulario));

    fetch(rota, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(dados)
    })
    .then((resposta) => resposta.json())
    .then((resposta) => {
        if (resposta.status === 'sucesso') {
            alert("Cadastrado com sucesso!");
            formulario.reset();
            carregarLista();
        } else {
            alert(resposta.mensagem);
        }
    })
    .catch((erro) => console.error("Erro ao enviar:", erro));
});

carregarLista();
