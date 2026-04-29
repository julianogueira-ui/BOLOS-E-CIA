const formulario = document.getElementById('meuformulario');   
  formulario.addEventListener('submit', 
    function(evento){
  evento.preventDefault();
  const novo = {
    bolo: document.getElementById('bolo').value,
    cobertura: document.getElementById('cobertura').value,
   };
   const novoCard =`
      <div class = "bolo">
       <h3 id="bolo">${novo.bolo}</h3>
       <p>
      </div>

        
   `
   console.log(novoCard;)
  });
