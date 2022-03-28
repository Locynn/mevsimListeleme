import 'package:flutter/material.dart';
import 'package:mevsimler/utility/strings.dart';
import 'mevsim_detay.dart';
import 'utility/mevsimler.dart';

class MevsimListesi extends StatelessWidget {
  static var tumMevsimler;

  @override
  Widget build(BuildContext context) {
    tumMevsimler = veriKaynagiHazirla();
    return Scaffold(
      appBar: AppBar(
        title: Text("Mevsim Listesi"),
      ),
      body: ListeyiHazirla(),
    );
  }

  Widget ListeyiHazirla() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return tekSatirMevsim(context, index);
      },
      itemCount: tumMevsimler.length,
    );
  }

  List<Mevsim> veriKaynagiHazirla() {
    List<Mevsim> mevsimler = [];
    for (int i = 0; i < 4; i++) {
      String kucukResim = Strings.RESIM_ADLARI[i] + ".png";
      String buyukResim = Strings.RESIM_ADLARI[i] + "_buyuk.jpeg";
      Mevsim eklenecekMevsim = Mevsim(
          Strings.MEVSIM_ADLARI[i],
          Strings.MEVSIM_TARIHLERI[i],
          Strings.MEVSIM_GENEL_OZELLIKLERI[i],
          kucukResim,
          buyukResim);
      mevsimler.add(eklenecekMevsim);
    }
    return mevsimler;
  }

  Widget tekSatirMevsim(BuildContext context, int index) {
    Mevsim oankiMevsim = tumMevsimler[index];
    return Card(
      elevation: 15,
      child: ListTile(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MevsimDetay(index),
          ),
        ),
        leading: Image.asset(
          "assets/images/" + oankiMevsim.mevsimKucukResim,
          height: 64,
          width: 64,
        ),
        title: Text(
          oankiMevsim.mevsimAdi,
          style: TextStyle(
              color: Colors.red, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          oankiMevsim.mevsimTarih,
          style: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 48,
          color: Colors.red,
        ),
      ),
    );
  }
}
