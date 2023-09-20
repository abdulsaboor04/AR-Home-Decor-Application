import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool loading;

  const RoundButton({Key? key,
    required this.title ,
    required this.onTap,
    this.loading = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.green.shade800,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
        BoxShadow(
        color: Colors.green.shade900,
        spreadRadius: 1,
        blurRadius: 10,
        offset: Offset(0,7),
      )
        ]
            
        ),
        child: Center(child: loading ? CircularProgressIndicator(strokeWidth: 3,color: Colors.white,) : Text(title,style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),),),
      ),
    );
  }
}
