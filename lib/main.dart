import 'package:demo_one/signup.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 37, 127, 201)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _signInKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _signInKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget> [
          const FaIcon(FontAwesomeIcons.twitter, color: Colors.blue, size: 70,),
          const SizedBox(height: 20,),
          // const Image(image: AssetImage('assets/x.png'), width: 100,),
          const SizedBox(height: 20,),
          const Text("Log into Twitter", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
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
              debugPrint("Email $_passwordController.text");
            }
            }, child: const Text('Log in', style: TextStyle(color: Colors.white, fontSize: 18),))
          ),
          TextButton(onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp()));}, child: const Text("Don't have an account? Sign up here")),
        ],)
      ),
    );
  }
}