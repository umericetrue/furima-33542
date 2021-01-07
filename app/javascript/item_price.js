function calc() {
  const price = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  price.addEventListener("input", () => {
    const inputValue = price.value;
    tax.innerHTML = Math.floor(inputValue * 0.1);
    profit.innerHTML = Math.floor(inputValue * 0.9);
  });
}

window.addEventListener('load', calc);