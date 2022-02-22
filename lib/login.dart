import 'package:flutter/material.dart';
import 'package:kamitrils/util_conn.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Text('Login'),
          Flexible(
            child: Center(
              child: Card(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 500,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ListView(
                      children: [
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'Email',
                          ),
                        ),
                        TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            hintText: 'Password',
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                                    "jika anda belum memiliki akun, silahkan ")),
                            TextButton(
                              child: Text("daftar"),
                              onPressed: () {
                                Navigator.pushNamed(context, '/register');
                              },
                            ),
                          ],
                        ),
                        MaterialButton(
                          child: Text('Login'),
                          onPressed: () {
                            Conn().login(_emailController.text,
                                _passwordController.text);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
