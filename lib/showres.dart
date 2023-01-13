import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_firstapp/home.dart';
import 'package:my_firstapp/api.dart' as api;

class ApiCall extends StatefulWidget {
  const ApiCall({Key? key}) : super(key: key);

  @override
  State<ApiCall> createState() => _ApiCallState();
}

class _ApiCallState extends State<ApiCall> {
  List<api.Posts> samplePosts = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            // itemCount: 2,
            itemCount: samplePosts.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.white,
                    margin: EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('pages/dharahara.jpg'),
                          radius: 45,
                          backgroundColor: Colors.pink,
                        ),
                        Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ' ${samplePosts[index].name}',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  '  Rs ${samplePosts[index].price}/-',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            // Text(
                            //   'Title: ${samplePosts[index].name}',
                            //   style: const TextStyle(fontSize: 18),
                            // ),
                            // Text(
                            //   'Body: ${samplePosts[index].description}',
                            //   style: const TextStyle(fontSize: 18),
                            // ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return HomePage();
                            }));
                          },
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<List<api.Posts>> getData() async {
    final response = await http.get(
      Uri.parse(
        'http://mark.bslmeiyu.com/api/getplaces',
      ),
    );

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        samplePosts.add(api.Posts.fromJson(index));
      }

      return samplePosts;
    } else {
      return samplePosts;
    }
  }
}
