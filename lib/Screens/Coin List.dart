
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protto_assignment/Components.dart';
import 'package:protto_assignment/Provider/MyCoinsProvider.dart';
import 'package:protto_assignment/Style.dart';
import 'package:provider/provider.dart';

class CoinList extends StatefulWidget {
  const CoinList({Key? key}) : super(key: key);

  @override
  _CoinListState createState() => _CoinListState();
}

class _CoinListState extends State<CoinList> {

  List<String> filter=['All','24th','Top 100','Market Cap','Top 300','Market Capital'];

  @override
  Widget build(BuildContext context) {
    context.read<Coins>().coinsList;

    print('Coin List');
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.12,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Coin List',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900,
                    fontFamily: 'Open Sans',),),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: new BoxDecoration(
                      color: Colors.black87.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: new Icon(
                      Icons.search_outlined,
                      size: 25,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            Flexible(
              child: Container(
                height: 35,
                child:  ListView.builder(
                    padding: EdgeInsets.only(left: 25,right: 20),

                    scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                    itemCount: filter.length,
                    itemBuilder: (BuildContext context,int i){
                      return Row(
                        children: [
                          Container(
                            height:35,
                            padding: EdgeInsets.only(left: 15,right: 15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14)
                            ),
                            child: Center(child: Text('${filter[i]}',style: TextStyle(color: Colors.grey.shade500,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Open Sans',),)),
                          ),
                          SizedBox(width: 8,),
                        ],
                      );
                    }
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),

            Padding(
              padding: EdgeInsets.only(left: 25,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Market is Uptrend',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w900,
                        fontFamily: 'Open Sans',),),
                      Text('in the past 24hrs',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,
                      color: Colors.grey.shade500),),                  ],
                  ),
                  Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_drop_up,color: primaryColor,size: 30,),
                        Text('9.17%',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w900,
                          fontFamily: 'Open Sans',color: primaryColor),)
                      ],
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            Expanded(
              flex: 15,
              child: Consumer<Coins>(builder: (context, value, child) {
                print('eeeeeeeeeeeeeeeeeeeeeeee');
                print(value.allCoins);
                return coinList(value.allCoins);
              }),
            ),
          ],
        ),
      ),

    );
  }
}
