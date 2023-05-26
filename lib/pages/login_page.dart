import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:world_cup_app/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginController _loginController = LoginController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.people, size: MediaQuery.of(context).size.height * 0.3),
            TextField(
              decoration: InputDecoration(
                label: Text('Login'),
              ),
              onChanged: _loginController.setLogin,
            ),
            TextField(
              decoration: InputDecoration(
                label: Text('Senha'),
              ),
              obscureText: true,
              onChanged: _loginController.setPass,
            ),
            const SizedBox(height: 15),
            ValueListenableBuilder<bool>(
              valueListenable: _loginController.inLoader,
              builder: (_, inLoader, __) => inLoader
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        _loginController.auth().then(
                          (result) {
                            if (result) {
                              Navigator.of(context)
                                  .pushReplacementNamed('/home');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      const Text('Falha ao realizar login!'),
                                  duration: const Duration(seconds: 5),
                                ),
                              );
                            }
                          },
                        );
                      },
                      child: Text('Login'),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
