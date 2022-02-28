import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protto_assignment/Components.dart';
import 'package:protto_assignment/Models/CoinModel.dart';
import 'package:protto_assignment/Style.dart';

class MyPortFolio extends StatefulWidget {
  final CoinModel coin;
  const MyPortFolio({Key? key,required this.coin}) : super(key: key);

  @override
  _MyPortFolioState createState() => _MyPortFolioState();
}

class _MyPortFolioState extends State<MyPortFolio> {

  List<String> timeInterval=['1D','7D','1M','1Y','5Y','ALL'];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 30,right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: new Icon(
                    Icons.arrow_back,
                    size: 23,
                    color: Colors.black87,
                  ),
                ),
                onTap: ()=>Navigator.of(context).pop(),
              ),

              Text('My Portfolio',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w900,fontSize: 20),),
              Container(
                padding: EdgeInsets.all(6),
                decoration: new BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: new Icon(
                  CupertinoIcons.ellipsis,
                  size: 23,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.08,),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('${widget.coin.image}'),
                    fit: BoxFit.cover),
                color: primaryColor.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.04,),
            Text(
              '\$ ${widget.coin.amount}',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w700,
                fontFamily: 'Open Sans',
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            Container(
              width: 75,
              padding: EdgeInsets.fromLTRB(0,3,6,3),
              decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: [
                  Icon(Icons.arrow_drop_up,color: primaryColor,size: 27,),
                  Text('${widget.coin.percentage}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w900,
                      fontFamily: 'Open Sans',color: primaryColor),)
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.04,),
            Container(
              height: MediaQuery.of(context).size.height*0.25,
              //color: Colors.blue,
              child: chart(),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            Flexible(
              child: Container(

                height: 35,
                child:  ListView.builder(
                    padding: EdgeInsets.only(left: 35,right: 20),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: timeInterval.length,
                    itemBuilder: (BuildContext context,int i){
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text('${timeInterval[i]}',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700,
                          color: Colors.grey.shade500,
                          fontFamily: 'Open Sans',),),
                          SizedBox(
                            width: 40,
                          ),
                        ],
                      );
                    }
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            Expanded(
              flex: 5,
              child: priceList(),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.05,
                    width: MediaQuery.of(context).size.width*0.4,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      border: Border.all(color: Colors.red,width: 1.5),
                    ),
                    child: Center(
                      child: Text('Sell',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,
                        color: Colors.red,
                        fontFamily: 'Open Sans',),),
                    ),
                  ),

                  Container(
                    height: MediaQuery.of(context).size.height*0.05,
                    width: MediaQuery.of(context).size.width*0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: primaryColor
                    ),
                    child: Center(
                      child: Text('Buy',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontFamily: 'Open Sans',),),
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
