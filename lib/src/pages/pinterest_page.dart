import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:disenos/src/widgets/pinterest_menu.dart';

class PinterestPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ( _ ) => new _MenuModel(),
      child: Scaffold(
        body: Stack(
          children: [
            PinterestGrid(),
            _PinterestMenuLocation()
          ],
        )
   ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final widthPantalla = MediaQuery.of(context).size.width;
    final mostrar = Provider.of<_MenuModel>(context).mostrar;
    
    return Positioned(
      bottom: 30,
      child: Container(
        width: widthPantalla,
        child: Align(
          child: PinterestMenu(
            mostrar: mostrar,
            items: [
              PinterestButton(icon: Icons.pie_chart, onPressed: (){print('Con pie chart'); }),
              PinterestButton(icon: Icons.search, onPressed: (){print('Con search'); }),
              PinterestButton(icon: Icons.notifications, onPressed: (){print('Con notifications'); }),
              PinterestButton(icon: Icons.supervised_user_circle, onPressed: (){print('Con supervised_user_circle'); }),
            ]
          )
        )
      )
    );
  }
}


class PinterestGrid extends StatefulWidget {

  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {

  final List<int> items = List.generate(200, (index) => index);
  ScrollController controller = new ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() {
    controller.addListener((){
      if(controller.offset >  scrollAnterior && controller.offset > 150){
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      }else{
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }

      scrollAnterior = controller.offset;
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}


class _PinterestItem extends StatelessWidget {
  final int index;

  const _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30.0)
      ),
      child: new Center(
        child: new CircleAvatar(
          backgroundColor: Colors.white,
          child: new Text('$index'),
        ),
      )
    );
  }
}


class _MenuModel with ChangeNotifier {

  bool _mostrar = true;

  bool get mostrar => this._mostrar;

  set mostrar(bool valor){
    this._mostrar = valor;
    notifyListeners();
  }
  
}