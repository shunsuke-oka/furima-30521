window.addEventListener('input', () => {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    const tax = inputValue * 0.1;
    const price_tax = Math.floor(tax);
    addTaxDom.innerHTML = `${price_tax}`

    const profit = document.getElementById("profit");
    const gain = inputValue - price_tax;
    profit.innerHTML = `${gain}`
  })
});
setInterval(check, 1000);