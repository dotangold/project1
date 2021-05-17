CC=gcc
CFLAGS= -Wall 
DEPS = Project1.c
OBJ = Project1.o  
EXEC = Project1
LIBS_PATH = -L$(PWD) 
LIBS = -lCommon

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $<

#$(EXEC): $(OBJ)
#	$(CC) $(LIBS_PATH) $(CFLAGS) -o $@ $^ $(LIBS)

#$(EXEC): $(DEPS)
#	$(CC) $(LIBS_PATH) -Wl,-rpath=$(PWD) $(CFLAGS) -o $@ $^ $(LIBS)

$(EXEC): $(DEPS)
	$(CC)  $(CFLAGS) -o $@ $^ $(LIBS) $(LIBS_PATH)
	
.PHONY: clean

clean:
	rm -f *.o $(EXEC) *.so
