package t9.abstracts.time;

/* Timestamp measured in milliseconds */
abstract TimeStamp(Float)
{
	inline public function new(ms :Milliseconds) this = ms;

	@:to
	inline public function toFloat() :Float
	{
		return this;
	}

	@:to
	inline public function toInt() :Int
	{
		return Std.int(this);
	}

	inline public static function now() :TimeStamp
	{
#if js
		return new TimeStamp(untyped __js__('Date.now() + 0.0'));
#else
		throw 'Implement TimeStamp.now()';
#end
	}

	@:to
	inline public function toString() :String
	{
		return Date.fromTime(this).toString();
	}

	inline public function addSeconds(s :Seconds) :TimeStamp
	{
		return new TimeStamp(new Milliseconds(this + s.toMilliseconds().toFloat()));
	}

	inline public function subtractSeconds(rhs:Seconds):TimeStamp
	{
		return new TimeStamp(new Milliseconds(this - rhs.toMilliseconds().toFloat()));
	}

	@:op(A + B)
	inline public function add(rhs:TimeStamp):Milliseconds
	{
		return new Milliseconds(this + rhs.toFloat());
	}

	@:op(A - B)
	inline public function subtract(rhs:TimeStamp):Milliseconds
	{
		return new Milliseconds(this - rhs.toFloat());
	}

	@:op(A > B)
	inline public function gt(rhs:TimeStamp):Bool
	{
		return this > rhs.toFloat();
	}

	@:op(A < B)
	inline public function lt(rhs:TimeStamp):Bool
	{
		return this < rhs.toFloat();
	}

	@:op(A == B)
	inline public function eq(rhs:TimeStamp):Bool
	{
		return this == rhs.toFloat();
	}
}