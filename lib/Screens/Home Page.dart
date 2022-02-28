
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protto_assignment/Components.dart';
import 'package:protto_assignment/Provider/MyCoinsProvider.dart';
import 'package:protto_assignment/Style.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override

  Widget build(BuildContext context) {
    bool loading = true;
    context.read<Coins>().fetchMyCoins;

    print('y');
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Column(
            children: [
              above(),
              below()
            ],
          ),

          Positioned(
            top: MediaQuery.of(context).size.height*0.29,
            left: 30,
            child: Container(
              height: MediaQuery.of(context).size.height*0.1,
              width: MediaQuery.of(context).size.width-60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(
                        0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Icon(
                          Icons.attach_money_sharp,
                          color: primaryColor,
                          size: 30,
                        ),
                        Text('Withdraw')
                      ]
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Icon(
                          Icons.money_off_csred_sharp,
                          color: primaryColor,
                          size: 30,
                        ),
                        Text('Deposit')
                      ]
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Icon(
                          Icons.history,
                          color: primaryColor,
                          size: 30,
                        ),
                        Text('History')
                      ]
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget above(){
    return Container(
      color: primaryColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(45,45,45,0),
        child: Container(
          height: MediaQuery.of(context).size.height*0.29,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome To',style: TextStyle(
                          fontSize: 26,
                          height: 1.2,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.2)),),
                      Text('CoinPro',style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        height: 1.2,
                        fontWeight: FontWeight.w600,),),

                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: new BoxDecoration(
                      color: Colors.white.withOpacity(0.35),
                      shape: BoxShape.circle,
                    ),
                    child: new Icon(
                      CupertinoIcons.bell_fill,
                      size: 23,
                      color: Colors.white,
                    ),
                  ),

                ],
              ),
              SizedBox(height: 15,),
              Text('My Balance',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white.withOpacity(0.2)),),
              Text('\$32,761.65',style: TextStyle(fontSize: 26,color: Colors.white),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.trending_up_rounded,size: 24, color: Colors.white.withOpacity(0.5),),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: '  \$1,896 ',
                                style: TextStyle(fontSize:17,fontWeight: FontWeight.w500, color: Colors.white.withOpacity(0.5),
                                )),
                            TextSpan(
                                text: "  Today's Profit",
                                style: TextStyle(fontWeight: FontWeight.w600,color: contrastTextColor)),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(3,3,6,3),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.35),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_drop_up,color: Colors.white,),
                        Text('9.17%',style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget below() {
    print('x');
    return Flexible(
        child: Padding(
                  padding: const EdgeInsets.fromLTRB(27, 40, 27, 0),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'My Portfolio',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'sell all',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Consumer<Coins>(builder: (context, value, child) {
                              print(value.myCoins.length);
                              print('xyz');
                              return portfolioCards(value.myCoins);
                          }),
                      SizedBox(
                        height: 34,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'News',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'sell all',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),);
  }

}
