CC = gcc
CFLAGS = -Wall -Wextra -std=c99
SRCS = main.c func.c
OBJS = $(SRCS:.c=.o)
TARGET = myprogram

.PHONY: all clean clean-all install

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

install: $(TARGET)
	install -m 755 $(TARGET) /usr/local/bin
	install -m 644 header.h /usr/local/include

clean:
	$(RM) $(OBJS) $(TARGET)

clean-all: clean
	$(RM) /usr/local/bin/$(TARGET)
	$(RM) /usr/local/include/header.h
