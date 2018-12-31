CC=gcc
OBJS=main.o board.o uct.o
CFLAGS=-Wall -O3 
TARGET=main

all: $(TARGET)

$(TARGET): $(OBJS)
	gcc -o $@ $(OBJS) -lm 

clean:
	rm $(TARGET) *.o
