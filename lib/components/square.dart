import 'package:chess_game/components/piece.dart';
import 'package:chess_game/values/color.dart';
import 'package:flutter/material.dart';

class Square extends StatelessWidget {
  final bool isWhite;
  final ChessPiece? piece;
  final bool isSelected;
  final void Function()? onTap;
  const Square(
      {super.key, required this.isWhite, this.piece, required this.isSelected, this.onTap});

  @override
  Widget build(BuildContext context) {
    Color? squareColor;

    //if selected, square is green
    if (isSelected) {
      squareColor = Colors.green;
    }

    //otherwise white or black
    else {
      squareColor = isWhite ? foregroundColor : backgroundColor;
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: squareColor,
        child: piece != null ? Image.asset(piece!.imagePath) : null,
      ),
    );
  }
}
