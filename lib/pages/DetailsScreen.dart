import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final heroTag;

  const DetailsScreen({super.key, this.heroTag});

  @override
  State<DetailsScreen> createState() => _nameState();
}

class _nameState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Stack(
        alignment: Alignment.center,
        children: [
          _arrowBack(),
          _nameNumberPokemon(),
          _typePokemon(),
          _backgroundPokeball(),
          Positioned(
              bottom: 0,
              child: Container(
                width: widthScreen,
                height: heightScreen * 0.6,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Container(
                              width: widthScreen * 0.3,
                              child: Text(
                                "Altura",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Container(
                              width: widthScreen * 0.3,
                              child: Text(
                                "55555",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Container(
                              width: widthScreen * 0.3,
                              child: Text(
                                "Peso",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Container(
                              width: widthScreen * 0.3,
                              child: Text(
                                "4444",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
          Positioned(
            top: (heightScreen * 0.2),
            child: Hero(
              tag: widget.heroTag,
              child: CachedNetworkImage(
                  imageUrl: 'http://www.serebii.net/pokemongo/pokemon/094.png',
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    ));
  }

  Widget _arrowBack() {
    return Positioned(
        top: 10,
        left: 5,
        child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            )));
  }

  Widget _nameNumberPokemon() {
    return Positioned(
        top: 70,
        left: 20,
        right: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Nombre",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Text("#" + "00",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold))
          ],
        ));
  }

  Widget _typePokemon() {
    return Positioned(
        top: 130,
        left: 20,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Fantasma",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ));
  }

  Widget _backgroundPokeball() {
    var heightScreen = MediaQuery.of(context).size.height;

    return Positioned(
        top: heightScreen * 0.10,
        right: 0,
        child: Image.asset(
          'images/pokeball.png',
          height: 200,
          fit: BoxFit.fitHeight,
        ));
  }


}
