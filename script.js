function adicionarValores(){
 const formulario = document.getElementById('meuformulario');   
   formulario.addEventListener('submit', function(evento){
   evento.preventDefault();
   const tituloD = document.getElementById('bolo').value;
   const imagemD = document.getElementById('cobertura').value;
    const novo ={
        bolo: tituloD,
        cobertura: imagemD
    };

   
  });
}
