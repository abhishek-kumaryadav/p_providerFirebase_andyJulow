import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_andy_2/providers/settings_provider.dart';
import 'package:provider_andy_2/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SettingsProvider(), //ADD PROVIDER,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ANDY JULOW CHANGE NOTIFIER',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.lightBlueAccent,
        ),
        home: Home(),
      ),
    );
  }
}
