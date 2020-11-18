import 'package:flutter/material.dart';


class LoginV extends StatefulWidget {
  @override
  _LoginVState createState() => _LoginVState();
}
class _LoginVState extends State<LoginV> {
  final  cor=0xff5c2441;
  final cor2=0xffb34866;
  final  cor3=0xff4b7c9;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(

        child:Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.08,
            ),
             Center(child: Text("Vinns Books",style:
             TextStyle(
               color: Color(cor),
                 fontFamily:'font1',
                 fontSize: MediaQuery.of(context).size.height*0.05,

             ),
             )
             ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.3,
            ),
            Container(
              child: Text("Para Continuar com o login Clique no G",style:
              TextStyle(
                color: Color(cor2),
                fontSize: MediaQuery.of(context).size.height*0.02,

              ),
              )
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),


            Center(
              child: Container(
                  height: MediaQuery.of(context).size.height*0.3,
                  width: MediaQuery.of(context).size.width*0.3,
                  alignment: Alignment.center,

                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,

                  ),
                  child:FlatButton
                    ( child:
                  Text("G", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height*0.1,
                  )
                  ),
                    onPressed:() async{



                      }


                  )
              ),

            )

          ],
        ) ,
      ),
    );
  }
}
