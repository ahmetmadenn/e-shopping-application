import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/odeme/odeme_basarili.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int activeCard = 0;
  bool _isLoading = false;
  late Timer _timer;

  pay() {
    setState(() {
      _isLoading = true;
    });

    const oneSec = const Duration(seconds: 2);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          _isLoading = false;
          timer.cancel();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PaymentSuccess()));
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'Ödeme',
              style: TextStyle(color: Colors.black),
            ),
            leading: BackButton(
              color: Colors.black,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  activeCard == 0
                      ? AnimatedOpacity(
                          duration: Duration(milliseconds: 500),
                          opacity: activeCard == 0 ? 1 : 0,
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            padding: EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.blue,
                                    Colors.blue.shade800,
                                    Colors.blue.shade900,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                )),
                            child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Kredi Kartı",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "**** **** **** 7890",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 30),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Ahmet MADEN",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ]),
                          ),
                        )
                      : AnimatedOpacity(
                          duration: Duration(milliseconds: 500),
                          opacity: activeCard == 1 ? 1 : 0,
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            padding: EdgeInsets.all(30.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                // color: Colors.grey.shade200
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.grey.shade200,
                                    Colors.grey.shade100,
                                    Colors.grey.shade200,
                                    Colors.grey.shade300,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                )),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                      )
                                    ],
                                  )
                                ]),
                          ),
                        ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Ödeme Yöntemi Seçiniz",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          activeCard = 0;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          border: activeCard == 0
                              ? Border.all(
                                  color: Colors.grey.shade300, width: 1)
                              : Border.all(
                                  color: Colors.grey.shade300.withOpacity(0),
                                  width: 1),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          activeCard = 1;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          border: activeCard == 1
                              ? Border.all(
                                  color: Colors.grey.shade300, width: 1)
                              : Border.all(
                                  color: Colors.grey.shade300.withOpacity(0),
                                  width: 1),
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    padding: EdgeInsets.only(
                      left: 20,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Teklifler",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        TextButton(
                            onPressed: () {}, child: Text("İndirim Kodu Ekle"))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    padding: EdgeInsets.only(
                      left: 20,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Adres",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Text("Dere Mah, 123 Sokak..."),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 20,
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Toplam Ödeme",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Text("\₺240.00",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))
                    ],
                  ),
                  SizedBox(height: 30),
                  MaterialButton(
                    onPressed: _isLoading
                        ? null
                        : () {
                            pay();
                          },
                    height: 50,
                    elevation: 0,
                    splashColor: Colors.blue[700],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: Colors.blue[800],
                    child: Center(
                      child: _isLoading
                          ? Container(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.white,
                                strokeWidth: 3,
                                color: Colors.black,
                              ),
                            )
                          : Text(
                              "Ödemeyi Tamamla",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                    ),
                  ),
                  SizedBox(height: 100),
                ],
              ),
            ),
          )),
    );
  }
}
