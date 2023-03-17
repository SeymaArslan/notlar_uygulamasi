import 'package:flutter/material.dart';
import 'package:notlar_uygulamasi/Notlardao.dart';
import 'package:notlar_uygulamasi/main.dart';

class NotKayitSayfa extends StatefulWidget {
  @override
  State<NotKayitSayfa> createState() => _NotKayitSayfaState();
}

class _NotKayitSayfaState extends State<NotKayitSayfa> {

  var tfDersAdi = TextEditingController();
  var tfNot1 = TextEditingController();
  var tfNot2 = TextEditingController();

 /*
  Future<void> kayit(String ders_adi, int not1, int not2) async{
    print("$ders_adi - $not1 - $not2 kayıt edildi.");
    Navigator.push(context, MaterialPageRoute(builder: (context) => Anasayfa()));
  } */

  Future<void> kayit(String ders_adi, int not1, int not2) async{
    await Notlardao().notEkle(ders_adi, not1, not2);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Anasayfa()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DERS NOTU KAYDI"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextField(
                controller: tfDersAdi,
                decoration: InputDecoration(hintText: "Ders Adı"),
              ),
              TextField(
                controller: tfNot1,
                decoration: InputDecoration(hintText: "1. Not"),
              ),
              TextField(
                controller: tfNot2,
                decoration: InputDecoration(hintText: "2. Not"),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          kayit(tfDersAdi.text, int.parse(tfNot1.text), int.parse(tfNot2.text));
        },
        tooltip: "Not Kayıt",
        icon: const Icon(Icons.save),
        label: Text("Kaydet"),
      ),
    );
  }
}
