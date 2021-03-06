CFLAGS=-W -Wall -pedantic
LDFLAGS=
EXEC=battery
BINDIR=/usr/bin
SRCDIR=src

all: $(EXEC)

$(EXEC): mkdir main.o
	gcc -o bin/$(EXEC) $(SRCDIR)/main.o $(LDFLAGS)
	rm -rf $(SRCDIR)/*.o

main.o: $(SRCDIR)/main.c $(SRCDIR)/global.h
	gcc -o $(SRCDIR)/main.o -c $(SRCDIR)/main.c $(CFLAGS)

mkdir:
	@mkdir -p bin/

clean:
	rm -rf $(SRCDIR)/*.o

mrproper:
	rm -rf $(SRCDIR)/*.o
	rm -rf bin/$(EXEC)

install:
	cp bin/$(EXEC) $(BINDIR)/$(EXEC)

uninstall:
	rm $(BINDIR)/$(EXEC)

