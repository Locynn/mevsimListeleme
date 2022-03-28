import 'package:flutter/material.dart';
import 'package:mevsimler/utility/mevsimler.dart';

import 'mevsim_listesi.dart';

class MevsimDetay extends StatelessWidget {
  int gelenIndex;
  var secilenMevsim;

  MevsimDetay(this.gelenIndex);

  @override
  Widget build(BuildContext context) {
    secilenMevsim = MevsimListesi.tumMevsimler[gelenIndex];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            backgroundColor: Colors.purpleAccent,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/" + secilenMevsim.mevsimBuyukResim,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(secilenMevsim.mevsimAdi + " ve Özellikleri"),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(padding: EdgeInsets.all(20),
              child: Text(
                secilenMevsim.mevsimDetay,style: TextStyle(color: Colors.deepPurple,fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
