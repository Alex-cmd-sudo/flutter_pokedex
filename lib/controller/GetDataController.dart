import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/GetDataModel.dart';
import 'package:get/get.dart';

class GetDataController extends GetxController {

  var isLoading = false.obs;
  final refFirebase = FirebaseDatabase.instance.ref();
  var getDataModel = GetDataModel(pokemon: []).obs;
  
  getDataFromFirebase() async {

    isLoading.value = true;
    
    try {      
      final snapshot = await refFirebase.get();
      
      if(snapshot.value != null && snapshot.value != ""){
        
          var jsonResult = json.encode(snapshot.value);
          
          final datax = json.decode(jsonResult);
          getDataModel.value = GetDataModel.fromJson(datax);                  
          
      }
      else{                
        Get.snackbar("Error", "No se recupero información, valide su conexion de internet.");
      }
      
    }     
    catch (e) {
      Get.snackbar("Error", "Ocurrio un error al consultar la información");
    }
    finally{
      isLoading.value = false;
    }

  }

  Color colorBoxPokemon(String tipo){

    tipo = tipo.replaceAll("Type.", "");
    Color color = Colors.greenAccent;
    try {
      switch(tipo){

      case "Bicho":
        color = Colors.lime;
      break;
      
      case "Planta":
        color = Colors.green;
      break;

      case "Agua":
        color = Colors.blueAccent;
      break;
      
      case "Veneno":
        color = Colors.purpleAccent;
      break;
      
      case "Fuego":
        color = Colors.redAccent;
      break;
      
      case "Volador":
        color = Colors.grey;
      break;

      case "Normal":
        color = Colors.greenAccent;
      break;

      case "Electrico":
        color = Colors.amber.withOpacity(0.9);
      break;      

      case "Lucha":
        color = Colors.orange;
      break;

      case "Psiquico":
        color = Colors.pinkAccent;
      break;

      case "Hielo":
        color = Color.fromARGB(255, 3, 88, 158);
      break;

      case "Fantasma":
        color = Colors.deepPurple;
      break;

      case "Roca":
        color = Colors.brown.withOpacity(0.5);
      break;

      case "Tierra":
        color = Colors.brown;
      break;

      case "Dragon":
        color = Colors.blueGrey;
      break;
      
      }
    } 
    catch (e) {
      Get.snackbar('Error', 'ocurrio un problema al intentar mostrar la información.');
    }
    finally{
      return color;
    }

    
  }

}