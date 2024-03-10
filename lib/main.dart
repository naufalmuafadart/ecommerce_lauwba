import 'package:ecommerce/provider/auth_provider.dart';
import 'package:ecommerce/provider/carousel_provider.dart';
import 'package:ecommerce/provider/cart_provider.dart';
import 'package:ecommerce/provider/category_provider.dart';
import 'package:ecommerce/provider/product_provider.dart';
import 'package:ecommerce/ui/auth_screen/login_screen.dart';
import 'package:ecommerce/ui/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // product
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => DetailProductProvider()),

        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => CarouselProvider()),

        // authentication
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),

        // quantity
        ChangeNotifierProvider(create: (context) => ListCartProvider()),
        ChangeNotifierProvider(create: (context) => NewCartProvider()),
        ChangeNotifierProvider(create: (context) => UpdateCartProvider()),
        ChangeNotifierProvider(create: (context) => DeleteCartProvider()),
        ChangeNotifierProvider(create: (context) => CartQuantity()),
      ],
      child: MaterialApp(
        title: 'Ecommerce Lauwba',
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
