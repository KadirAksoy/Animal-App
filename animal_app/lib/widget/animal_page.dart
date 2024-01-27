import 'package:flutter/material.dart';

class AnimalPage extends StatelessWidget {
  final List<String> imagePaths = [
    'lib/image/kedi.png',
    'lib/image/ördek.png',
    'lib/image/antilop.png',
    'lib/image/ardıç kuşu.png',
    'lib/image/arı.png',
    'lib/image/aslan.png',
    'lib/image/at.png',
    'lib/image/balina.png',
    'lib/image/baykuş.png',
    'lib/image/beyaz-balina.png',
    'lib/image/bufalo.png',
    'lib/image/çıngıraklı-yılan.png',
    'lib/image/deve.png',
    'lib/image/dinazor.png',
    'lib/image/domuz.png',
    'lib/image/fare.png',
    'lib/image/fil.png',
    'lib/image/gelincik.png',
    'lib/image/gergedan.png',
    'lib/image/geyik.png',
    'lib/image/gine-domuzu.png',
    'lib/image/güvercin.png',
    'lib/image/hindi.png',
    'lib/image/akrep.png',
    'lib/image/hipopotam.png',
    'lib/image/horoz.png',
    'lib/image/inek.png',
    'lib/image/kaplan.png',
    'lib/image/karga.png',
    'lib/image/karıncayiyen.png',
    'lib/image/kelebek.png',
    'lib/image/kertenkele.png',
    'lib/image/kirpi.png',
    'lib/image/köpek-balığı.png',
    'lib/image/köpek.png',
    'lib/image/koyun.png',
    'lib/image/kuğu.png',
    'lib/image/kurbağa.png',
    'lib/image/kurt.png',
    'lib/image/leopar.png',
    'lib/image/maymun.png',
    'lib/image/panda.png',
    'lib/image/penguen.png',
    'lib/image/rakun.png',
    'lib/image/şahin.png',
    'lib/image/sığır.png',
    'lib/image/sırtlan.png',
    'lib/image/su-samuru.png',
    'lib/image/tavşan.png',
    'lib/image/tavuk.png',
    'lib/image/timsah.png',
    'lib/image/yarasa.png',
    'lib/image/zürafa.png',

    // Diğer resim yollarını buraya ekleyin
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white54,
          title: const Text(
            "Hayvanlar",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.red,
        body: ListView.builder(
          itemCount: imagePaths.length ~/ 2, // 56 resim için 28 çift
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: CustomCard(imagePaths[index * 2]),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: CustomCard(imagePaths[index * 2 + 1]),
                  ),
                ],
              ),
            );
          },
        ));
  }
}

class CustomCard extends StatelessWidget {
  final String imagePath;

  CustomCard(this.imagePath);

  @override
  Widget build(BuildContext context) {
    // Dosya adını almak için son '/' karakterinden sonrasını alıyoruz
    String imageName = imagePath.substring(imagePath.lastIndexOf('/') + 1);
    // Uzantıyı kaldırmak için '.' karakterinden öncekini alıyoruz
    imageName = imageName.substring(0, imageName.lastIndexOf('.'));
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            //color: opacityColor,
            spreadRadius: 2,
            blurRadius: 2,
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                ' $imageName',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
