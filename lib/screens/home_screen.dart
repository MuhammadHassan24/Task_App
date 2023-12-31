import 'dart:convert';
import 'package:chat_app/main.dart';
import 'package:chat_app/models/postmodel/postsmodel.dart';
import 'package:chat_app/screens/qrscan_screen.dart';
import 'package:chat_app/screens/webview.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  Future<List<PostsModel>> getPosts() async {
    List<PostsModel> allposts = [];
    var url = Uri.https("jsonplaceholder.typicode.com", "/posts");
    var respose = await http.get(url);
    var resposeBody = jsonDecode(respose.body);
    for (var i in resposeBody) {
      allposts.add(PostsModel.fromJson(i));
    }
    return allposts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text(
          "Home Page",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QRScanView()));
                },
                icon: const Icon(Icons.qr_code_scanner)),
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext bc) {
              return [
                PopupMenuItem(
                  child: Text("Theme"),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ThemeView())),
                ),
                // PopupMenuItem(
                //   child: Text("Language"),
                //   onTap: () => Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => LanguageView())),
                // ),
              ];
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder(
          future: getPosts(),
          builder: ((BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error : ${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text("${snapshot.data![index].userId}"),
                          subtitle: Text("${snapshot.data![index].title}"),
                        ),
                      ));
            } else {
              return Text("No Data Available");
            }
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
              context, MaterialPageRoute(builder: (context) => WebView()));
        },
        child: Center(child: Text("Web")),
      ),
    );
  }
}
