function profit() {
  const path = location.pathname

  if (path === "/items/new" || path === "/items") {
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