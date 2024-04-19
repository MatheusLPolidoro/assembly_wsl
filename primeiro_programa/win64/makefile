NAME=hello_world

all: $(NAME).o
	GoLink  /console /entry _start $(NAME).obj kernel32.dll
	del *.obj

%.o: %.asm
	nasm -g -f win64 $<