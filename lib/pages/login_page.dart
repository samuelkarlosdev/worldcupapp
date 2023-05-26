import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:world_cup_app/controllers/login_controller.dart';

import '../components/login/custom_login_button_component.dart';
import '../widgets/custom_text_field_login_widget.dart';

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
            CustomTextFieldLoginWidget(
              label: 'Login',
              onChanged: _loginController.setLogin,
            ),
            CustomTextFieldLoginWidget(
              label: 'Senha',
              onChanged: _loginController.setPass,
              obscureText: true,
            ),
            const SizedBox(height: 15),
            CustomLoginButtonComponent(loginController: _loginController),
          ],
        ),
      ),
    );
  }
}
