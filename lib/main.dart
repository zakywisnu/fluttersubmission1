import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    title: 'Resep Makanan',
    home: new Main(),
  ));
}

class Main extends StatefulWidget {
  @override
  mainState createState() => new mainState();
}
class mainState extends State<Main>{
  List<Container> listMakanan = new List();

  var makanan = [
    {"nama" :"Moci", "detail" : "Moci adalah  kue Jepang yang terbuat dari beras ketan, ditumbuk sehingga lembut dan lengket, kemudian dibentuk menjadi bulat.","gambar" : "moci2.jpg"},
    {"nama" :"Baso", "detail" : "Bakso atau baso adalah jenis bola daging yang lazim ditemukan pada masakan Indonesia.", "gambar" : "baso2.jpg"},
    {"nama" :"Gado Gado", "detail" : "Gado-gado adalah salah satu makanan yang berasal dari Indonesia yang berupa sayur-sayuran yang direbus dan dicampur jadi satu, dengan bumbu kacang atau saus dari kacang tanah dan yang dihaluskan disertai irisan telur", "gambar" : "gadogado2.jpg"},
    {"nama" :"Nasi Goreng", "detail" : "Nasi goreng merupakan sajian nasi yang digoreng dalam sebuah wajan atau penggorengan menghasilkan cita rasa berbeda karena dicampur dengan bumbu-bumbu seperti bawang putih, bawang merah, merica dan kecap manis. Selain itu, ditambahkan bahan-bahan pelengkap seperti telur, sayur-sayuran, makanan laut, atau daging. Makanan tersebut seringkali disantap sendiri atau disertai dengan hidangan lainnya.", "gambar" : "nasgos.jpg"},
    {"nama" :"Pangsit", "detail" : "Pangsit adalah makanan berupa daging cincang yang dibungkus lembaran tepung terigu.", "gambar" : "pangsit.jpg"},
    {"nama" :"Pecel", "detail" : "Pecel merupakan makanan yang dikombinasikan dengan bumbu sambal kacang sebagai bahan utamanya dan dicampur dengan aneka jenis sayuran.", "gambar" : "pecel.jpg"},
    {"nama" :"Pempek", "detail" : "Pempek atau empek-empek adalah makanan khas Palembang yang terbuat dari daging ikan yang digiling lembut dan tepung kanji , serta beberapa komposisi lain seperti telur, bawang putih yang dihaluskan, penyedap rasa dan garam.", "gambar" : "pempek.jpg"},
    {"nama" :"Rendang", "detail" : "Rendang atau randang adalah masakan daging dengan bumbu rempah-rempah yang berasal dari Minangkabau.", "gambar" : "rendang.jpg"},
    {"nama" :"Sate", "detail" : "Sate adalah adalah makanan yang terbuat dari daging yang dipotong kecil-kecil dan ditusuk sedemikian rupa dengan tusukan lidi tulang daun kelapa atau bambu kemudian dipanggang menggunakan bara arang kayu.", "gambar" : "sate2.jpg"},
    {"nama" :"Soto", "detail" : "Soto, sroto, sauto, tauto, atau coto adalah makanan khas Indonesia seperti sop yang terbuat dari kaldu daging dan sayuran.", "gambar" : "soto2.jpg"},

  ];

  makeList() async{
    for (var i = 0; i<makanan.length;i++){
      final loopMakanan = makanan[i];
      final String gambar = loopMakanan["gambar"];

      listMakanan.add(new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Card(
          child: new Column(
            children: <Widget>[
              new Hero(tag: loopMakanan['nama'] ,
                  child: new Material(
                    child: new InkWell(
                      onTap:() => Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new DetailMakanan(
                            namaMakanan : loopMakanan['nama'],
                            detailMakanan : loopMakanan['detail'],
                            gambarMakanan : gambar,
                        ),
                    )),
                      child: new Image.asset("images/$gambar",
                        fit: BoxFit.cover,
                      ),
                  ),
              ),
              ),
              new Padding(
                padding: new EdgeInsets.all(10.0),
              ),
              new Text(
                loopMakanan['nama'],
                style: new TextStyle(fontSize: 20.0),
              )
            ],
          ),
        ),
      ));
    }
  }

  @override
  void initState(){
    makeList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Makanan",
        style: new TextStyle(color: Colors.white)
          ,
        ),
      ),
      body: new GridView.count(crossAxisCount: 2,
      children: listMakanan,),
    );
  }
}

class DetailMakanan extends StatelessWidget {
  DetailMakanan ({this.namaMakanan, this.detailMakanan, this.gambarMakanan});
  final String namaMakanan;
  final String detailMakanan;
  final String gambarMakanan;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 240.0,
            child: new Hero(tag: namaMakanan, child: new Material(
              child: new InkWell(
                child: new Image.asset("images/$gambarMakanan",
                fit: BoxFit.cover,),
              ),
            )
            ),
          ),
          new aNamaMakanan(
            namaVar: namaMakanan,
          ),
          new DetailMakananPage(
            detailMakanan: detailMakanan,
          )
        ],
      ),
    );
  }
}

class DetailMakananPage extends StatelessWidget {
  DetailMakananPage ({this.detailMakanan});
  final String detailMakanan;
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(10.0),
      child: new Card(
        child: new Padding(padding: const EdgeInsets.all(10.0),
        child: new Text(detailMakanan,
        style: new TextStyle(fontSize: 18.0),
        textAlign: TextAlign.justify,
        ),
        ),
      ),
    );
  }
}

class aNamaMakanan extends StatelessWidget {
  aNamaMakanan ({this.namaVar});
  final String namaVar;
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(namaVar, style: new TextStyle(fontSize: 20.0, color: Colors.black),
              ),
              new Text("", style: new TextStyle(fontSize: 19.0, color: Colors.blue),
              ),
            ],
          ),
          ),
          new Row(
            children: <Widget>[
              new Icon(Icons.star, size: 35.0, color: Colors.yellow,),
              new Text("5", style: new TextStyle(fontSize: 17.0),
              )
            ],
          )
        ],
      ),
    );
  }
}
