CC = clang
CFLAGS = -std=c99 -g -Wall -I/u2/filename.
PREPROCESSOR = -I/u2/pub/common/

LIB = /u2/pub/common/lib.o
SOURCES = main.c doc.c edit.c merge.c sign.c
OBJS = main.o doc.o edit.o merge.o sign.o

EXEC = viewer

$(EXEC): $(OBJS) $(LIB)
	$(CC) $(CFLAGS) $(PREPROCESSOR) -o $(EXEC) $(OBJS) $(LIB)

main.o: main.c doc.h edit.h merge.h sign.h /u2/filename.
	$(CC) $(CFLAGS) $(PREPROCESSOR) -c main.c

doc.o: doc.c doc.h /u2/filename.
	$(CC) $(CFLAGS) $(PREPROCESSOR) -c doc.c

edit.o: edit.c edit.h doc.h /u2/filename.
	$(CC) $(CFLAGS) $(PREPROCESSOR) -c edit.c

merge.o: merge.c merge.h doc.h /u2/filename.
	$(CC) $(CFLAGS) $(PREPROCESSOR) -c merge.c

sign.o: sign.c sign.h doc.h /u2/filename.
	$(CC) $(CFLAGS) $(PREPROCESSOR) -c sign.c

.PHONY: clean

clean:
	rm -f $(OBJS) $(EXEC)
