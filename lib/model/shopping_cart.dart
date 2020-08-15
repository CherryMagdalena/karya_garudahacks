class ShoppingCart {
  static List tocart = [];
  static List <int> qty = [];


  static int countTotalPrice(){
    int totalPrice =0;
    if (tocart.isEmpty)
    {
      return 0;
    }
    else {
      for(int i=0; i<ShoppingCart.tocart.length; i++){
        totalPrice = totalPrice +(tocart[i].price* qty[i]);

      }

    } print(totalPrice);
    return totalPrice;
  }
}