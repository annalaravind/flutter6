import 'package:flutter/material.dart';
import 'package:flutter_todo/models/model_cart.dart';
import 'package:flutter_todo/models/model_shoe.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CartItems extends StatefulWidget {
  Mshoe shoe;
  CartItems({
    super.key,
    required this.shoe,
  });

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  void removingItem(Mshoe shoe) {
    Provider.of<ModelCart>(context, listen: false)
        .removeItemsFromCart(widget.shoe);

    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text(
          "Successfully Deleted",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        content: Text("Go to Shop..."),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
    );
  }

  ModelCart removeItem = ModelCart();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: ListTile(
        leading: Image.asset(widget.shoe.imagePath),
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            widget.shoe.name,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(widget.shoe.price),
        ),
        trailing: IconButton(
          onPressed: () => removingItem(widget.shoe),
          icon: const Icon(
            Icons.delete,
          ),
        ),
      ),
    );
  }
}
