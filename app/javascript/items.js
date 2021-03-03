window.addEventListener('load', function(){
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  itemPrice.addEventListener('input', function(){
  const formPrice = itemPrice.value;
    addTaxPrice.innerHTML = Math.floor(formPrice/10);
    profit.innerHTML = Math.floor((formPrice/10)*9);
  });
});