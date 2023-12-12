import 'package:flutter/material.dart';
import 'package:flutter_todo/models/model_shoe.dart';

class ModelCart extends ChangeNotifier {
  // List of shoes for sale
  List<Mshoe> listOfShoes = [
    Mshoe(
      name: "Puma RS",
      price: "₹420",
      description:
          "The responsive midsole offers excellent shock absorption...",
      imagePath: "lib/images/shoe1.png",
    ),
    Mshoe(
      name: "Puma Ignite",
      price: "₹400",
      description: "The sleek, minimalist design is complemented by a soft...",
      imagePath: "lib/images/shoe2.png",
    ),
    Mshoe(
      name: "Puma Cali",
      price: "₹450",
      description:
          "Crafted from premium leather, these shoes boast a polished finish and classic detailing...",
      imagePath: "lib/images/shoe3.png",
    ),
    Mshoe(
      name: "Puma Future Rider",
      price: "₹470",
      description:
          "The waterproof and breathable membrane keeps your feet dry in various weather conditions...",
      imagePath: "lib/images/shoe4.png",
    ),
  ];

  // List of items in user cart
  List<Mshoe> userCart = [];

  // Get list of shoes for sale
  List<Mshoe> getListOfShoes() {
    return listOfShoes;
  }

  // Get cart
  List<Mshoe> getUserCart() {
    return userCart;
  }

  // Add items to cart
  void addItemsToCart(Mshoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // Remove items from cart
  void removeItemsFromCart(Mshoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
