
BASE_PATH = net/barrettsprivateers/tableman
TABLE_PATH = $(BASE_PATH)/tables
BUILDER_PATH = $(BASE_PATH)/builder
PARSER_PATH = $(BASE_PATH)/parser
PARSER_PKG = net.barrettsprivateers.tableman.parser

JR = java
JC = javac
CLASSPATH = -cp '../lib/antlr-4.5.1-complete.jar:../lib/guice-4.0.jar:.'

test_parser: parser_bin util_lib
	$(JR) $(CLASSPATH) org.antlr.v4.gui.TestRig $(PARSER_PKG).TableMan tableFile <test/test1.txt -tree | $(JR) $(CLASSPATH) net.barrettsprivateers.util.Treeify

show_tokens: parser_bin
	$(JR) $(CLASSPATH) org.antlr.v4.gui.TestRig $(PARSER_PKG).TableMan tableFile <test/test1.txt -tokens

build_all: base_lib table_lib parser_bin

parser_bin: parser_src
	$(JC) $(CLASSPATH) $(PARSER_PATH)/*.java

parser_src: TableMan.g4 #TableManBaseLexer.g4
	java -Xmx500M $(CLASSPATH) org.antlr.v4.Tool TableMan.g4 -o $(PARSER_PATH)

base_lib: $(BASE_PATH)/*.java
	$(JC) $(CLASSPATH) $(BASE_PATH)/*.java

table_lib: base_lib $(TABLE_PATH)/*.java
	$(JC) $(CLASSPATH) $(TABLE_PATH)/*.java

util_lib: net/barrettsprivateers/util/*.java
	$(JC) $(CLASSPATH) net/barrettsprivateers/util/*.java

clean:
	rm -vf net/barrettsprivateers/tableman/parser/*.java
	find . -name "*.tokens" | xargs rm -vf
	find . -name "*.class" | xargs rm -vf
	find . -name "*~" | xargs rm -vf
