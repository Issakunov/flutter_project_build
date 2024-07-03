import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _signInKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _signInKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget> [
          const Image(image: AssetImage('assets/x.png'), width: 100,),
          const SizedBox(height: 20,),
          const Text("Sign up to Twitter", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          Container(
            margin: const EdgeInsets.fromLTRB(15, 30, 15, 0),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              decoration: const InputDecoration(border: InputBorder.none, hintText: "Enter an email", contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return "The form is empty";
                }
                return null;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextFormField(
            obscureText: true,
            controller: _passwordController,
            decoration: const InputDecoration(border: InputBorder.none, hintText: "Password", contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
            validator: (value) {
              if(value == null || value.isEmpty) {
                return "The form is empty";
              }else if(value.length < 8) {
                return "Password needs to be 8 or more characters!";
              }
              return null;
            },
          ),
          ),
          Container(
            width: 250,
            decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(30)),
            child: TextButton(onPressed: () {
            if(_signInKey.currentState!.validate()) {
              debugPrint("Email $_emailController.text");
              debugPrint("Password $_passwordController.text");
            }
            }, child: const Text('Sign up', style: TextStyle(color: Colors.white, fontSize: 18),))
          ),
          TextButton(onPressed: () {Navigator.of(context).pop();}, child: const Text("Already have an account? Sign in")),
        ],)
      ),
    );
  }
}