window.addEventListener('load', function(){
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  itemPrice.addEventListener('input', function(){
    // item-priceの金額（値）を取り、変数Aに代入。
  const formPrice = itemPrice.value;
    // innerHTMLで差し込みたいHTMLにMath.floorを使って計算（変数Aを使う）。
    addTaxPrice.innerHTML = Math.floor(formPrice/10);
    // innerHTMLで差し込みたいHTMLにMath.floorを使って計算（変数Aを使う）。
    profit.innerHTML = Math.floor((formPrice/10)*9);
  });
});