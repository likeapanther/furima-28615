window.addEventListener("turbolinks:load", () => {
  const priceInput = document.getElementById('item-price');
  
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const taxDom  = document.getElementById("add-tax-price");
    const addTaxDom  = document.getElementById("profit");
    let tax = Math.floor(inputValue/10);

    taxDom.innerHTML = tax;
    addTaxDom.innerHTML = Number(inputValue) - tax;
  });
});
