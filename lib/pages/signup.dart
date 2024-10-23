import 'package:flutter/material.dart';
import 'package:iotproj/pages/login.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  void _navigateToLogin() {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 600),
        pageBuilder: (context, animation, secondaryAnimation) =>
            const LoginPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var fadeAnimation = CurvedAnimation(parent: animation, curve: curve);

          return SlideTransition(
            position: animation.drive(tween),
            child: FadeTransition(
              opacity: fadeAnimation,
              child: child,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Color.fromARGB(255, 28, 218, 60),
                Color.fromARGB(255, 136, 209, 139),
                Color.fromARGB(255, 148, 231, 93),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 80),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Sign Up with MoldShield Tomorrow!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // This Container will take the remaining height
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 47),
                  child: Column(
                    children: <Widget>[
                      const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 60),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(90, 82, 77, 0.459),
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: const Column(
                          children: <Widget>[
                            TextField(
                              decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 143, 142, 142)),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(16),
                              ),
                            ),
                            Divider(color: Colors.grey),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 143, 142, 142)),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(16),
                              ),
                            ),
                            Divider(color: Colors.grey),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Confirm Password",
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 143, 142, 142)),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        height: 50,
                        color: const Color.fromARGB(255, 136, 209, 139),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Center(
                          child: Text(
                            "SIGN UP",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text("Already have an account?"),
                          TextButton(
                            onPressed: _navigateToLogin,
                            child: const Text("Sign In"),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20), // Add some bottom spacing
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
