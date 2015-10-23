package net.barrettsprivateers.util;

import java.util.*;
import java.io.*;


public class Treeify {
    public static void main(String[] args) throws IOException {
	Scanner scan = new Scanner(System.in);
	StringBuilder sb = new StringBuilder();

	sb.append(scan.nextLine());
	while(scan.hasNext()) {
	    sb.append(" " + scan.nextLine());
	}

	System.out.println(treeify(sb.toString(),"(",")"));
	
    }

    public static String treeify(String s, String open, String close) {
	int depth = 0;
	int pos = 0;
	int next = 0;
	int skipLength = 0; 
	StringBuilder ret = new StringBuilder();
	
	while(true) {
	    int openPosition = s.indexOf(open, pos + skipLength);
	    int closePosition = s.indexOf(close, pos + skipLength);
	    int change = 0;
	    if((openPosition >= 0) && (openPosition < closePosition)) {
		change = 1;
		skipLength = open.length();
		next = openPosition;
	    } else {
		change = -1;
		skipLength = close.length();
		next = closePosition;
	    }
	    if(next < 0) {
		break;
	    }
	    
	    for(int i =0; i < depth; i++) {
		ret.append("  ");
	    }
	    ret.append(s.substring(pos,next));
	    ret.append("\n");
	    depth += change;
	    pos = next;
	}
	ret.append(pos);
	    
	return ret.toString();
    }
}
