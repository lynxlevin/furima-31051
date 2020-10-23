function profit() {
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
window.addEventListener("load", profit);