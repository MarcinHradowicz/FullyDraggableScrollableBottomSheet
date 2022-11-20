import 'package:flutter/material.dart';
import 'package:fully_draggable_scrollable_bottom_sheet/widgets/common_draggable_scrollable_sheet.dart';
import 'package:fully_draggable_scrollable_bottom_sheet/widgets/improved_draggable_scrollable_sheet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fully DraggableScrollableSheet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  final bottomSheetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      body: Stack(
                        children: const [
                          PostPage(),
                          CommonDraggableScrollableSheet(),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: const Text('Common'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      body: Stack(
                        children: const [
                          PostPage(),
                          ImprovedDraggableScrollableSheet(),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: const Text('Improved'),
            ),
          ],
        ),
      ),
    );
  }
}

class PostPage extends StatelessWidget {
  const PostPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: const [
                CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://strapi-appunite.s3.eu-central-1.amazonaws.com/profile2_5cd8b49f59.jpeg'),
                ),
                SizedBox(width: 8),
                Text(
                  'Marcin Hradowicz',
                  style: TextStyle(color: Color(0xffB1B2ff), fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
            ),
          ],
        ),
      ),
    );
  }
}
