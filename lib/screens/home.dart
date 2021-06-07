import 'package:flutter/material.dart';
import 'package:provider_andy_2/screens/settings.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WAXAPP"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Settings()));
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
