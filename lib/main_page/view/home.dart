import 'package:flutter/material.dart';
import 'package:list_items/api/api.dart';
import 'package:list_items/main_page/view/widget/item_cart.dart';
import 'package:list_items/main_page/model/item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<listBarang> _listBarang;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    getlistBarang();
  }

  Future<void> getlistBarang() async {
    _listBarang = await listBarangApi.getlistBarang();
    setState(() {
      _isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_box),
            SizedBox(
              width: 10,
            ),
            Text('List Barang')
          ],
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _listBarang.length,
              itemBuilder: (context, index) {
                return itemCart(
                    title: _listBarang[index].name,
                    
                    rating: _listBarang[index].rate.toString(),
                    thumbnailUrl: _listBarang[index].images);
              },
            ),
    );
  }
}
