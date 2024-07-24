import 'package:flutter/material.dart';
import 'package:helloworld/kitaplar.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

void main() => runApp(MaterialApp(
      title: 'Bir uygulama',
      home: AnaEkran(),
      debugShowCheckedModeBanner: false,
    ));

class AnaEkran extends StatefulWidget {
  const AnaEkran({Key? key}) : super(key: key);

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  var url = Uri.parse(
      "https://www.kitapyurdu.com/index.php?route=product/best_sellers&list_id=15");
  List<Kitaplar> nesneler = [];
  bool isLogin = false;

  Future veriGetir() async {
    var yanit = await http.get(url);
    final icerik = yanit.body;
    final dokuman = parser.parse(icerik);
    print("gelen yanıt :" + dokuman.outerHtml);

    var yazdir = dokuman
        .getElementsByClassName("product-grid")[0]
        .getElementsByClassName("product-cr")
        .forEach((element) {
      setState(() {
        isLogin = true;
        nesneler.add(
          Kitaplar(
            ad: element.children[4].text.toString(),
            yazar: element.children[6].text.toString(),
            image: element.children[3].children[0].children[0].children[0]
                .attributes['src']
                .toString(),
            yayinEvi: element.children[5].text.toString(),
            urunOzellikleri: element.children[8].text.toString(),
            fiyat: element.children[9].text.toString(),
          ),
        );
        isLogin = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    veriGetir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
              child: Text("Son Çıkan Kitaplar",
                  style: TextStyle(color: Color(0xffffffff))),
            ),
            backgroundColor: Color(0xff001601)),
        body: ListView.builder(
            itemCount: nesneler.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Column(
                  children: [
                    Image.network(nesneler[index].image,
                        width: 200, height: 200),

                    SizedBox(height: 5),
                    Text("Kitap Adı:\n" + nesneler[index].ad,
                        style: TextStyle(color: Color(0xffffffff))),
                    SizedBox(height: 45), // 5 pixel boşluk
                    Text(nesneler[index].yazar,
                        style: TextStyle(color: Color(0xffffffff))),
                    SizedBox(height: 35),
                    Text("Yayınevi:   " + nesneler[index].yayinEvi,
                        style: TextStyle(color: Color(0xffffffff))),
                    SizedBox(height: 25),
                    Text(
                        "Kitapın Özellikleri:\n" +
                            nesneler[index].urunOzellikleri,
                        style: TextStyle(color: Color(0xffffffff))),
                    SizedBox(height: 15),
                    Text(nesneler[index].fiyat,
                        style: TextStyle(color: Color(0xffb0fd20))),
                    SizedBox(height: 15),
                    SizedBox(
                        height: 2,
                        child: Container(
                          color: Color(0xff89ff01),
                        ))
                  ],
                ),
              );
            }),
        backgroundColor: Color(0xff1202a1));
  }
}
