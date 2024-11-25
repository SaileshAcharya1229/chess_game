import 'package:chess_game/components/piece.dart';
import 'package:chess_game/components/square.dart';
import 'package:chess_game/helper/helper_methods.dart';
import 'package:flutter/material.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  // a 2-dimensional list representing the chess board,
  //with each position possibily containing a chess piece

  late List<List<ChessPiece?>> board;

  @override
  void initState() {
    super.initState();
  }

  //initialize the board
  void _initalizeBoard() {}
  //create a piece
  ChessPiece myPawn = ChessPiece(
      type: ChessPieceType.pwan,
      isWhite: true,
      imagePath: 'lib/images/pawn.png');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          itemCount: 8 * 8,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
          itemBuilder: (context, index) {
            return Square(
              isWhite: isWhite(index),
              piece: myPawn,
            );
          }),
    );
  }
}
