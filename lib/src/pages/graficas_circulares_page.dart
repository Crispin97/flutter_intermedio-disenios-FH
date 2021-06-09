import 'package:disenos/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';


class GraficasCircularesPage extends StatefulWidget {
  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 40.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: (){
          setState(() {
            porcentaje += 10;
            if(porcentaje > 100){
              porcentaje = 0;
            }
          });
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.blue),
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.red),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.pink),
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.purple),
            ],
          ),
        ],
      ),
   );
  }
}

class CustomRadialProgress extends StatelessWidget {
  
  final Color color;

  const CustomRadialProgress({
    @required this.color,
    @required this.porcentaje,
  });

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: this.color,
        colorSecundario: Colors.grey,
        grosorPrimario: 10,
        grosorSecundario: 4,
      ),
    );
  }
}