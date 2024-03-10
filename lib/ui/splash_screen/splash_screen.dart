import 'package:ecommerce/provider/auth_provider.dart';
import 'package:ecommerce/ui/auth_screen/login_screen.dart';
import 'package:ecommerce/ui/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthProvider? authProvider;

  @override
  void initState() {
    authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider?.checkLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(builder: (context, value, _) {
        // cek apakah user sudah login atau belum
        // sudah login = true
        // belum login = false
        if (value.isLoggedIn) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            await Future.delayed(Duration(seconds: 3));
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => MainScreen()));
          });
        } else {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            await Future.delayed(Duration(seconds: 3));
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginScreen()));
          });
        }

        return Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/logo.png",
                    width: 150,
                    height: 150,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "Ecommerce",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 100),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text("Mohon tunggu..."),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        );
      }),
    );
  }
}
