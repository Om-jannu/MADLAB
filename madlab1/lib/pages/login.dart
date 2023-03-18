import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:madlab1/pages/list.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  static Future<User?> LoginUsingEmailAndPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email');
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            child: Image(
              image: AssetImage('/images/loginHero.jpg'),
              fit: BoxFit.cover,
              height: 350,
            ),
          ),
          const SizedBox(
            height: 18.0,
          ),
          Center(
            child: Column(
              children: const [
                Text(
                  "MAD PWA Academy",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Login to your app",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28.0,
                      fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 18.0,
          ),
          TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
                hintText: "User Email Address",
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.black,
                )),
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextField(
            controller: _passwordController,
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: const InputDecoration(
                hintText: "User Password",
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.black,
                )),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 10.0,
            ),
            child: RawMaterialButton(
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 10.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              fillColor: Colors.blue[900],
              onPressed: () async {
                User? user = await LoginUsingEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text,
                    context: context);
                if (user != null) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Mylist()));
                }
              },
              child: const Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
