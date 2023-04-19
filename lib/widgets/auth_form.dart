import 'dart:ui';

import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {

  final emailRegex = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  final _formKey = GlobalKey<FormState>();

  var _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';

  void _trySubmit(){
    final isValid = _formKey.currentState?.validate();
    FocusScope.of(context).unfocus();

    if(isValid == true){
      _formKey.currentState!.save();
      print('*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=');
      print(_userName);
      print(_userEmail);
      print(_userPassword);
      print('*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Card(
          shadowColor: Colors.grey[800],
          color: Colors.transparent.withOpacity(0.3),
          semanticContainer: true,
          margin: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    validator: (String? value){
                      if(value == null || value.isEmpty || !RegExp(emailRegex).hasMatch(value)){
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      labelStyle: TextStyle(color: Colors.grey[400]),
                    ),
                    style: const TextStyle(color: Colors.yellow),
                    onSaved: (value){
                      _userEmail = value!;
                    },
                  ),
                  if(!_isLogin)
                  TextFormField(
                    validator: (value){
                      if(value == null || value.length < 4 || value.isEmpty){
                        return 'Please enter al least 4 characters long username';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(color: Colors.grey[400]),
                    ),
                    onSaved: (value){
                      _userName = value!;
                    },
                    style: const TextStyle(color: Colors.orangeAccent),
                  ),
                  TextFormField(
                    validator: (value){
                      if(value == null || value.length < 5 || value.isEmpty){
                        return 'Password must be 5 characters long';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.grey[400]),
                    ),
                    onSaved: (value){
                      _userPassword = value!;
                    },
                    style: const TextStyle(color: Colors.yellow),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
                    onPressed: () {_trySubmit();},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: _isLogin ? Colors.blueAccent : Colors.greenAccent),
                    child: Text(
                      _isLogin ? 'Login' : 'SignUp',
                      style: TextStyle(color: _isLogin ? Colors.white : Colors.red),
                    ),
                  ),
                  TextButton(
                    child: Text(
                      !_isLogin ? 'Already a member?' : 'Create new Account',
                      style: const TextStyle(color: Colors.cyan),
                    ),
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
