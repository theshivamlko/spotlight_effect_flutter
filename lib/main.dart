import 'package:flutter/material.dart';
import 'package:spotlight_effect_flutter/HomePage.dart';
import 'package:spotlight_effect_flutter/SpotlightEffect.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: SpotlightEffect(
            spotlightColor: Colors.red, // Adjust spotlight color
            child: BlogPost(
              title: 'The quick brown fox jumps over the lazy dog',
              imageUrl: 'https://miro.medium.com/v2/resize:fit:2000/format:webp/1*nlSy3ZCCbdUXFRH4Q1zstg.png',
              author: 'John Doe',
              content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut purus eget sapien egestas tincidunt \n'
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut purus eget sapien egestas tincidunt.'
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut purus eget sapien egestas tincidunt'
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut purus eget sapien egestas tincidunt'
                  '\n Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut purus eget sapien egestas tincidunt'
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut purus eget sapien egestas tincidunt',
              date: '2022-10-10',
            ),
          )
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
