#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>
// #include <sys/time.h>
#include <math.h>
#include "board.h"
#include "uct.h"

extern int PLAYOUT_MAX;
extern int EXPAND_THRESHOLD;
extern double C;
extern int DEPTH_MAX;

/**
 * ブロックの置く位置のガイドを表示
 */
void show_guide(void){
  int i;
  printf("---   guide   ---\n");
  for (i = 0; i < AREA; i++) {
    printf("%2d|", i);
    if ((i + 1) % 4 == 0)
      printf("\n");
  }
  printf("-----------\n");
}

/**
 * ユーザからの入力を得る
 * @param stone_t turn 現在の手番
 * @param stone_t board[][] 盤面
 * @return int 置いた位置 */
int input_move(stone_t turn, const stone_t board[HIGHT][AREA]) {
  char pos[100]; // buffer
  while (1) {
    printf("Your turn( %s) : Enter a number [0-15].\n",
	   get_stone_image(turn));
    printf(">");
    fgets(pos, 100, stdin);
    if (!isdigit(pos[0])) {
      printf("Illegal input!\n");
      continue;
    }
    if (atoi(pos) >= 0 && atoi(pos) < AREA && is_putable(atoi(pos), board))
      break;
    printf("Illegal move!\n");
  }
  return atoi(pos);
}

int main(int argc, char **argv) {
  stone_t turn;
  stone_t board[HIGHT][AREA];
  int pos = 16, pos_, layer;
  //  自分がBLACK, COMがWHITE
  turn = (atoi(argv[1]) != 0) ? WHITE : BLACK;
  // プレイアウト回数。難易度。
  PLAYOUT_MAX = atoi(argv[2]);
  // 盤面の初期化
  init_board(board);
  // 初期盤面
  print_board(board);
  while (1) {
    if (turn == BLACK) {
      show_guide();
      pos_ = uct(turn, board);
      // COMの推奨手。初手のみ表示しない
      if (pos != 16)
	printf("Previous COM move : %d\n", pos);
      printf("Software recommendation : %d\n", pos_);
      // 入力
      pos = input_move(turn, board);
      // 石を置く
      layer = put_stone(pos, turn, board);
    }
    else {
      pos = uct(turn, board);
      layer = put_stone(pos, turn, board);
      // ボードの表示
      print_board(board);
    }
    if (check_win(layer, pos, turn, board)) {
      if (!strcmp(get_stone_image(turn), "X "))
	printf("You Win !!\n");
      else
	printf("You Lose...\n");
      break;
    }		
    if (is_full(board)) {
      printf("Draw !!\n");
      break;
    }
    turn = REVERSE(turn);
  }
  return 0;
}
