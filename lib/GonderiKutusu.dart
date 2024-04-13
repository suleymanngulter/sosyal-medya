import 'package:flutter/material.dart';
import 'package:sosyal_medya/main.dart';
import 'profilSayfasi.dart';

class GonderiKismi extends StatelessWidget {



  final String kullaniciAdi;
  final String profilUrl;
  final String resimAciklamasi;
  final String gonderiUrl;
  final String gecenSure;

  GonderiKismi(this.kullaniciAdi, this.profilUrl, this.resimAciklamasi,
      this.gonderiUrl, this.gecenSure);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
      child: Material(
        child: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          height: 400,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 0.001,
                    blurRadius: 10,
                    offset: Offset(1, 1))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[



              //------------------------------------------------------------


              //BU ALAN GONDERİ KUTUSUNDAKI FOTOGRAF ISIM SOYISIM ALANIDIR



              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[




                  Row(
                    children: <Widget>[
                      Material(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return profilSayfasi(profilUrl,kullaniciAdi);
                                }));
                          },




                          child: Container(
                            width: 50,
                            height: 50,
                            margin: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(width: 2),
                                color: Colors.indigo,
                                image: DecorationImage(
                                    image: NetworkImage(profilUrl),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                      ),



                      SizedBox(width: 5),



                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Material(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return profilSayfasi(profilUrl,kullaniciAdi);
                                }));
                              },
                              child: Text(
                                kullaniciAdi,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Text(gecenSure)
                        ],
                      )



                      ,
                    ],
                  ),



                  Icon(Icons.more_vert)
                ],



              ),


              //BU ALAN GONDERİ KUTUSUNDAKI FOTOGRAF ISIM SOYISIM ALANIDIR



              //------------------------------------------------------------


              SizedBox(
                width: 10,
                height: 10,
              ),


              //RESIM ACIKLAMASI


              Text(
                "${resimAciklamasi}",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),


              //RESIM ACIKLAMASI




              SizedBox(
                height: 10,
              ),


              //RESIM


              Image.network(
                gonderiUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),


              //RESIM




              SizedBox(height: 5),


              //------------------------------------------------------------


              //BU ALAN RESIM BEGENME YORUM YAPMA VE PAYLASMA BUTONLARI ALANIDIR


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ikonButonu(
                    ikonum: Icons.favorite,
                    yazi: 'Beğen',
                    gonderiEtkilesimi: () {
                      debugPrint("beğenildi");
                    },
                  ),
                  ikonButonu(
                    ikonum: Icons.comment,
                    yazi: 'Yorum Yap',
                    gonderiEtkilesimi: () {
                      debugPrint("Yorum Yapıldı");
                    },
                  ),
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.share,
                        color: Colors.black,
                      ),
                      label: Text(
                        "Paylaş",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(10),
                        backgroundColor: Colors.white,
                        shadowColor: Colors.white,
                      )),
                ],
              )


              //BU ALAN RESIM BEGENME YORUM YAPMA VE PAYLASMA BUTONLARI ALANIDIR



              //--------------------------------------------------------------


            ],
          ),
        ),
      ),
    );
  }
}


//----------------------------------------------------------------------


//BU ALAN RESIM BEGENME YORUM YAPMA VE PAYLASMA BUTONLARI
//METODU ALANIDIR

class ikonButonu extends StatelessWidget {
  final IconData ikonum;
  final String yazi;
  final gonderiEtkilesimi;
  const ikonButonu(
      {required this.ikonum, required this.yazi, this.gonderiEtkilesimi});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: gonderiEtkilesimi,
        child: Container(
          child: Row(
            children: <Widget>[
              Icon(ikonum, size: 30),
              Text(
                yazi,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//BU ALAN RESIM BEGENME YORUM YAPMA VE PAYLASMA BUTONLARI
//METODU ALANIDIR

//----------------------------------------------------------------------
