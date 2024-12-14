import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: const StartPage(),
    );
  }
}

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  // Extracted reusable text style for consistency
  TextStyle _textStyle({
    Color color = Colors.white,
    double fontSize = 17,
    FontWeight fontWeight = FontWeight.w400,
    double height = 0.08,
    double letterSpacing = -0.43,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  @override
  Widget build(BuildContext context) {
    int click = 0;
    return Scaffold(
      body: Container(
        // Background Colour
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF57C7DB), Color(0xFF0309C8)],
          ),
        ),
        child: Stack(
          children: [
            // Background Image
            Positioned.fill(
              top: -200,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/background_icon.png'), // Correct asset path
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            // Content Layer (Text and Button)
            Center(
                child: Container(
              padding: const EdgeInsets.only(
                top: 16.0,
                left: 24.0,
                right: 24.0,
                bottom: 24.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title Text
                  Text(
                    'Job Tracker',
                    style: _textStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Subtitle Text
                  Text(
                    'Your path to career success, tracked and managed.',
                    style: _textStyle(
                      color: Colors.white,
                      fontSize: 20,
                      height: 1.5,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  // Start Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle button press
                        click += 1; // Testing button clicks
                        Fluttertoast.showToast(
                            msg: "Sign Up: $click",
                            gravity: ToastGravity.BOTTOM);
                        context.go('/sign_up.dart');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      child: Text(
                        'Sign up',
                        style: _textStyle(
                          color: Color(0xFF0309C8),
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Sign In Link
                  GestureDetector(
                    onTap: () {
                      // Handle text press
                      click += 1; // Testing button clicks
                      Fluttertoast.showToast(
                          msg: "Sign In: $click", gravity: ToastGravity.BOTTOM);
                      //context.go('/lib/views/auth/sign_in.dart');
                    },
                    child: Text(
                      'Sign in',
                      style: _textStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
