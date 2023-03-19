import 'dart:convert';

import 'package:api_asif/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<UserModel>> getUsers() async {
    final List<UserModel> users = [];
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body);
    for (var user in data) {
      users.add(UserModel.fromJson(user));
    }
    return users;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Hope API Works",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder(
        future: getUsers(),
        builder: (context, snapshot) => ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) => Text(
            snapshot.data![index].name.toString(),
          ),
        ),
      ),
    );
  }
}
