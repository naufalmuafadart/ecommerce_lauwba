import 'package:ecommerce/model/product/DetailProduct.dart';
import 'package:ecommerce/provider/product_provider.dart';
import 'package:ecommerce/ui/detail_product_screen/detail_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListProduct extends StatefulWidget {
  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  ProductProvider? productProvider;

  @override
  void initState() {
    // panggil product provider
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    productProvider!.fetchData();

    // lakukan req api list product
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Consumer<ProductProvider>(builder: (context, value, _) {
          // jika masih loading, maka muncul widget loading
          if (value.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (value.failed) {
            return Center(
              child: Text('Kesalahan terjadi...',
                  style: Theme.of(context).textTheme.bodyMedium),
            );
          }

          if (value.success) {
            return GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 2,
              ),
              children: List.generate(
                value.products!.length,
                (index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailProductScreen(
                            idProduct:
                                value.products![index].productId!.toInt(),
                            nameProduct: value.products![index].productName!,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      // height: 150,
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              value.products![index].productImage!,
                              height: 100,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    value.products![index].productName!,
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    "Rp ${value.products![index].productPrice!},-",
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}
