import 'package:app/constants.dart';
import 'package:app/screens/home/home_screen.dart';
import 'package:app/screens/login/login_screen.dart';
import 'package:app/screens/signin/siginin_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async{
   const firebaseConfig = FirebaseOptions(
    apiKey: "AIzaSyBZP_XNrhKNSDkdDukmUeTVnqJecPIDq5E",
    appId: "1:616663574960:web:eec8ac497244b472314e75",
    messagingSenderId: "616663574960",
    projectId: "etransportecarga-6e888",
  );
  if (kIsWeb) {
    await Firebase.initializeApp(options: firebaseConfig);
  } else {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Color.fromARGB(255, 224, 222, 218),
      ),
      initialRoute: '/login',
      routes: {
        '/login' :(context) => const LoginScreen(),
        '/signin' :(context) => const SigninScreen(),
        '/home_page' :(context) => const HomeScreen(),
      },
    );
  }
}

