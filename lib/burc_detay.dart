import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_burc_rehberi/burc_liste.dart';
import 'package:palette_generator/palette_generator.dart';
import 'models/burc.dart';

class BurcDetay extends StatefulWidget {
  int gelenIndex;

  BurcDetay(this.gelenIndex);

  @override
  _BurcDetayState createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Burc secilenIndex;
  Color baskinRenk;
  PaletteGenerator paletteGenerator;

  @override
  void initState() {
    super.initState();
    secilenIndex = BurcListesi.tumBurclar[widget.gelenIndex];
    baskinRengiBul();
  }

  void baskinRengiBul() {
    Future<PaletteGenerator> fPaletGenerator =
        PaletteGenerator.fromImageProvider(
            AssetImage("images/" + secilenIndex.burcTarihi));
    ////ÖNEMLİ: burcTarihi ile burcBuyukResim neslerini ters yapmışım.
    fPaletGenerator.then((value) {
      paletteGenerator = value;
      debugPrint(
          "secilen renk :" + paletteGenerator.dominantColor.color.toString());

      setState(() {
        baskinRenk = paletteGenerator.dominantColor.color;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Image.asset(
                "images/" + secilenIndex.burcTarihi,
                ////ÖNEMLİ: burcTarihi ile burcBuyukResim neslerini ters yapmışım.
                fit: BoxFit.cover,
              ),
            ),
            expandedHeight: 250,
            pinned: true,
            backgroundColor: baskinRenk,
            primary: true,
            centerTitle: true,
            title: Text(secilenIndex.burcAdi + " Burcu ve Özellikleri"),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.brown[100],
              margin: EdgeInsets.all(6),
              child: SingleChildScrollView(
                child: Text(
                  secilenIndex.burcDetay,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontStyle: FontStyle.values[001],
                      height: 1),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
