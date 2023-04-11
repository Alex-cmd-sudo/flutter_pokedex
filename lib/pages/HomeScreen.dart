import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/pages/DetailsScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [_ImageBackground(), _TextTittle(), _DataApp(context)],
      ),
    ));
  }

  Widget _ImageBackground() {
    return Positioned(
      top: 10,
      right: 5,
      width: 150,
      child: Image.asset('images/icon.png', fit: BoxFit.fitWidth, width: 200),
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
                fontSize: 30)));
  }

  Widget _DataApp(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Positioned(
        top: 170,
        bottom: 0,
        width: width,
        child: Column(
          children: [
            Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1.4),
                    itemCount: 152,
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
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                color: Colors.greenAccent),
                            child: Stack(
                              children: [
                                _ImageDefault(),
                                _ImagePokemon(index),
                                _NamePokemon(),
                                _TypePokemon()
                              ],
                            ),
                          )
                        ),
                        onTap: () {
                          Navigator.push(
                            context, MaterialPageRoute(
                              builder: (_)=> DetailsScreen( heroTag: index) 
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
      child: Image.asset('images/pokeball.png',
          height: 85, fit: BoxFit.fitHeight),
    );
  }

  Widget _ImagePokemon(index) {
    return Positioned(
        bottom: 0,
        right: 0,
        child: Hero(
          tag: index,
          child: CachedNetworkImage(
            imageUrl: 'http://www.serebii.net/pokemongo/pokemon/094.png',
            height: 80,
            fit: BoxFit.fitHeight,
            placeholder: ((context, url) => Center(
                  child: CircularProgressIndicator(),
                )),
          ),
        )
    );
  }

  Widget _NamePokemon(){
    return Positioned(
      top: 20,
      left: 10,
      child: Text(
        "Gengar",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.white
        ),
        )
      );
  }

  Widget _TypePokemon(){
    return Positioned(
      top: 60,
      left: 15,
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
          child: Text(
              "Fantasma",
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                shadows: [
                  BoxShadow(
                    color: Colors.blueGrey,
                    offset: Offset(0, 0)
                  )
                ]
              ),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.black.withOpacity(0.5)
          ),
      )
    );
  }

}
