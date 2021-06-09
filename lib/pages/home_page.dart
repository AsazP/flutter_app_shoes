import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_demo/models/product_model.dart';
import 'package:flutter_ecommerce_demo/pages/detail_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductModel> addItems = [];

  @override
  Widget build(BuildContext context) {
    //Definir tamaño de animatedContainer
    final size = MediaQuery.of(context).size;
    double _height = addItems.length > 0 ? size.height * .78 : size.height;

    final _borderRadius = addItems.length > 0
        ? BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          )
        : BorderRadius.circular(0.0);
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 241, 248, 1.0),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(240, 241, 248, 1.0),
        leading: Container(
          margin: EdgeInsets.only(left: 25.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              //"https://cdn.icon-icons.com/icons2/370/PNG/512/Users2_37173.png"
              "https://i.pinimg.com/474x/5c/8e/67/5c8e6791cd678ea84417366f0c5c5d67.jpg",
            ),
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.black,
            size: 40.0,
          ),
          SizedBox(width: 25.0),
        ],
      ),
      body: Stack(
        children: [
          _cart(),
          _animatedBody(_height, _borderRadius, context),
        ],
      ),
    );
  }

  Widget _cart() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 150.0,
        color: Colors.black,
        padding: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 35.0,
        ),
        child: Row(
          children: [
            Text(
              "Cart",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            _cartItems(),
            CircleAvatar(
              backgroundColor: Colors.amber[800],
              child: Container(
                padding: EdgeInsets.all(7.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cartItems() {
    int _milliseconds = addItems.length == 1 ? 1200 : 800;
    return Expanded(
      child: Container(
        height: 100.0,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: addItems.length,
          reverse: true,
          itemBuilder: (context, index) {
            return TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: Duration(milliseconds: _milliseconds),
              builder: (context, value, widget) {
                //  print(value);
                return Opacity(
                  opacity: value,
                  child: Transform.translate(
                    offset: Offset(0.0, 50 * (1 - value)),
                    child: widget,
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Image.asset(
                      addItems[index].path,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _animatedBody(double _height, _borderRadius, BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 700),
      width: double.infinity,
      height: _height,
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 0.5,
      ),
      decoration: BoxDecoration(
        color: Color.fromRGBO(240, 241, 248, 1.0),
        borderRadius: _borderRadius,
      ),
      child: Column(
        children: [
          _titleSection(),

          // _gridProduct(),
        ],
      ),
    );
  }

  //////////////////////////
  ///
  ///
  Widget _titleSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Shoes',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26.0
                    ),
                  ),
                ),
              ],
            ),
          ),
          /*3*/
      
          _options()
        ],
      ),
    );
  }

  ///
  ///
  /////////////////////////

  Widget _options() {
    return GestureDetector(
      onTap: () => _settingModalBottomSheet(context),
      child: Row(
        children: [
          Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Row(
                children: [
                  Text(
                    "Sort by",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ), 
                  ),
                  SizedBox(width: 5.0),                  
                  Icon(Icons.filter_list_alt),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          child: new Wrap(
            children: <Widget>[
              new ListTile(
                  leading: new Icon(Icons.music_note),
                  title: new Text('Music'),
                  onTap: () => {}),
              new ListTile(
                leading: new Icon(Icons.videocam),
                title: new Text('Video'),
                onTap: () => {},
              ),
              new ListTile(
                  leading: new Icon(Icons.music_note),
                  title: new Text('Music'),
                  onTap: () => {}),
              new ListTile(
                leading: new Icon(Icons.videocam),
                title: new Text('Video'),
                onTap: () => {},
              ),
              new ListTile(
                  leading: new Icon(Icons.music_note),
                  title: new Text('Music'),
                  onTap: () => {}),
              new ListTile(
                leading: new Icon(Icons.videocam),
                title: new Text('Video'),
                onTap: () => {},
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _gridProduct() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15.0,
        mainAxisSpacing: 15.0,
        mainAxisExtent: 270.0,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      color: Colors.black26,
                    ),
                    GestureDetector(
                      onTap: () {
                        addItems.add(products[index]);
                        setState(() {});
                        // print(addItems.length);
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Icon(
                          Icons.add,
                          color: Colors.orangeAccent,
                        ),
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    // print("Click!!!");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          product: products[index],
                        ),
                      ),
                    );
                    /* return PageRouteBuilder(
                      pageBuilder: (_, animation, secondaryAnimation) {
                        return DetailPage(
                          product: products[index],
                        );
                      },
                      transitionsBuilder:
                          (_, animation, secondaryAnimation, child) {
                        return child;
                      },
                    ); */
                  },
                  child: Hero(
                    tag: "Key_${products[index].id}",
                    child: Image.asset(
                      products[index].path,
                      width: 140.0,
                      height: 100.0,
                    ),
                  ),
                ),
                Text(
                  products[index].type,
                  style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  products[index].description,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  "\$${products[index].price}",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.orangeAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
