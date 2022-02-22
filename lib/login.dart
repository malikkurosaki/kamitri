import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

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
                          decoration: InputDecoration(
                            hintText: 'Email',
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Password',
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(child: Text("jika anda belum memiliki akun, silahkan ")),
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
                            Navigator.pushNamed(context, '/home');
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
