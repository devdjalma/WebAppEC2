function atualizar_homepage_relogio() {
  console.log("Updating time...");
  const relogio = document.getElementById("homepage_relogio");
  const dataHoje = new Date();
  const timeString = dataHoje.toLocaleDateString("pt-BR", {
    hour: "2-digit",
    minute: "2-digit",
    second: "2-digit"
  });
  relogio.textContent = timeString;
}

setInterval(atualizar_homepage_relogio, 1000);

atualizar_homepage_relogio();
