
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protto_assignment/Models/CoinModel.dart';
import 'package:protto_assignment/Screens/Coin%20List.dart';
import 'package:protto_assignment/Screens/My%20Portfolio.dart';
import 'package:protto_assignment/Style.dart';

  Widget portfolioCards(List<CoinModel> myCoins,) {
  return myCoins.length == 0
      ? Center(
          child: LinearProgressIndicator(
            backgroundColor: primaryColor,
            valueColor: AlwaysStoppedAnimation(backgroundColor),
            minHeight: 20,
          ),
        )
      : GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 2 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: myCoins.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext ctx, i) {
            return InkWell(
              onTap: ()=>Navigator.of(ctx).push(
                MaterialPageRoute(
                  builder: (context) => MyPortFolio(coin: myCoins[i]),
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(18)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('${myCoins[i].image}'),
                                fit: BoxFit.cover),
                            color: primaryColor.withOpacity(0.3),
                            shape: BoxShape.circle,
                          ),
                        ),
                        backgroundColor: primaryColor,
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      Text(
                        '${myCoins[i].title}',
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${myCoins[i].amount}',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: new BoxDecoration(
                              color: '${myCoins[i].sign}' == 'positive'
                                  ? primaryColor.withOpacity(0.3)
                                  : Colors.redAccent.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: new Icon(
                              Icons.trending_up_outlined,
                              size: 24,
                              color: '${myCoins[i].sign}' == 'positive'
                                  ? primaryColor
                                  : Colors.redAccent,
                            ),
                          ),
                        ],
                      ),
                      Text('${myCoins[i].percentage}',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Open Sans',
                              color: '${myCoins[i].sign}' == 'positive'
                                  ? primaryColor
                                  : Colors.redAccent))
                    ],
                  ),
                ),
              ),
            );
          });
}

  Widget coinList(List<CoinModel> coins) {
    return coins.length == 0
        ? Center(
            child: CircularProgressIndicator(
              backgroundColor: primaryColor,
              valueColor: AlwaysStoppedAnimation(backgroundColor),
              strokeWidth: 8.0,
            ),
          )
        : ListView.builder(
            padding: EdgeInsets.only(left: 25, right: 20),
            shrinkWrap: true,
            itemCount: coins.length,
            itemBuilder: (BuildContext context, int i) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 63,
                            height: 63,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('${coins[i].image}'),
                                  fit: BoxFit.cover),
                              color: primaryColor.withOpacity(0.3),
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${coins[i].title}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Open Sans',
                                ),
                              ),
                              Text(
                                '${coins[i].subtitle}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Open Sans',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              '\$ ${coins[i].amount}',
                              style: TextStyle(
                                height: 1,
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Open Sans',
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.trending_up_outlined,
                                  color: coins[i].sign == 'positive'
                                      ? primaryColor
                                      : Colors.redAccent,
                                ),
                                Text(
                                  '${coins[i].percentage}',
                                  style: TextStyle(
                                      color:
                                      coins[i].sign == 'positive'
                                              ? primaryColor
                                              : Colors.redAccent),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              );
            });
  }

  Widget chart() {
  return LineChart(LineChartData(
    gridData: FlGridData(
      show: true,
      drawVerticalLine: false,
      drawHorizontalLine: false,
    ),
    titlesData: FlTitlesData(
      show: true,
      rightTitles: SideTitles(showTitles: false),
      topTitles: SideTitles(showTitles: false),
      bottomTitles: SideTitles(
        showTitles: false,
      ),
      leftTitles: SideTitles(
        showTitles: false,
      ),
    ),
    borderData: FlBorderData(show: true, border: Border.all(width: 0)),
    minX: 0,
    maxX: 11,
    minY: 0,
    maxY: 6,
    lineBarsData: [
      LineChartBarData(
        spots: const [
          FlSpot(0, 3),
          FlSpot(2.6, 2),
          FlSpot(4.9, 5),
          FlSpot(6.8, 3.1),
          FlSpot(8, 4),
          FlSpot(9.5, 3),
          FlSpot(11, 4),
        ],
        isCurved: true,
        colors: gradientColors,
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          colors:
              gradientColors.map((color) => color.withOpacity(0.3)).toList(),
        ),
      ),
    ],
  ));
}

  Widget priceList(){
    return ListView.builder(
        padding: EdgeInsets.only(left: 25, right: 20),
        shrinkWrap: true,
        itemCount: 8,
        itemBuilder: (BuildContext context, int i) {
          return Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Open',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w500,fontSize: 16,fontFamily: 'Open Sans'),),
                Text('155.74',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w700,fontSize: 16,fontFamily: 'Open Sans'),),
                Text('Vol',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w500,fontSize: 16,fontFamily: 'Open Sans'),),
                Text('52.87m',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w700,fontSize: 16,fontFamily: 'Open Sans'),),
              ],
            ),
          );
        });
  }