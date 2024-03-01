import 'package:drbooking/app/base/base_view.dart';
import 'package:flutter/material.dart';


import '../controllers/home_controller.dart';

class HomeView extends BaseView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
