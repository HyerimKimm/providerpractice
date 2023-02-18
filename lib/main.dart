import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerpractice/fish_model.dart';
import 'package:providerpractice/seafish_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context)=>FishModel(name: 'Salmon', number: 1, size: 'big')
        ),
        ChangeNotifierProvider(
            create: (context)=>SeaFishModel(name: 'Tuna', tunanumber: 1, size: 'middle')
        )
      ],
      child: MaterialApp(
        home: FishOrder(),
      ),
    );
  }
}

class FishOrder extends StatelessWidget {
  const FishOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fish Order'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'fish name : ${Provider.of<FishModel>(context).name}', style: TextStyle(fontSize: 20),
            ),
            Text('sea fish name : ${Provider.of<SeaFishModel>(context).name}',style: TextStyle(fontSize: 20),),
            SizedBox(
              height: 20,
            ),
            Number(),
          ],
        ),
      ),
    );
  }
}

class Number extends StatelessWidget {
  const Number({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text('fish number : ${Provider.of<FishModel>(context).number}', style: TextStyle(fontSize: 20),),
          Text('sea fish number : ${Provider.of<SeaFishModel>(context).tunanumber}', style: TextStyle(fontSize: 20),),
          SizedBox(height: 20,),
          Size(),
        ],
      ),
    );
  }
}

class Size extends StatelessWidget {
  const Size({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('fish size : ${Provider.of<FishModel>(context).size}', style: TextStyle(fontSize: 20),),
        Text('sea fish size : ${Provider.of<FishModel>(context).size}', style: TextStyle(fontSize: 20),),
        SizedBox(height: 20,),
        TextButton(onPressed: (){
          Provider.of<FishModel>(context, listen: false).ChangeFishNumber();
          Provider.of<SeaFishModel>(context, listen: false).ChangeFishNumber();
        },
        child: Text('increase Number')),
      ],
    );
  }
}
