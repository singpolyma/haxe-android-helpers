package com.boltmade.android;

import haxe.macro.Context;
import haxe.macro.Expr;
import sys.io.File;

class R {
	macro public static function get(key:String):Expr {
		var sel = key.split(".");
		var res = File.getContent(Context.resolvePath("R.txt")).split("\n");
		for(line in res) {
			var tok = line.split(" ");
			if(tok[1] == sel[0] && tok[2] == sel[1]) {
				var val = tok.slice(3).join(" ");
				if(val.charAt(0) == '{') {
					val = '[ ' + val.substring(1,val.length-2) + ' ]';
				}
				return Context.parse(val, Context.currentPos());
			}
		}

		return Context.error("R." + key + ": not found in Android resources", Context.currentPos());
	}
}
