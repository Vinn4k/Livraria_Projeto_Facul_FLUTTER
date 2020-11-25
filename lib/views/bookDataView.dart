import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class bookData extends StatelessWidget {
  bookData(this.data);

  final Map<String, dynamic> data;
  @override
  final cor = 0xff5c2441;
  final cor2 = 0xffb34866;
  final cor3 = 0xff4b7c9;

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Container(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.8,
            ),
            child: Text(
              data['Titulo'],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.04,
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: GestureDetector(
                    child: CachedNetworkImage(
                      imageUrl: data['imgLink'],
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    onTap: () {},
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Container(
                  color: Color(cor),
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    'Resumo: ' + data['desc'],
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(),
          Container(
              width: MediaQuery.of(context).size.width * 0.6,
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.3,
              ),
              color: Color(cor),
              child: FlatButton(
                child: Center(
                  child: Text(
                    "Continuar a Leitura: " + data['Titulo'] + " ?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.03),
                  ),
                ),
                onPressed: () async {
                  String url = await data['linkpdf'];
                  await launchURL(url);
                },
              )),
        ],
      ),
    );
  }
}

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url, forceWebView: true);
  } else {
    throw 'Could not launch $url';
  }
}
