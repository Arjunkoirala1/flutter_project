import 'package:flutter/material.dart';
import 'package:my_firstapp/showres.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Image.asset(
              'pages/dharahara.jpg',
              width: double.infinity,
              height: 250,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ApiCall();
                      }));
                    },
                    child: Icon(
                      Icons.arrow_back,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'schyler',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Text(
              "write something",
            ),
            SizedBox(
              height: 200,
            ),
            Text(
              "its ak creation.",
            ),
          ],
        ),
      ),
    );
  }
}
