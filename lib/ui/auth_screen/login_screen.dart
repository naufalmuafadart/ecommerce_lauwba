import 'package:ecommerce/provider/auth_provider.dart';
import 'package:ecommerce/ui/global_widgets.dart';
import 'package:ecommerce/ui/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        children: [
          Image.asset(
            "assets/logo.png",
            width: 150,
            height: 150,
          ),
          TextFormField(
            controller: txtEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: "Email", border: OutlineInputBorder()),
          ),
          TextFormField(
            controller: txtPassword,
            obscureText: true,
            decoration: InputDecoration(
                hintText: "Password", border: OutlineInputBorder()),
          ),
          TextButton(
            onPressed: () {
              // Navigator.of(context).push(
              //     MaterialPageRoute(builder: (context) => RegisterScreen()));
            },
            child: Text("Belum punya akun? Daftar disini!"),
          ),
          Consumer<LoginProvider>(builder: (context, login, _) {
            // jika sedang login maka muncul tombol dengan gambar loading,
            // Jadi ketika sedang proses, tombol ini tidak melakukan apa2
            if (login.loading) {
              return ElevatedButton(
                  onPressed: () {
                    // proses login
                  },
                  child: CircularProgressIndicator());
            }

            // ketika gagal, maka muncul pesan error, tetapi tidak mengembalikan widget
            // jadi kalo mengembalikan widget nanti ada di proses selanjutnya

            return ElevatedButton(
                onPressed: () async {
                  // proses login
                  await login.submit(
                      email: txtEmail.text, password: txtPassword.text);

                  if (login.failed) {
                    showAlert(
                        status: AlertStatus.error,
                        message: login.message,
                        context: context);
                    login.reset();
                  }

                  if (login.success) {
                    showAlert(
                        status: AlertStatus.success,
                        message: login.message,
                        context: context);

                    // pindah ke halaman main
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => MainScreen()));
                  }
                },
                child: Text('Login'));
          }),
        ],
      ),
    );
  }
}
