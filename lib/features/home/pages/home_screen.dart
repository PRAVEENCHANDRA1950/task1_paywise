// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:task_one_paywise/features/onbording/data/models/user_model.dart';
import 'package:task_one_paywise/utils/services/shared_preff_methods.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserModel? userInfo;

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  getUserInfo() async {
    UserModel? val = await sharedPreffMethods.getUer();
    setState(() {
      userInfo = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Success Page",
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
          child: Container(
              color: Colors.green.withOpacity(0.1),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("User Name:"),
                                Text("${userInfo?.name}")
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Phone Number:"),
                                Text("${userInfo?.mobile}")
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }
}
