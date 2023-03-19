import 'dart:convert';

import 'package:api_asif/model/reqUser.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AnotherAPI extends StatefulWidget {
  const AnotherAPI({super.key});

  @override
  State<AnotherAPI> createState() => _AnotherAPIState();
}

class _AnotherAPIState extends State<AnotherAPI> {
  String? total;
  Future<List<UserRequest>> getApi() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=1'));
    var data = jsonDecode(response.body);
    List<UserRequest> users = [];

    for (var user in data['data']) {
      users.add(UserRequest.fromJson(user));
    }

    return users;
  }

  @override
  Widget build(BuildContext context) {
    getApi();

    print('object');
    return Scaffold(
      appBar: AppBar(
          title: Text(
        total.toString(),
        style: TextStyle(color: Colors.black),
      )),
      backgroundColor: Colors.orange[100],
      body: FutureBuilder(
        future: getApi(),
        builder: (context, snapshot) => ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  snapshot.data![index].firstName,
                  style: const TextStyle(color: Colors.black),
                ),
                Image.network(snapshot.data![index].avatar),
                const Divider(
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserRequest {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  UserRequest({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory UserRequest.fromJson(Map<String, dynamic> json) {
    return UserRequest(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'], // added getter for 'first_name'
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }
}
