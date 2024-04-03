import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/booking_specialty_controller.dart';

class BookingSpecialtyView extends GetView<BookingSpecialtyController> {
  const BookingSpecialtyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookingSpecialtyView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BookingSpecialtyView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
