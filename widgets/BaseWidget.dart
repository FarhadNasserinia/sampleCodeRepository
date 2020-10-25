import 'package:digit_to_persian_word/digit_to_persian_word.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persian/persian.dart';
import 'package:shop_appliction/color/MyColor.dart';

class BaseWidget extends StatefulWidget {
  final String imagePath;
  final String name;
  final String mojodi;
  final String price;
  final String code;
  final GestureTapCallback onTap;
  final GestureTapCallback onTapTextWidget;

  const BaseWidget({Key key, this.imagePath, this.name, this.mojodi, this.price, this.code, this.onTap, this.onTapTextWidget}) : super(key: key);

  @override
  _BaseWidgetState createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: widget.onTap,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          height: 390.0,
          width: size.width,
          margin: const EdgeInsets.all(7.0),
          child: InputDecorator(
            decoration: InputDecoration(contentPadding: EdgeInsets.all(0.0), border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)))),
            child: Card(
              elevation: 5.0,
              margin: const EdgeInsets.all(2.0),
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 200.0,
                    width: size.width,
                    child: Card(
                      margin: const EdgeInsets.all(5.0),
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          widget.imagePath,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 30.0,
                    width: size.width,
                    alignment: Alignment.center,
                    child: Text(
                      widget.name.withPersianNumbers(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    width: size.width ,
                    margin: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Card(
                      margin: const EdgeInsets.only(top: 10.0),
                      elevation: 2.0,
                      color: MyColor.baseApp,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
                        margin: const EdgeInsets.all(0.4),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 30.0,
                              child: Center(
                                child: Text(DigitFormat.convert( widget.price,separator: ",").withPersianNumbers() +' تومان',
                                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 20.0),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              height: 30.0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text('موجودی', style: TextStyle(fontWeight: FontWeight.bold)),
                                  SizedBox(width: 80.0),
                                  Text(widget.mojodi.withPersianNumbers()),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              height: 30.0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text('کد محصول', style: TextStyle(fontWeight: FontWeight.bold)),
                                  SizedBox(width: 80.0),
                                  Text(widget.code.withPersianNumbers().toString()),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
