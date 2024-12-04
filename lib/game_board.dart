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
      newBoard[0][0] = ChessPiece(
        type: ChessPieceType.rook,
        isWhite: false,
        imagePath: 'lib/images/brook.png',
      );
      newBoard[0][7] = ChessPiece(
        type: ChessPieceType.rook,
        isWhite: false,
        imagePath: 'lib/images/brook.png',
      );
      newBoard[7][0] = ChessPiece(
        type: ChessPieceType.rook,
        isWhite: true,
        imagePath: 'lib/images/wrook.png',
      );
      newBoard[7][7] = ChessPiece(
        type: ChessPieceType.rook,
        isWhite: true,
        imagePath: 'lib/images/wrook.png',
      );

      //place knights

      newBoard[0][1] = ChessPiece(
          type: ChessPieceType.knight,
          isWhite: false,
          imagePath: 'lib/images/knightw.png');
      newBoard[0][6] = ChessPiece(
          type: ChessPieceType.knight,
          isWhite: false,
          imagePath: 'lib/images/knightw.png');
      newBoard[7][1] = ChessPiece(
          type: ChessPieceType.knight,
          isWhite: true,
          imagePath: 'lib/images/blackknight.png');

      newBoard[7][6] = ChessPiece(
          type: ChessPieceType.knight,
          isWhite: true,
          imagePath: 'lib/images/blackknight.png');

      //place bishops
      newBoard[0][2] = ChessPiece(
        type: ChessPieceType.bishop,
        isWhite: false,
        imagePath: 'lib/images/bishop.png',
      );
      newBoard[0][5] = ChessPiece(
        type: ChessPieceType.bishop,
        isWhite: false,
        imagePath: 'lib/images/bishop.png',
      );
      newBoard[7][2] = ChessPiece(
        type: ChessPieceType.bishop,
        isWhite: true,
        imagePath: 'lib/images/bishop.png',
      );
      newBoard[7][5] = ChessPiece(
        type: ChessPieceType.bishop,
        isWhite: true,
        imagePath: 'lib/images/bishop.png',
      );

      //place kings
      newBoard[7][3] = ChessPiece(
        type: ChessPieceType.king,
        isWhite: true,
        imagePath: 'lib/images/king.png',
      );
      newBoard[7][3] = ChessPiece(
        type: ChessPieceType.queen,
        isWhite: true,
        imagePath: 'lib/images/kings.png',
      );

      //place queens
      newBoard[0][3] = ChessPiece(
        type: ChessPieceType.queen,
        isWhite: false,
        imagePath: 'lib/images/queen.png',
      );
      newBoard[7][4] = ChessPiece(
        type: ChessPieceType.queen,
        isWhite: true,
        imagePath: 'lib/images/queen.png',
      );

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
              isSelected: false,
            );
          }),
    );
  }
}
