import 'package:flutter/material.dart';

class Constant {
  static void showErrorDailog({required BuildContext context, required String msg}) {
    showDialog(context: context, builder: (builder)=>
    
    AlertDialog(

title: Text(msg,style: const TextStyle(fontSize: 18,color: Colors.black),),
actions: [
  TextButton(onPressed: ()=>{

    Navigator.pop(context)

  }, child: const Text('Ok', style: TextStyle(fontSize: 14 ,color: Colors.black,fontWeight:  FontWeight.bold),))
],

    )
    );
  }
}
