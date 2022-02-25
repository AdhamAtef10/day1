import 'package:flutter/material.dart';

class Password extends StatefulWidget {
  const Password({Key? key}) : super(key: key);

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool _isObscure=true;

@override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('password'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            obscureText: _isObscure,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter password';
              }
            },
            decoration: InputDecoration(
              hintText: 'password',
              suffixIcon:  IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}


