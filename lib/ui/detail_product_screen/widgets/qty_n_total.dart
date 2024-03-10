import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/auth_provider.dart';
import '../../../provider/cart_provider.dart';

class QTYnTotal extends StatefulWidget {
  final int idProduct;
  const QTYnTotal({ required this.idProduct});
  @override
  State<QTYnTotal> createState() => _QTYnTotalState();
}

class _QTYnTotalState extends State<QTYnTotal> {

  // DetailProductProvider? productProvider;
  CartQuantity? quantity;
  AuthProvider? authProvider;
  NewCartProvider? newCartProvider;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // productProvider = Provider.of<DetailProductProvider>(context);
      quantity = Provider.of<CartQuantity>(context);
      authProvider = Provider.of<AuthProvider>(context);
      newCartProvider = Provider.of<NewCartProvider>(context);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (quantity == null || authProvider == null || newCartProvider == null) {
      return Container();
    }

    return Container(
      color: Colors.orange,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(quantity!.total.toString(), style: Theme.of(context).textTheme.titleLarge),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      quantity!.removeQty();
                    },
                    icon: Icon(Icons.remove),
                  ),
                  Text(
                    quantity!.qty.toString(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  IconButton(
                    onPressed: () {
                      quantity!.addQty();
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
              ),

              // jadi apakah masuk ke product screen untuk mengubah cart atau menambah cart?
              // untuk jawabannya ada di updateExistingCart pada cartProvider
              // yang terjadi perubahan status pada updateExistingCart itu pada saat user klik
              // tombol edit pada salah satu product di dalam cart screen
              ElevatedButton(
                onPressed: () async {
                  authProvider!.checkLoggedIn();

                  newCartProvider!.addToCart(userId: authProvider!.id!, productId: widget.idProduct, qty:quantity!.qty!);
                },
                child: Text("Add to cart"),
              ),
            ],
          )
        ],
      ),
    );
  }
}