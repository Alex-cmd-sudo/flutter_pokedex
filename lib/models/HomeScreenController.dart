import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final refFirebase = FirebaseDatabase.instance.ref();

class HomeScreenController extends GetxController {   
  
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