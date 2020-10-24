window.addEventListener("turbolinks:load", () =>{
  const path = location.pathname
  if (checkPath(path)) {
    const priceInput = document.getElementById("item-price");
    printProfit(priceInput);
    priceInput.addEventListener("input", () => {
      printProfit(priceInput);
    });
  }
});

function checkPath(path) {
  if (path === "/items/new") {return true};
  if (path === "/items") {return true};
  if (path === `/items/${location.pathname.match(/\d/)}/edit`) {return true};
  if (path === `/items/${location.pathname.match(/\d/)}`) {return true};
}
function printProfit(priceInput) {
  const commission = parseInt(priceInput.value / 10);
  const profitValue = priceInput.value - commission;
  const addTaxPrice = document.getElementById("add-tax-price");
  addTaxPrice.innerHTML = `${commission}`;
  const profit = document.getElementById("profit");
  profit.innerHTML = `${profitValue}`;
}