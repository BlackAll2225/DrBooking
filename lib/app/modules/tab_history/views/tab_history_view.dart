import 'package:drbooking/app/base/base_view.dart';
import 'package:flutter/material.dart';


import '../controllers/tab_history_controller.dart';

class TabHistoryView extends BaseView<TabHistoryController> {
  const TabHistoryView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabHistoryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TabHistoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
