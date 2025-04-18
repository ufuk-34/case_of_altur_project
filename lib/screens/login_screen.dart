import 'package:case_of_altur_project/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import '../element/buttons/butonlar_widget.dart';
import '../providers/auth_provider.dart';
import 'car_list_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController(text: "admin");
  final _passwordController = TextEditingController(text: "1234");

  void _login() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.login(username, password);

    if (authProvider.isAuthenticated) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const CarListScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Giriş başarısız')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.lock_outline, size: 80, color: Colors.black87),
              const SizedBox(height: 16),
              const Text(
                'Giriş Yap',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              heightSpace30,
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline),
                  labelText: 'Kullanıcı Adı',
                  border: OutlineInputBorder(),
                ),
              ),
             heightSpace15,
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  labelText: 'Şifre',
                  border: OutlineInputBorder(),
                ),
              ),
            heightSpace25,
              appButton(context,text:  'Giriş',onPressed: _login),

            heightSpace15,
              const Text("veya sosyal medya ile devam et", style: TextStyle(color: Colors.grey)),
              heightSpace15,
              SignInButton(
                Buttons.GoogleDark,
                onPressed: () {
                  // Google login işlemi
                },
              ),
            heightSpace10,
              SignInButton(
                Buttons.FacebookNew,
                onPressed: () {
                  // Facebook login işlemi
                },
              ),
          heightSpace15,
              TextButton(
                onPressed: () {},
                child: const Text("Şifremi Unuttum"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
