const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
const tax = Math.floor(inputValue * 0.1);
const addTaxDom = document.getElementById("add-tax-price");
addTaxDom.innerHTML = tax;
const profitNumber = document.getElementById("profit");
profitNumber.innerHTML = inputValue - tax;
})
