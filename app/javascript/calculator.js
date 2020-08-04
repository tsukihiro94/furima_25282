window.addEventListener('click', function(){


  const item_price = document.getElementById('item_price')
  const addTax = document.getElementById('add-tax-price')
  const profit = document.getElementById('profit')
  

    item_price.addEventListener('input', function(){

      if (item_price.value.match(/[^0-9]+/)) {
        addTax.textContent = '半角数字のみ入力可能';
        profit.textContent = '半角数字のみ入力可能';
      } else {
        const addTaxPrice = (item_price.value * 0.1)
        addTax.textContent =  Math.floor(addTaxPrice)
        profit.textContent =  Math.floor(item_price.value - addTaxPrice)
        
      }
    })
})

