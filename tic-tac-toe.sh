#!/bin/bash

echo "Select the difficulty level.";
echo "   easy        -> Enter \"1\".";
echo "   normal      -> Enter \"2\".";
echo "   hard        -> Enter \"3\".";
echo -n "Number : ";
read DIFF

if [ $DIFF = 1 ];then
   KEY=1000
elif [ $DIFF = 2 ];then
   KEY=10000
elif [ $DIFF = 3 ];then
   KEY=500000
else
    echo "Input error!! : please enter correct number."
fi

echo "Choose whether you are the first move or second move.";
echo "   First move  -> Enter \"1\".";
echo "   Second move -> Enter \"2\".";
echo -n "Number : ";
read MOVE

if [ $MOVE = 1 ];then
    ./main 0 $KEY
elif [ $MOVE = 2 ];then
    ./main 1 $KEY
else
    echo "Input error!! : please enter correct number."
fi

exit 0
