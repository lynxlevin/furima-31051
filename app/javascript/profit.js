function profit() {
  const path = location.pathname

  // if (path === "/items/new" || path === "/items" || path === `/items/${location.pathname.match(/\d/)}/edit`) {
    if (checkPath(path)) {
    const priceInput = document.getElementById("item-price");
    priceInput.addEventListener("input", () => {
      const commission = parseInt(priceInput.value / 10);
      const profitValue = priceInput.value - commission;
      const addTaxPrice = document.getElementById("add-tax-price");
      addTaxPrice.innerHTML = `${commission}`;
      const profit = document.getElementById("profit");
      profit.innerHTML = `${profitValue}`;
    });
  }
}
window.addEventListener("turbolinks:load", profit);

function checkPath(path) {
  if (path === "/items/new") {return true};
  if (path === "/items") {return true};
  if (path === `/items/${location.pathname.match(/\d/)}/edit`) {return true};
  if (path === `/items/${location.pathname.match(/\d/)}`) {return true};
}