import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shop_appliction/utils/MyApi.dart';
import 'package:shop_appliction/widgets/AppBarCustomized.dart';
import 'AllProducts.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  List categoryList = [], catIdList = [], productList = [], itemProductsList = [];

  void getMenu() async {
    Dio dio = Dio();
    Response response = await dio.post(MyApi.menuApi);
    setState(() {
      categoryList = response.data['data']['category'];
      catIdList = response.data['data']['cat_id'];
      productList = response.data['data']['product'];
    });
  }

  void _getProducts(index) {
    setState(
          () {
        itemProductsList.clear();
        for (int i = 0; i < productList.length; i++) {
          if (productList[i]['cat_id'] == catIdList[index]) {
            var name = productList[i]['name'];
            var price = productList[i]['price'];
            var image = productList[i]['img'];
            var id = productList[i]['id'];
            var description = productList[i]['description'];
            var code = productList[i]['code'];
            var amount = productList[i]['amount'];
            Map map = {'id': id, 'name': name, 'price': price, 'image': image, 'description': description , 'code' : code , 'amount' : amount};
            itemProductsList.add(map);
          }
        }
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AllProducts(itemProductsList)));
      },
    );
  }

  Widget gridView(Size size) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 3 / 2.7),
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        primary: false,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              _getProducts(index);
            },
            child: Container(
              child: Column(
                children: <Widget>[
                  Card(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    elevation: 3.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        categoryList[index]['url'],
                        fit: BoxFit.fill,
                        height: 140.0,
                        width: size.width,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(categoryList[index]['name'], style: TextStyle(fontSize: 16.0)),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _CategoryPageState() {
    getMenu();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarCustomized(title: 'Cutter Choob', count: '30'),
      body: gridView(size),
    );
  }

}