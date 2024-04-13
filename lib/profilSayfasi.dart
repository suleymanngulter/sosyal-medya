import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class profilSayfasi extends StatelessWidget {
  final String profilUrl;
  final String kullaniciAdi;

  profilSayfasi(this.profilUrl, this.kullaniciAdi) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[250],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: 0, top: 5, right: 0, bottom: 0),
              child: Stack(children: <Widget>[
                Column(
                  children: [
                    //----------------------------------------------------------

                    //BU ALAN PROFIL SAYFASI UST KISMIDIR
                    //ISIM SOYISIM FOTOGRAF BU ALANDA

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        //BU ALAN PROFIL SAYFASI NDAKİ PROFIL FOTOGRAFI ALANIDIR

                        Container(
                            margin: EdgeInsets.only(
                                left: 30, top: 35, right: 7.5, bottom: 0),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.green,
                                image: DecorationImage(
                                    image: NetworkImage(
                                      profilUrl,
                                    ),
                                    fit: BoxFit.fill))),

                        //BU ALAN PROFIL SAYFASI NDAKİ PROFIL FOTOGRAFI ALANIDIR

                        //-----------------------------------------------------------

                        //BU ALAN PROFİLDEKİ ISIM SOYISIM ALANIDIR

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Material(
                              color: Colors.grey[300],
                              child: InkWell(
                                child: Text(
                                  kullaniciAdi,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Text("gecenSure")
                          ],
                        ),

                        //BU ALAN PROFİLDEKİ ISIM SOYISIM ALANIDIR

                        //-----------------------------------------------------------
                      ],
                    ),

                    //BU ALAN PROFIL SAYFASI UST KISMIDIR
                    //ISIM SOYISIM FOTOGRAF BU ALANDA

                    //----------------------------------------------------------

                    SizedBox(
                      width: double.infinity,
                      height: 30,
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        profilmenusu(),
                      ],
                    )
                  ],
                )
              ]))
        ],
      ),
    );
  }
}

Widget profilmenusu() {
  return Material(
    child: InkWell(
      onTap: () {},
      child: Container(
        color: Colors.grey[350],
        child: Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              child: ElevatedButton(
                onPressed: () {},
                child: Icon(Icons.photo_album),
                style: ElevatedButton.styleFrom(
                    shadowColor: Colors.white,
                    backgroundColor: Colors.white,
                    shape: LinearBorder()),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.person),
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.white,
                      backgroundColor: Colors.white,
                      shape: LinearBorder())),
            ),
          ],
        ),
      ),
    ),
  );
}
