import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerpractice/fish_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //create 메소드를 통해서 리턴하면 provide의 차일드가 되는모든 위젯에서 리턴값에 접근할 수 있다.
      create: (context)=>FishModel(name: 'Salmon', number: 10, size: 'big'),
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
        SizedBox(height: 20,),
        TextButton(onPressed: (){
          Provider.of<FishModel>(context, listen: false).ChangeFishNumber();
        },
        child: Text('increase Number')),
      ],
    );
  }
}
