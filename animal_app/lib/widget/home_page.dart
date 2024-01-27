import 'dart:async';

import 'package:animal_app/widget/animal_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyHomePage()));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    // 1 saniyede bir zamanlayıcı oluşturarak yazının görünürlüğünü sürekli değiştiriyoruz
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _isVisible = !_isVisible;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // Ekranın herhangi bir yerine dokunulduğunda diğer ekrana geçiş yapılıyor
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AnimalPage()),
          );
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/image/ann.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: AnimatedOpacity(
                opacity: _isVisible ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                child: const Text(
                  'Lütfen ekrana tıklayınız',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




 /*child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AnimalPage()), // Butona basıldığında yönlendirilecek sayfa
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    20.0), // Butonun köşelerinin çember gibi olmasını sağlar
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Hayvanlar',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
        ),*/