CC=gcc
CFLAGS=-I.
#DEPS = Project1.h
OBJ = Project1.o 
EXEC = Project1

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

$(EXEC): $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)
	
.PHONY: clean

clean:
	rm -f *.o $(EXEC)