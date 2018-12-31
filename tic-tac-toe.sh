#!/bin/bash

echo "Select the difficulty level.";
echo "   easy        -> Enter \"1\".";
echo "   normal      -> Enter \"2\".";
echo "   hard        -> Enter \"3\".";
echo -n "Number : ";
read DIFF

while :
do
   if [ $DIFF = 1 ];then
      KEY=1000
      break
   elif [ $DIFF = 2 ];then
      KEY=10000
      break
   elif [ $DIFF = 3 ];then
      KEY=500000
      break
   else
      echo "Input error!! : please enter correct number."
   fi
done

echo "Choose whether you are the first move or second move.";
echo "   First move  -> Enter \"1\".";
echo "   Second move -> Enter \"2\".";
echo -n "Number : ";
read MOVE

while:
do
   if [ $MOVE = 1 ];then
      ./main 0 $KEY
      break
   elif [ $MOVE = 2 ];then
      ./main 1 $KEY
      break
   else
      echo "Input error!! : please enter correct number."
   fi
done

exit 0
