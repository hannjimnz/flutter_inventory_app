

import 'package:flutter/material.dart';
import '../database/db_helper.dart';
import 'inventario_screen.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen>{
  final _emailController = TextEditingController();
  final _passwordControler = TextEditingController();

  void _login() async{
    print("Funciona");
    final user = await DbHelper.loginUser(
      _emailController.text,
      _passwordControler.text,
    );
    if (user != null){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const InventarioScreen()),

      );
      print("usuario: $user");
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Usuario o contraseña incorrectos")),

      );
    }
  }

  void _register() async{
    await DbHelper.registerUser(
      _emailController.text,
      _passwordControler.text
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Usuario registrado con exito")),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email" ),

            ),
            TextField(
              controller: _passwordControler,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,

            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _login, child: const Text("Login")),
            ElevatedButton(onPressed: _register, child: const Text("Register")),
          ],
        ),
      ),

    );
  }

}