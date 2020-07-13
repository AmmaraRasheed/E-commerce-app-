import 'package:e_commerce_app/ModelClass.dart';
import 'package:flutter/material.dart';
import 'package:shape_of_view/shape_of_view.dart';

class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {

  List<String> list=['asset/frock1.png','asset/frock2.png',
  'asset/frock3.png','asset/frock4.png','asset/frock5.png',
  'asset/frock6.png','asset/frock8.png'
  ];
  //i create a list of color

  List<Color> color1=[Colors.orange[100],Colors.green[100],
  Colors.grey[200],
  Colors.cyan[100],Colors.red[100],Colors.grey[100],
  ];

  @override
  Widget build(BuildContext context) {
    final ModelProject model=ModalRoute.of(context).settings.arguments;
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: height-50,
            child: Stack(
              children: <Widget>[
                ShapeOfView(
                  height: 200,
                  width: width,
                  shape: ArcShape(
                    direction: ArcDirection.Outside,
                    height: 50,
                    position: ArcPosition.Bottom,
                  ),
                  child: Container(
                    color: Colors.cyan[900],
                  ),
                ),
                Positioned(
                  top: 110,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Container(
                      height:height-180,
                      width: width-40,
                      child: ShapeOfView(
                        shape: BubbleShape(
                          position: BubblePosition.Bottom,
                          arrowPositionPercent: 0.5,
                          borderRadius: 20,
                          arrowHeight: 20,
                          arrowWidth: 20
                        ),
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                    child: Image.asset(model.image),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        "Colors",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      circle(Colors.grey),
                                      circle(Colors.cyan[700]),
                                      circle(Colors.brown),
                                      circle(Colors.red),
                                      circle(Colors.cyan[300]),
                                      circle(Colors.black),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                width: width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                      child: Text(
                                        model.title,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
                                      child: Text(
                                        model.description+"To switch to a new route, use the Navigator. To switch to a new route, use the Navigator.push() method. The push() method adds a Route to the stack of routes managed by the Navigator.",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              shirt(),
                            ],
                          ),
                        ),

                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget circle(Color color){
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(50)),

        ),
      ),
    );
  }
  Widget shirt(){
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    list[index],
                  )
                )
              ),
            ),
          );
        },
      ),
    );
  }
}

//run code

//i hope you like this video
//like share and subscribe
//and share your views in comment box
//takecare Allah Hafix