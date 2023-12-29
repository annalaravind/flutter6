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
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        title: Text(
          "Successfully Deleted",
          style: TextStyle(
            fontSize: 20,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        content: Text(
          "Go to Shop...",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
    );
  }

  ModelCart removeItem = ModelCart();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
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
