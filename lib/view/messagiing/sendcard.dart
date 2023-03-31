import 'package:flutter/cupertino.dart';
import 'package:founder_app/common/constants/constants.dart';

Widget sendcard(context,String mssg){
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight, 
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width*0.7),
            child: Container( 
              decoration: BoxDecoration(
                color:backgroundColorConst,
                borderRadius:const BorderRadius.all(Radius.circular(5 ))
              ), 
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(mssg,),
              ),
            ),
            
          ),
        ),
       hBoxS 
      ],
    );
}