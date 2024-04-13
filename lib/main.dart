import 'package:flutter/material.dart';
import 'package:sosyal_medya/profilSayfasi.dart';

import 'GonderiKutusu.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projem',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black, size: 32.0),
          onPressed: () {},
        ),
        title: const Text(
          "SOSYAL MEDYA",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications,
                color: Colors.black, size: 32.0),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Colors.grey.shade300, boxShadow: [
            BoxShadow(offset: Offset(0.0, 0.01), blurRadius: 15)
          ]),
          height: 110,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              profilkarti(
                  "https://cdn.pixabay.com/photo/2017/11/29/09/15/paint-2985569_1280.jpg","ali ali"),
              profilkarti(
                  "https://cdn.pixabay.com/photo/2019/12/16/21/39/tree-4700352_1280.jpg","ahmet ahmet")
            ],
          ),
        ),
        const SizedBox(height: 25),
        GonderiKismi(
            "ahmet ahmet",
            "https://cdn.pixabay.com/photo/2019/12/16/21/39/tree-4700352_1280.jpg",
            "Deneme postu",
            "https://cdn.pixabay.com/photo/2019/04/09/19/45/galata-4115381_1280.jpg",
            "1 yıl önce"),
      ]),
    );
  }

  Widget profilkarti(String url,String kullaniciAdi) {
    return Material(
      color: Colors.grey[300],
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
                return profilSayfasi(url,kullaniciAdi);
              }));
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 8, left: 8),
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(7.5),
                    alignment: Alignment.center,
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(360),
                        color: Colors.grey,
                        image: DecorationImage(
                          image: NetworkImage(url),
                          fit: BoxFit.fill,
                        ),
                        border: Border.all(width: 3.0, color: Colors.grey)),
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(width: 2, color: Colors.white),
                    ),
                  )
                ],
              ),
              Text(kullaniciAdi,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}


