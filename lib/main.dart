import 'package:flutter/material.dart';
import 'package:initial_task_1/features/home/home_screen.dart';
import 'package:initial_task_1/features/home/model/json_model.dart';
import 'package:initial_task_1/utils/config_json.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Initial Task',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        body: FutureBuilder<JsonData>(
          future: loadConfig(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomeScreen(data: snapshot.data!);
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}


