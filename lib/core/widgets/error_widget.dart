// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quetos/core/utils/app_colors.dart';

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment:CrossAxisAlignment.center ,
      children: [
        Center(child: Icon(Icons.warning_amber ,color: AppColors.primaryColor,size: 150,)),
        Container(
          margin:  const EdgeInsets.symmetric(vertical: 12),
          child: const Text("Something Went Wrong",style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.w700),),
        ),
        Text('PLease Try Again',style: TextStyle(color:AppColors.hintColor,fontSize: 18,fontWeight: FontWeight.w500),)
        ,Container(
          height: 55,
          width: MediaQuery.of(context).size.width * 0.55,
          margin: EdgeInsets.symmetric(vertical: 15),
          child: ElevatedButton(
          style:ElevatedButton.styleFrom(
            primary: AppColors.primaryColor,
            onPrimary: Theme.of(context).primaryColor,
            elevation: 500,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)
            ),
          ) ,  
          onPressed: () {  },
          child:Text('Reload Screen',style: TextStyle(color: Colors.white ,fontSize: 20, fontWeight:  FontWeight.w700), ) ),
        )
      ],
    );
  }
}
