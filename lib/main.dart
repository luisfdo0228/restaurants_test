import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tyba_provider/screens/login.dart';
import 'package:provider/provider.dart';
import 'providers/provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return ChangeNotifierProvider( 
      create: (context)=>MyProvider(),
      child: MaterialApp(
        title: 'Email and password login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Login(),
      ),
    );

  }
}