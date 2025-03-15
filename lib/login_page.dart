import 'package:flutter/material.dart';
import 'package:latihan_kuis/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

bool isLoginSuccess = true;

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App bar untuk membuat judul pada halaman login, berada pada bagian atas
      appBar: AppBar(
        title: Row(
          children: [Icon(Icons.person), Text("Login Pages")],
        ),
      ),
      body: Column(
        children: [_usernameField(), _passwordField(), _loginButton(context)],
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          hintText: "Username",
          contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        enabled: true,
        obscureText: true,
        onChanged: (value) {
          password = value;
        },
        decoration: InputDecoration(
          hintText: "Password",
          contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: (isLoginSuccess) ? Colors.green : Colors.red,
        ),
        onPressed: () {
          String message = "";
          if (username == "admin" && password == "admin") {
            setState(() {
              message = "Login, Berhasil!";
              isLoginSuccess = true;
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (contex) => HomePage(
                            user: username,
                            judul: "Empty",
                            catatan: "Empty",
                          )));
            });
          } else {
            setState(() {
              message = "Login, Gagal!";
              isLoginSuccess = false;
            });
          }
          SnackBar snackBar = SnackBar(
            backgroundColor: (isLoginSuccess) ? Colors.green : Colors.red,
            content: Text(message),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text("LOGIN"),
      ),
    );
  }
}
