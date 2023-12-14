import 'dart:io';

List<String> board = List.filled(9, ' ');

String currentPlayer = 'X';

void main() {
  print('Welcome to Tic-Tac-Toe!');
  printBoard();

  while (true) {
    takeTurn();
    printBoard();

    if (checkForWinner()) {
      print('$currentPlayer wins! Congratulations!');
      break;
    }

    if (isBoardFull()) {
      print('It\'s a draw! The game ends in a tie.');
      break;
    }

    switchPlayer();
  }
}

void printBoard() {
  print(' ${board[0]} | ${board[1]} | ${board[2]} ');
  print('-----------');
  print(' ${board[3]} | ${board[4]} | ${board[5]} ');
  print('-----------');
  print(' ${board[6]} | ${board[7]} | ${board[8]} ');
}

void takeTurn() {
  while (true) {
    print('Player $currentPlayer, enter your move (1-9):');
    var input = stdin.readLineSync();

    try {
      var move = int.parse(input!);

      if (isValidMove(move)) {
        board[move - 1] = currentPlayer;
        break;
      } else {
        print('Invalid move. Please choose an empty cell (1-9).');
      }
    } catch (e) {
      print('Invalid input. Please enter a number (1-9).');
    }
  }
}

bool isValidMove(int move) {
  return move >= 1 && move <= 9 && board[move - 1] == ' ';
}

bool checkForWinner() {
  return checkLine(0, 1, 2) ||
      checkLine(3, 4, 5) ||
      checkLine(6, 7, 8) ||
      checkLine(0, 3, 6) ||
      checkLine(1, 4, 7) ||
      checkLine(2, 5, 8) ||
      checkLine(0, 4, 8) ||
      checkLine(2, 4, 6);
}

bool checkLine(int a, int b, int c) {
  return board[a] != ' ' && board[a] == board[b] && board[b] == board[c];
}

bool isBoardFull() {
  return !board.contains(' ');
}

void switchPlayer() {
  currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';
}
