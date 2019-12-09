import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'quote.model.dart';
import 'package:auto_size_text/auto_size_text.dart';

class IPhoneXXS11Pro3Widget extends StatefulWidget {
  @override
  _IPhoneXXS11Pro3WidgetState createState() => _IPhoneXXS11Pro3WidgetState();
}


class _IPhoneXXS11Pro3WidgetState extends State<IPhoneXXS11Pro3Widget> {
  Map data;
  String author;
  String quote;
  Future getQuote() async {
    http.Response response = await http.get(
        "https://lrmwoxghba.execute-api.us-east-1.amazonaws.com/dev/quotes/rgiiylxbicxc/00d73220-1278-11ea-9930-cdc32d0de76f");
    if(response.statusCode == 200){
      setState(() {
        data = json.decode(response.body);
        quote = data["body"]["quote"];
        author = data["body"]["author"];
      });
    }else{
      throw Exception('Failed to load quote');
    }
  }
@override
  void initState(){
    super.initState();
    getQuote();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 144, 255),
          border: Border.all(
            color: Color.fromARGB(255, 112, 112, 112),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 33,
              margin: EdgeInsets.only(left: 21, top: 22, right: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 32,
                      height: 32,
                      margin: EdgeInsets.only(top: 1),
                      child: Image.asset(
                        "assets/images/menu--close.png",
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 30,
                      height: 30,
                      child: Image.asset(
                        "assets/images/group-2.png",
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 339,
                height: 420,
                margin: EdgeInsets.only(left: 12, top: 84),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 339,
                        height: 300,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Text(
                                "\"",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 100,
                                  letterSpacing: 3.4,
                                  fontFamily: "Engravers MT",
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Positioned(
                              top: 80,
                              child: Container(
                                width: 330,
                                child: AutoSizeText(
                                  quote,
                                  presetFontSizes: [35, 21, 16],
                                  maxLines: 10,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    letterSpacing: 0.884,
                                    fontFamily: "Roboto",
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 11,
                              top: 271,
                              child: Container(
                                width: 54,
                                height: 50,

                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 50,
                      top: 350,
                      child: Container(
                        width: 300,
                        child: AutoSizeText(
                         author,
                          presetFontSizes: [20, 14],
                          maxLines: 1,
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 20,
                            letterSpacing: 0.68,
                            fontFamily: "Roboto",
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Container(
              height: 80,
              margin: EdgeInsets.only(left: 82, right: 82, bottom: 108),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 255, 255, 255),
                          width: 4,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            height: 37,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Image.asset(
                              "assets/images/path-2.png",
                              fit: BoxFit.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 255, 255, 255),
                          width: 4,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => getQuote(),
                            child: Container(
                              width:50,
                              height: 50,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0),
                                  child: Image.asset(
                                    "assets/images/refresh.png",
                                    fit: BoxFit.fill,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
