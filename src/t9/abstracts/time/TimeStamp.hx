package t9.abstracts.time;

/* Timestamp measured in milliseconds */
abstract TimeStamp(Milliseconds) to Milliseconds from Milliseconds
{
	inline public function new(ms :Milliseconds) this = ms;

	@:to
	inline public function toFloat() :Float
	{
		return this.toFloat();
	}

	@:to
	inline public function toInt() :Int
	{
		return Std.int(this.toFloat());
	}

	inline public static function now() :TimeStamp
	{
		var timeInMs :Milliseconds = new Milliseconds(Date.now().getTime());
		return new TimeStamp(timeInMs);
	}

	@:to
	inline public function toString() :String
	{
		return Date.fromTime(this.toFloat()).toString();
	}

	inline public function addSeconds(s :Seconds) :TimeStamp
	{
		return new TimeStamp(this + s.toMilliseconds());
	}

	inline public function subtractSeconds(rhs:Seconds) :TimeStamp
	{
		return new TimeStamp(this - rhs.toMilliseconds());
	}

	@:op(A + B)
	inline public function add(rhs:TimeStamp):Milliseconds
	{
		return new Milliseconds(this + rhs);
	}

	@:op(A - B)
	inline public function subtract(rhs:TimeStamp):Milliseconds
	{
		return new Milliseconds(this - rhs);
	}

	@:op(A > B)
	inline public function gt(rhs:TimeStamp):Bool
	{
		return this.toFloat() > rhs.toFloat();
	}

	@:op(A < B)
	inline public function lt(rhs:TimeStamp):Bool
	{
		return this.toFloat() < rhs.toFloat();
	}

	@:op(A == B)
	inline public function eq(rhs:TimeStamp):Bool
	{
		return this.toFloat() == rhs.toFloat();
	}
}