import 'package:device_info_example/app/modules/home_tabs/hometabs.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return a centered text widget with a welcome message
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const HomeTabs()),
            );
          },
          child: Text(
            'Welcome to Flutter!',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }
}
