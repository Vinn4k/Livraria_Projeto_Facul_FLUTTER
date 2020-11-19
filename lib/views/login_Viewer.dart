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
      backgroundColor: Colors.brown,
      body: Container(

        child:SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.19,
              ),
               Center(child: Text("Vinns Books",style:
               TextStyle(
                 color: Colors.amber,
                   fontFamily:'Ral',
                   fontSize: MediaQuery.of(context).size.width*0.19,

               ),
               )

               ),

              Container(

                child: Text("Seus livros favoritos em um Clique ",style:
                TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width*0.03,

                ),
                )
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height*0.3,
              ),


              Container(
                color: Color(cor),
                  width: MediaQuery.of(context).size.width*0.9,
                 height: MediaQuery.of(context).size.height*0.10,
                child: FlatButton(
                  onPressed: (){},
                  child: Row(
                    children: [

                      Container(
                        child:  Text("Login Com Google",style: TextStyle(
                  fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width*0.05,
                  )
                          ),

                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.20,

                      ),
                      Container(
                          height: MediaQuery.of(context).size.height*0.18,
                          width: MediaQuery.of(context).size.width*0.18,
                          alignment: Alignment.center,

                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,

                          ),
                          child:
                          Text("G", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            fontSize: MediaQuery.of(context).size.height*0.08,
                          )
                          ),

                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.02,
              ),
              Container(
                color: Color(cor),
                width: MediaQuery.of(context).size.width*0.9,
                height: MediaQuery.of(context).size.height*0.10,
                child: FlatButton(
                  onPressed: (){},
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.02,

                      ),
                      Container(
                        child: Text("Sair", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width*0.1,
                        )
                        ),
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.42,

                      ),

                      Icon(
                        Icons.exit_to_app,
                        color: Colors.redAccent,
                        size: MediaQuery.of(context).size.height*0.08,
                      ),
                    ],
                  ),
                ),

              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.01,

              ),
              Container(child: Text("Todos Direitos Reservado",style: TextStyle(
                color: Colors.white
              ),),)

            ],
          ),
        ) ,
      ),
    );
  }
}
