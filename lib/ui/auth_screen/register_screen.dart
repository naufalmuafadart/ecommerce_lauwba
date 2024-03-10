import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Column(
        children: [
          Image.asset("assets/logo.png", width: 150, height: 150,),
          TextFormField(
            decoration: InputDecoration(
                hintText: "Name",
                border: OutlineInputBorder()
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder()
            ),
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder()
            ),
          ),


          TextButton(
            onPressed: () {
              // Navigator.of(context).push(
              //     MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Text("Sudah punya akun? login sini!"),
          )
        ],
      ),
    );
  }
}