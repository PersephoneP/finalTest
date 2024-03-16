COMPLR = g++
CFLAGS = -Wall -Wextra -g
SRCDIR = lib
INCDIR = header
BINDIR = bin
TARGET = finalTest
DEPEND = 

SOURCES := main.cpp $(wildcard $(SRCDIR)/*.cpp) $(wildcard *.cpp)
HEADERS := $(wildcard $(INCDIR)/*.h) $(wildcard $(INCDIR)/*.hpp) $(wildcard  *.h) $(wildcard *.hpp)
OBJECTS := $(SOURCES:.cpp=.o)

$(BINDIR)/$(TARGET): $(OBJECTS)
	@mkdir $(BINDIR)
	@$(COMPLR) $(CFLAGS) -I$(INCDIR) $^ -o $@ $(DEPEND)
	@echo "Executible created: $(BINDIR)/$(TARGET)"

%.o: %.cpp $(HEADERS)
	@$(COMPLR) $(CFLAGS) -I$(INCDIR) -c $< -o $@ $(DEPEND)

run:
	@./$(BINDIR)/$(TARGET)

debug:
	@gdb ./$(BINDIR)/$(TARGET)

clean:
	@rm -rf $(SRCDIR)/*.o
	@rm -rf *.o
	@rm -rf $(BINDIR)
	@echo "Cleaned up the mess."

.PHONY: clean