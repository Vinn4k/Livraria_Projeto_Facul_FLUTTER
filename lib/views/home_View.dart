import 'package:flutter/material.dart';



class homeViewer extends StatefulWidget {
  @override
  _homeViewrState createState() => _homeViewrState();
}

class _homeViewrState extends State<homeViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(

      ),
      body: CustomScrollView(
        slivers:<Widget> [
          SliverAppBar(
            floating: true,



          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                    (context, index)=>ListTile(
                  title:Text( "item#$index"),

                ),
                childCount: 500


            ),
          )
        ],
      ),
    );
  }
}
