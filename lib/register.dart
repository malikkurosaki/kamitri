import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          Text('Register'),
          Flexible(
              child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 500),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: ListView(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Name',
                        ),
                      ),
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
                          Expanded(child: Text("jika anda sudah memiliki akun silahkan ")),
                          TextButton(
                            child: Text("Login"),
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
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
          ))
        ],
      ),
    );
  }
}
