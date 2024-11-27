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
    _initalizeBoard();
  }

  //initialize the board
  void _initalizeBoard() {
    //initialize the board  with nulls, meaning no pieces in those positions ;
    List<List<ChessPiece?>> newBoard = List.generate(
        8,
        (index) => List.generate(
              8,
              (index) => null,
            ));

    //place pawns
    for (int i = 0; i < 8; i++) {
      newBoard[1][i] = ChessPiece(
          type: ChessPieceType.pwan,
          isWhite: false,
          imagePath: 'lib/images/pawn.png');
      for (int i = 0; i < 8; i++) {
        newBoard[6][i] = ChessPiece(
            type: ChessPieceType.pwan,
            isWhite: true,
            imagePath: 'lib/images/wpawn.png');
      }

      //place rooks

      //place knights

      //place bishops

      //place kings

      //place queens

      board = newBoard;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          itemCount: 8 * 8,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
          itemBuilder: (context, index) {
            //get the row and col position of this square

            int row = index ~/ 8;
            int col = index % 8;
            return Square(
              isWhite: isWhite(index),
              piece: board[row][col],
            );
          }),
    );
  }
}
