import 'package:ball_dont_lie/utils/pallete.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatefulWidget {
  const GradientButton(
      {Key? key, required this.buttontext, required this.onPressed})
      : super(key: key);
  final String buttontext;
  final VoidCallback onPressed;

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Pallete.gradient1,
            Pallete.gradient2,
            Pallete.gradient3,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: _isLoading==true
          ? const Center
          (
            child: CircularProgressIndicator
            (
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          )
          : ElevatedButton
          (
            onPressed: () async 
            {
              setState(() {
                _isLoading = true;
              });

              try 
              {
                widget.onPressed();
              } 
              catch (e) 
              {
                setState(() {
                  _isLoading = false;
                });
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(e.toString())));
              } 
              finally 
              {
                  setState(() {
                    _isLoading = false;
                  });
              }
            },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(395, 55),
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              child: Text(
                widget.buttontext,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
            ),
    );
  }
}
