window.addEventListener("load", item);

function item() {
  
  const itemPrice = document.getElementById("item-price")
  const itemTax = document.getElementById("add-tax-price")
  const itemProfit = document.getElementById("profit")
  console.log(itemPrice)
  itemPrice.addEventListener('input',function () {  
    
    const price = itemPrice.value;
    console.log(price)
    itemTax.innerHTML =  price * 0.1
    console.log(itemTax.innerHTM)
    itemProfit.innerHTML = price - (price * 0.1)
    console.log(itemProfit.innerHTM)
  })
}
