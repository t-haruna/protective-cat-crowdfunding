//寄付総額の自動計算 
$(function() {
  $(".Form__count").on('keyup', function(){ 
    let quantity = $( this ).val();
    // 口数の入力欄に入力された値を変数「quantity」に代入
    let price = $( ".return__price" ).text().replace(/[^0-9]/g, '');
    // 一口あたりの金額を変数「price」に代入
    let amount = Math.ceil(quantity * price);
    // 総額を計算し、計算結果を変数「amount」に代入
    $('#sales_commission_price').html(amount);
    // htmlメソッドを使って寄付総額を丸ごと書き換えます。
  });
});
