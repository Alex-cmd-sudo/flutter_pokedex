import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/HomeScreenController.dart';
import 'package:flutter_pokedex/pages/DetailsScreen.dart';
import 'package:get/get.dart';

import '../controller/GetDataController.dart';

class HomeScreen extends StatefulWidget {  

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  final getDataController = Get.put(GetDataController());

  @override
  void initState(){
    getDataController.getDataFromFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(
        child: Scaffold(
        backgroundColor: Colors.white,
        body: !getDataController.isLoading.value ?
        Stack(
          children: [_ImageBackground(), _TextTittle(), _DataApp(context)],
        ) 
        : Center(
        child: CircularProgressIndicator(),
        ),
    )));
  }

  Widget _ImageBackground() {
    return Positioned(
      top: 30,
      right: 15,
      width: 100,
      child: Image.asset('images/icon.png', fit: BoxFit.fitWidth),
    );
  }

  Widget _TextTittle() {
    return Positioned(
        top: 60,
        left: 10,
        child: Text('Pokedex',
            style: TextStyle(
                color: Colors.red.withOpacity(0.9),
                fontWeight: FontWeight.bold,
                fontSize: 30
            )
        )
    );
  }

  Widget _DataApp(BuildContext context) {
    //var width = MediaQuery.of(context).size.width;

    return Positioned(
        top: 150,
        bottom: 0,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1.4),
                    itemCount: getDataController.getDataModel.value.pokemon.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        child: InkWell(
                          child: SafeArea(
                              child: Container(
                            margin: const EdgeInsets.only(left: 5, right: 5),
                            decoration:  BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                color: getDataController.colorBoxPokemon(getDataController.getDataModel.value.pokemon[index].type[0].toString())),
                            child: Stack(
                              children: [
                                _ImageDefault(),
                                _ImagePokemon(index),
                                _NamePokemon(index),                                        
                                _TypePokemonOne(index)
                                //_TypePokemon(index)
                                
                              ],
                            ),
                          )
                        ),
                        onTap: () {
                          Navigator.push(
                            context, MaterialPageRoute(
                              builder: (_)=> DetailsScreen( 
                                heroTag: index,
                                wPokeName: getDataController.getDataModel.value.pokemon[index].name,
                                wPokeTipo: getDataController.getDataModel.value.pokemon[index].type,
                                wPokeNum: getDataController.getDataModel.value.pokemon[index].num,
                                wPokeImg: getDataController.getDataModel.value.pokemon[index].img,
                                wPokeHeight: getDataController.getDataModel.value.pokemon[index].height,
                                wPokeWeight: getDataController.getDataModel.value.pokemon[index].weight,
                                wPokeColorBox: getDataController.colorBoxPokemon(getDataController.getDataModel.value.pokemon[index].type[0].toString())
                              ) 
                            )
                          );
                        },
                      ),
                    );
                  }))
          ],
        ));
  }

  Widget _ImageDefault() {
    return Positioned(
      bottom: 0,
      right: 0,      
      child: Image.asset('images/pokeball.png', height: 85, fit: BoxFit.fitHeight),
    );
  }

  Widget _ImagePokemon(index) {
    return Positioned(
        bottom: 0,
        right: 3,
        child: Hero(
          tag: index,
          child: CachedNetworkImage(
            imageUrl: getDataController.getDataModel.value.pokemon[index].img,
            height: 90,
            fit: BoxFit.fitHeight,
            placeholder: ((context, url) => Center(
                  child: CircularProgressIndicator(),
                )),
          ),
        )
    );
  }

  Widget _NamePokemon(index){
    return Positioned(
      top: 20,
      left: 10,
      child: Text(
        getDataController.getDataModel.value.pokemon[index].name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.white
        ),
        )
      );
  }

  Widget _TypePokemonOne(index){

        return Positioned(
        top: 60,
        left: 15,
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: Text(
                getDataController.getDataModel.value.pokemon[index].type[0].toString().replaceAll("Type.", ""),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  shadows: [
                    const BoxShadow(
                      color: Colors.blueGrey,
                      offset: Offset(0, 0)
                    )
                  ]
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: Colors.black.withOpacity(0.5)
            ),
        )
      ); 
    
  }

    Widget _TypePokemonTwo(index){

        return Positioned(
        top: 80,
        left: 15,
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: Text(
                getDataController.getDataModel.value.pokemon[index].type[1].toString().replaceAll("Type.", ""),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  shadows: [
                    const BoxShadow(
                      color: Colors.blueGrey,
                      offset: Offset(0, 0)
                    )
                  ]
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: Colors.black.withOpacity(0.5)
            ),
        )
      ); 
    
  }

}
