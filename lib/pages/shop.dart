import 'package:flutter/material.dart';
import 'package:flutter_todo/components/shoe_list.dart';
import 'package:flutter_todo/models/model_cart.dart';
import 'package:flutter_todo/models/model_shoe.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Shop());
}

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  void addShoeItemToCart(Mshoe shoe) {
    Provider.of<ModelCart>(context, listen: false).addItemsToCart(shoe);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        title: Text(
          "Successfully Added",
          style: TextStyle(
            fontSize: 20,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        content: Text(
          "Go to Cart...",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelCart>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Colors.white,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        autofocus: true,
                        cursorColor: Color.fromARGB(255, 99, 98, 98),
                        decoration: InputDecoration(
                          hintText: "Type here to search...",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 199, 191, 191),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 99, 98, 98),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.search,
                      size: 24,
                      color: Color.fromARGB(255, 99, 98, 98),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                "FOREVER FASTER IS ALWAYS FIRST, NEVER SECOND, NEVER THIRD.",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Hot Deals ",
                        style: TextStyle(
                          fontSize: 25,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                      const Text(
                        "🔥",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 24,
                        ),
                      )
                    ],
                  ),
                  const Text(
                    "See all",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  Mshoe shoe = value.getListOfShoes()[index];
                  return ShoeList(
                    shoe: shoe,
                    onTap: () => addShoeItemToCart(shoe),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
