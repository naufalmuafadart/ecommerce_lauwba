import 'package:ecommerce/provider/auth_provider.dart';
import 'package:ecommerce/ui/auth_screen/login_screen.dart';
import 'package:ecommerce/ui/main_screen/subscreen/home/widgets/carousel.dart';
import 'package:ecommerce/ui/main_screen/subscreen/home/widgets/list_category.dart';
import 'package:ecommerce/ui/main_screen/subscreen/home/widgets/list_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeSubscreen extends StatefulWidget {
  @override
  State<HomeSubscreen> createState() => _HomeSubscreenState();
}

class _HomeSubscreenState extends State<HomeSubscreen> {
  AuthProvider? authProvider;

  onRefresh() {
    // fetchAllData();
  }

  @override
  void initState() {
    authProvider = Provider.of<AuthProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ecommerce"),
        actions: [
          IconButton(
              onPressed: () {
                // hapus semua data yang ada di shared preeferences
                authProvider!.destroyPref();

                // Kemudian kembali ke halaman login
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              icon: Icon(
                Icons.logout,
                color: Colors.red,
              )),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await onRefresh();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  carousel
            Carousel(),

            //  list category
            Container(
              margin: const EdgeInsets.fromLTRB(10, 20, 0, 0),
              child: Text(
                "Category",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),

            ListCategory(),

            //  list product
            Container(
              margin: const EdgeInsets.fromLTRB(10, 20, 0, 0),
              child: Text(
                "Products",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),

            ListProduct(),
          ],
        ),
      ),
    );
  }
}
