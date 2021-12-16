import 'package:flutter/material.dart';

class ListDesign3 extends StatefulWidget {
  ListDesign3({Key key}) : super(key: key);

  @override
  _ListDesign3State createState() => _ListDesign3State();
}

class _ListDesign3State extends State<ListDesign3> {
  List data = [
    {
      'productName': 'Badminton Shoes',
      'productPrice': 'Rs. 999',
      'productImage': 'images/product/product1.jpeg'
    },
    {
      'productName':
          'Heat Running Shoes, Cricket Shoes, Walking Shoes, Training & Gym Shoes	',
      'productPrice': 'Rs. 499',
      'productImage': 'images/product/product2.jpg'
    },
    {
      'productName': 'Trendy Grey Blue Running Shoes',
      'productPrice': 'Rs. 831',
      'productImage': 'images/product/product4.jpg'
    },
    {
      'productName': 'Mens Air White Blue Running Sports Shoes (10)',
      'productPrice': 'Rs. 423',
      'productImage': 'images/product/product3.jpg'
    },
    {
      'productName': 'Super Matteress FIT-MEN Loafers',
      'productPrice': 'Rs. 765',
      'productImage': 'images/product/product4.jpg'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Item List"),
            backgroundColor: Color.fromRGBO(64, 75, 96, .9),
          ),
          body: list2()),
    );
  }

  Widget list2() {
    return ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 5.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60.0,
                    height: 60.0,
                    child: Image(
                        image: AssetImage(data[index]['productImage'].toString()),
                        fit: BoxFit.fill),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Text(
                              data[index]['productName'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.0),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Text(
                              data[index]['productPrice'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget list1() {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Card(
          elevation: 6.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/user.png',
                    width: 55.0,
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Silim Lights',
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the',
                        maxLines: 2,
                        style: TextStyle(fontSize: 10.0),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        '\$12.0',
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.teal,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
