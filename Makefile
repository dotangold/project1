CC=gcc
CFLAGS= -Wall 
DEPS = Project1.c
OBJ = Project1.o  
EXEC = Project1
LIBS_PATH = -L$(PWD) 
LIBS = -lCommon
COMMOM_LIB_PATH=../Common
INCLUDE_FILES = Common.h

%.o: %.c
	$(CC) -c -o $@ $<

#$(EXEC): $(OBJ)
#	$(CC) $(LIBS_PATH) $(CFLAGS) -o $@ $^ $(LIBS)

#$(EXEC): $(DEPS)
#	$(CC) $(LIBS_PATH) -Wl,-rpath=$(PWD) $(CFLAGS) -o $@ $^ $(LIBS)

Shared: 
	$(MAKE) -C  $(COMMOM_LIB_PATH) clean
	$(MAKE) -C  $(COMMOM_LIB_PATH)

install:
	cp $(COMMOM_LIB_PATH)/*.so $(COMMOM_LIB_PATH)/$(INCLUDE_FILES) .
# export LD_LIBRARY_PATH=$(`pwd`)

$(EXEC) : $(OBJ) 
	$(CC)  $(CFLAGS) -o $@ $^ $(LIBS) $(LIBS_PATH)
	
.PHONY: clean

clean:
	rm -f *.o $(EXEC) *.so $(INCLUDE_FILES)

all: Shared install $(EXEC)
	
	
### do : export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(pwd)
