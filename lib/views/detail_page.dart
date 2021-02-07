import 'package:dinggo_id/main.dart';
import 'package:dinggo_id/models/product_data.dart';
import 'package:dinggo_id/views/deal_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatefulWidget {
  final ProductData productData;
  DetailPage(this.productData);
  @override
  _DetailPageState createState() => _DetailPageState(productData);
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;
  int jumlahBeli = 0;
  int totalHarga;

  final ProductData productData;
  _DetailPageState(this.productData);

  @override
  Widget build(BuildContext context) {
    int totalHarga = productData.harga * jumlahBeli;
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidtht = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              Stack(
                children: [
                  Container(
                    width: sizeWidtht,
                    height: sizeHeight * 0.45,
                    decoration: BoxDecoration(
                      color: bgColor,
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: NetworkImage(productData.urlImage),
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: IconButton(
                              icon: Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(17),
                width: sizeWidtht,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: sizeWidtht - 110,
                          child: Text(
                            productData.nama,
                            maxLines: 3,
                            style: myTextStyle.copyWith(
                              fontSize: 21,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                          child: (isFavorite)
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : Icon(Icons.favorite_border, color: Colors.red),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          NumberFormat.currency(
                            locale: 'id',
                            decimalDigits: 0,
                            symbol: "Rp",
                          ).format(productData.harga),
                          style: myTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: priceColor,
                          ),
                        ),
                        Text(
                          "Stock " + productData.stok.toString(),
                          style: myTextStyle.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List<Widget>.generate(
                              5,
                              (index) {
                                int rating = productData.rating;
                                return (index >= rating)
                                    ? Icon(
                                        Icons.star_outline,
                                        size: 20,
                                        color: Colors.yellow[600],
                                      )
                                    : Icon(
                                        Icons.star_rate,
                                        size: 20,
                                        color: Colors.yellow[600],
                                      );
                              },
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (jumlahBeli >= 1) {
                                    jumlahBeli--;
                                  }
                                });
                              },
                              child: Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                  color: primaryColor,
                                ),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              height: 25,
                              width: 60,
                              decoration: BoxDecoration(
                                border: Border.all(color: primaryColor),
                              ),
                              child: Center(
                                child: Text(
                                  jumlahBeli.toString(),
                                  style: myTextStyle,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (jumlahBeli <= productData.stok - 1) {
                                    jumlahBeli++;
                                  }
                                });
                              },
                              child: Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                  ),
                                  color: primaryColor,
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.only(
                        top: 5,
                        bottom: 15,
                      ),
                      height: 28,
                      width: sizeWidtht - 34,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey),
                          bottom: BorderSide(color: Colors.grey),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Detail Produk",
                            style: myTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Text(
                        productData.deskripsi,
                        style: myTextStyle,
                      ),
                    ),
                    SizedBox(height: 65),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: sizeWidtht,
              height: 70,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, -0.08),
                    blurRadius: 3,
                  )
                ],
                color: cardColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(
                  right: 25,
                  left: 25,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        NumberFormat.currency(
                          locale: 'id',
                          decimalDigits: 0,
                          symbol: "Rp",
                        ).format(totalHarga),
                        style: myTextStyle.copyWith(
                          fontSize: 25,
                          color: priceColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        color: primaryColor,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  actions: [
                                    RaisedButton(
                                        child: Text(
                                          "Oke",
                                          style: myTextStyle.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                        color: primaryColor,
                                        onPressed: () {
                                          Navigator.pop(context);
                                        })
                                  ],
                                  content: Text(
                                    "Pembelian sedang diproses\nMohon menunggu",
                                    style: myTextStyle.copyWith(
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              });
                        },
                        child: Text(
                          "Beli",
                          style: myTextStyle.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
