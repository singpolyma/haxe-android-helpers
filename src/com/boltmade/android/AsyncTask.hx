package com.boltmade.android;

class AsyncTask<A> extends android.os.AsyncTask<A,java.lang.Void,java.lang.Void> {
	private var task:A -> Void;

	@:overload public function new() {
		super();
		throw "AsyncTask must be given a function";
	}

	@:overload public function new(tsk:A -> Void) {
		super();
		task = tsk;
	}

	@:overload public function execute(x:A) {
		return execute(java.Lib.nativeArray([x], true));
	}

	@:overload function doInBackground(args:java.NativeArray<A>):java.lang.Void {
		task(args.length > 0 ? args[0] : null);
		return null;
	}


}
