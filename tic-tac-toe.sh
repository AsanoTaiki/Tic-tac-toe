#!/bin/bash

clear

while :
do
    echo "--------Tic_Tac_Toe_Game-------"
    echo "Select the difficulty level.";
    echo "   easy        -> Enter \"1\".";
    echo "   normal      -> Enter \"2\".";
    echo "   hard        -> Enter \"3\".";
    echo -n "Number : ";
    read DIFF

    if [ $DIFF = 1 ];then
	KEY=1000
	KEYCHAR="easy"
	break
    elif [ $DIFF = 2 ];then
	KEY=10000
	KEYCHAR="normal"
	break
    elif [ $DIFF = 3 ];then
	KEY=500000
	KEYCHAR="hard"
	break
    else
	echo "Input error!! : please enter correct number."
	clear
    fi
done

clear

while :
do
    echo "--------Tic_Tac_Toe_Game-------"
    echo "Choose whether you are the first move or second move.";
    echo "   First move  -> Enter \"1\".";
    echo "   Second move -> Enter \"2\".";
    echo -n "Number : ";
    read MOVE

    if [ $MOVE = 1 ];then
	MOVECHAR="First"
	break
    elif [ $MOVE = 2 ];then
	MOVECHAR="Second"
	break
    else
	echo "Input error!! : please enter correct number."
	clear
    fi
done

clear

echo "--------Tic_Tac_Toe_Game-------"
echo "Difficulty : $KEYCHAR";
echo "Move : $MOVECHAR";
echo "OK? [y/n]"
read START

if [ $START = "y" ];then
    make
    clear
    ./main `expr $MOVE - 1` $KEY
else
    clear
fi

exit 0
