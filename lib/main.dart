import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/burc_detay.dart';
import 'package:flutter_burc_rehberi/burc_liste.dart';
import 'package:flutter_burc_rehberi/hakkinda.dart';
import 'dart:math' as matematik;

void main() => runApp(MyApp());

Color rastgele() {
  return Color.fromARGB(
      matematik.Random().nextInt(255),
      matematik.Random().nextInt(255),
      matematik.Random().nextInt(255),
      matematik.Random().nextInt(255));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Burç Rehberi",
      debugShowCheckedModeBanner: false,
      initialRoute: "/burcListesi",
      routes: {
        "/burcListesi": (context) => BurcListesi(),
        "/hakkinda": (context) => Hakkinda(),
      },
      onGenerateRoute: (RouteSettings settings) {
        List<String> pathElemanlari = settings.name.split("/");
        if (pathElemanlari[1] == "burcDetay") {
          return MaterialPageRoute(
              builder: (context) => BurcDetay(int.parse(pathElemanlari[2])));
        }
        return null;
      },
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
