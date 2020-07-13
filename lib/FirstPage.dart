import 'package:e_commerce_app/ModelClass.dart';
import 'package:e_commerce_app/MyAppBar.dart';
import 'package:e_commerce_app/SecondPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  //create Instance of this class ExpandableView
  ExpandableView expandableView=new ExpandableView();

  List<String> list=['asset/frock1.png','asset/frock2.png',
  'asset/frock3.png','asset/frock4.png','asset/frock5.png',
  'asset/frock6.png','asset/frock8.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: new AppBar(
        backgroundColor: Colors.cyan[900],
        title: new Text("E-Commerce App",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.expand_more), onPressed: () {
            expandableView.expandedView.tappedEvent();
          })
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                myList(context),
                Row(
                  children: <Widget>[
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Image.asset("asset/image2.png",
                              scale: 6.5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Image.asset("asset/img1.png",
                              scale: 6.5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                            child: Image.asset("asset/img7.png",
                              scale: 6.5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Image.asset("asset/img3.png",
                              scale: 6.5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Image.asset("asset/img4.png",
                              scale: 6.5,
                            ),
                          )

                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                        child: Container(
                          height: 200,
                          child: Swiper(
                            itemCount: 5,
                            viewportFraction: 0.4,
                            scale: 0.5,
                            itemBuilder: (BuildContext context,int index){
                              if(index==0){
                                return Image1("asset/image2.png");
                              }
                              else if(index==1){
                                return Image1("asset/image7.png");
                              }
                              else if(index==2){
                                return Image1("asset/img00.png");
                              }else if(index==3){
                                return Image1("asset/Cap.png");
                              }
                              else{
                                return Image1("asset/img0.png");
                              }
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                List1(),
              SizedBox(
              height:10
              ),
                Expanded(
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context,index){
                      return Container(
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Image.asset(
                                  list[index],
                                  scale: 2.5,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Grey Frock",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,

                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Different Colour available on Request",
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 10,
                                    ),
                                  )
                                ],
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: (){
                                  ModelProject model=new ModelProject(
                                    "Grey Frock","Different Colour available on Request",
                                    list[index]
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context)=>Second(),
                                      settings: RouteSettings(
                                        arguments: model,
                                      )
                                    )
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: Icon(
                                    Icons.add,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )
                )

              ],
            )
          ),
          new Column(
            children: <Widget>[expandableView],
          )
        ],
      ),
    );
  }

  Widget myList(BuildContext context){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(
          children: <Widget>[
            CardDesign("T-Shirts"),
            CardDesign("Shoes"),
            CardDesign("Trouser"),
            CardDesign("Watches"),
            CardDesign("Jeans"),
            CardDesign("Long Sleeved"),
            CardDesign("Towels"),
            CardDesign("Scarfs"),
            CardDesign("Hats")
          ],
        ),
      ),
    );
  }
  Widget CardDesign(String text){
    return Card(
      color: Colors.cyan[700],
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
  Widget Image1(dynamic image){
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(image),
        )
      ),
    );
  }

  Widget List1(){
    Color color=Colors.cyan[900];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(
          children: <Widget>[
            CardDesign1("T-Shirts",Icon(Icons.visibility,color: color,)),
            CardDesign1("Shoes",Icon(Icons.account_balance,color: color,)),
            CardDesign1("Trouser",Icon(Icons.accessibility_new,color: color,)),
            CardDesign1("Watches",Icon(Icons.category,color: color,)),
            CardDesign1("Jeans",Icon(Icons.voicemail,color: color,)),
            CardDesign1("Long Sleeved",Icon(Icons.web_asset,color: color,)),
            CardDesign1("Towels",Icon(Icons.wb_cloudy,color: color,)),
            CardDesign1("Scarfs",Icon(Icons.view_stream,color: color,)),
            CardDesign1("Hats",Icon(Icons.video_library,color: color,))
          ],
        ),
      ),
    );
  }

  Widget CardDesign1(String text,Icon icon){
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            icon,
            SizedBox(
              width: 5,
            ),
            Text(text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16
              ),
            )
          ],
        ),
      ),
    );
  }

}
// run code