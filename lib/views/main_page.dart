import 'package:dinggo_id/models/kategori.dart';
import 'package:dinggo_id/views/product_page.dart';
import 'package:flutter/material.dart';
import 'package:dinggo_id/main.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SafeArea(
            child: Container(
              height: 54,
              child: Center(
                child: Text(
                  "Kategori",
                  style: myTextStyle.copyWith(
                    fontSize: 23,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(35),
                topLeft: Radius.circular(35),
              ),
              child: Container(
                color: bgColor,
                child: ListView(
                  children: List<Widget>.generate(
                    listCategori.length,
                    (index) {
                      return Container(
                        margin:
                            EdgeInsets.only(bottom: 10, right: 20, left: 20),
                        height: 90,
                        child: Card(
                          color: cardColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductPage(listCategori[index], index),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 15),
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              listCategori[index].ikon),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 30),
                                    SizedBox(
                                      width: 90,
                                      child: Text(
                                        listCategori[index].nama,
                                        style: myTextStyle.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 15,
                                    ),
                                    SizedBox(width: 15),
                                  ],
                                ),
                              ],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

var listCategori = [
  Categori(
    nama: "Dapur",
    ikon: "images/cooking-tools.png",
  ),
  Categori(
    nama: "Elektronik",
    ikon: "images/electronic-devices.png",
  ),
  Categori(
    nama: "Fashion",
    ikon: "images/dress.png",
  ),
  Categori(
    nama: "Furniture",
    ikon: "images/furniture.png",
  ),
  Categori(
    nama: "Kecantikan",
    ikon: "images/cosmetics.png",
  ),
  Categori(
    nama: 'Makanan & Minuman',
    ikon: "images/fast-food.png",
  ),
  Categori(
    nama: "Olahraga",
    ikon: "images/sport.png",
  ),
];
