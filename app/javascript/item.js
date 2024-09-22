const priceInput = document.getElementById("item-price");

// 商品価格の入力イベントにリスナーを追加
priceInput.addEventListener("input", () => {
  const inputValue = parseFloat(priceInput.value);  // 数値に変換

  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

  if (!isNaN(inputValue)) {
    const taxAmount = Math.floor(inputValue * 0.1);  // 販売手数料を計算
    const profit = Math.floor(inputValue - taxAmount);  // 販売利益を計算

    // 販売手数料と販売利益を表示
    addTaxDom.innerHTML = taxAmount.toLocaleString();
    profitDom.innerHTML = profit.toLocaleString();
  } else {
    addTaxDom.innerHTML = '';
    profitDom.innerHTML = '';
  }
});

// turbo:loadとturbo:render用の関数を定義
function updateTaxAndProfit() {
  const price = parseFloat(document.getElementById("item-price").value);  // 数値に変換
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

  if (!isNaN(price)) {
    const taxAmount = Math.floor(price * 0.1);  // 販売手数料を計算
    const profit = Math.floor(price - taxAmount);  // 販売利益を計算

    // 販売手数料と販売利益を表示
    addTaxDom.innerHTML = taxAmount.toLocaleString();
    profitDom.innerHTML = profit.toLocaleString();
  } else {
    addTaxDom.innerHTML = '';
    profitDom.innerHTML = '';
  }
}

window.addEventListener("turbo:load", updateTaxAndProfit);
window.addEventListener("turbo:render", updateTaxAndProfit);