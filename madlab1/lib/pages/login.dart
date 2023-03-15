import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:madlab1/pages/list.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Future LoginUsingEmailAndPassword(
    {
      required String email,
      required String password,
      required BuildContext context,
    }
  )async{
    User? user;
    FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
    user = userCredential.user;
    return user;
  }
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("MAD PWA Academy",
            style: TextStyle(
              color: Colors.black,
              fontSize: 28.0,
              fontWeight: FontWeight.bold
            ),
            ),
            const SizedBox(
              height: 18.0,
            ),
            const Text("Login to your app",
              style: TextStyle(
                  color: Colors.black,
                  fontSize:30.0,
                  fontWeight: FontWeight.bold
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
                )
              ),
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
                  )
              ),
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
                onPressed: ()async{
                  User? user = await LoginUsingEmailAndPassword(
                    email: _emailController.text, 
                    password: _passwordController.text, 
                    context: context
                    ) as User?;
                    if(user != null){
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Mylist())
                      );
                    }
                },
                child: const Text ("Login",
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