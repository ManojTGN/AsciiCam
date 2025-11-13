CC = g++
BINS = asciicam

CFLAGS = -Wall -Wextra
CVFLAGS = -lopencv_core -lopencv_imgproc -lopencv_highgui -lopencv_videoio -lopencv_stitching

CVLIB = C:/msys64/mingw64/lib
CVINCLUDE = C:/msys64/mingw64/include/opencv4

all: $(BINS)

ac_cmd.o:
	$(CC) -c ./src/ac_cmd.cpp -o ./build/ac_cmd.o -L$(CVLIB) -I$(CVINCLUDE) $(CVFLAGS)

ac_json.o:
	$(CC) -c ./src/ac_json.cpp -o ./build/ac_json.o

ac_cli.o: 
	$(CC) -c ./src/ac_cli.cpp -o ./build/ac_cli.o 

asciicam: ac_json.o ac_cli.o ac_cmd.o 
	$(CC) -o ./build/asciicam.exe ./src/main.cpp ./build/ac_cli.o ./build/ac_json.o ./build/ac_cmd.o -L$(CVLIB) -I$(CVINCLUDE) $(CFLAGS) $(CVFLAGS)
