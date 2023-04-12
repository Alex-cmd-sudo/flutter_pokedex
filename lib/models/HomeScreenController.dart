import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {

  final refFirebase = FirebaseDatabase.instance.ref();
  
  
  getData() async{

    try {

      final snapshot = await refFirebase.child('pokemon').get();

      Get.showSnackbar(GetSnackBar(message: 'ok'));
      Get.snackbar("ok", "ok");
    } 
    
    catch (e) {
      Get.snackbar("Error", "Ocurrio un error al consultar la información");
    }

  }

}