import 'package:ecommerce/provider/product_provider.dart';
import 'package:ecommerce/ui/detail_product_screen/widgets/qty_n_total.dart';
import 'package:ecommerce/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../global_widgets.dart';

class DetailProductScreen extends StatefulWidget {
  final int idProduct;
  final String nameProduct;
  const DetailProductScreen(
      {Key? key, required this.idProduct, required this.nameProduct})
      : super(key: key);

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  Widget showDetail(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nameProduct),
      ),
      body: Consumer<DetailProductProvider>(
          builder: (context, value, _) {
            if (value.loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            // jika gagal, maka muncul widget error
            if (value.failed) {
              return Center(
                child: Text(
                  "Kesalahan terjadi...",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              );
            }


            if(value.success){
              return RefreshIndicator(
                onRefresh: () async {
                  await onRefresh();
                },
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        value.products!.productImage!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 250,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              value.products!.productName!,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              "Rp " + value.products!.productPrice!.toString(),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              value.products!.productStock!.toString() + " Stock Available",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Description",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              value.products!.productDesc!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                            ),
                            TextButton(
                              onPressed: () {
                                _showMoreDescription(context, value.products!.productDesc!);
                              },
                              child: const Text("+ Read More"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );

          }
      ),
      bottomNavigationBar: QTYnTotal(idProduct: widget.idProduct,),
      floatingActionButton: btnCart(context: context),
    );
  }

  _showMoreDescription(BuildContext context, String desc) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Text(
                    "Description",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(desc),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
          },
        );
    }

  DetailProductProvider? detailProductProvider;
  NewCartProvider? newCartProvider;
  CartQuantity? cartQty;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      detailProductProvider = Provider.of<DetailProductProvider>(context);
      detailProductProvider!.fetchData(id: widget.idProduct);
      newCartProvider = Provider.of<NewCartProvider>(context);
      cartQty = Provider.of<CartQuantity>(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: showDetail(context),
    );
  }
}
