import 'package:flutter/material.dart';
import 'package:flutter_todo/components/cart_items.dart';
import 'package:flutter_todo/models/model_cart.dart';
import 'package:flutter_todo/models/model_shoe.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Cart());
}

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelCart>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "My Cart",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: value.getUserCart().length,
                  itemBuilder: (context, index) {
                    Mshoe indiviualItem = value.getUserCart()[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CartItems(
                        shoe: indiviualItem,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
