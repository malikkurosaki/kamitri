import 'package:flutter/material.dart';
import 'package:kamitrils/util_pref.dart';

class Root extends StatefulWidget {
  const Root({ Key? key }) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {

  @override
  void initState() {
    onLoad();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: Text('loading ...'),
      ),
    );
  }

  Future onLoad()async{
    await Future.delayed(const Duration(seconds: 1));
    if(Pref.userId().has()){
      Navigator.of(context).pushReplacementNamed('/home');
    }else{
     Navigator.of(context).pushReplacementNamed('/login');
    }
  }
}