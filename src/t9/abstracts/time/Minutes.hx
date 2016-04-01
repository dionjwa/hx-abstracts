package t9.abstracts.time;

abstract Minutes(Float)
{
	inline public function new(m:Float) this = m;

	@:from
	inline static public function fromSecond(s:Seconds)
	{
		return s.toMinutes();
	}

	@:from
	inline static public function fromFloat(f :Float)
	{
		return new Minutes(f);
	}

	@:from
	inline static public function fromInt(i :Int)
	{
		return new Minutes(i);
	}

	@:to
	inline public function toMilliseconds() :Milliseconds
	{
		return new Milliseconds(this * 60.0 * 1000.0);
	}

	@:to
	inline public function toSeconds() :Seconds
	{
		return new Seconds(this * 60.0);
	}

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

	@:op(A + B)
	inline public function add(rhs:Minutes):Minutes
	{
		return new Minutes(this + rhs.toFloat());
	}

	@:op(A - B)
	inline public function subtract(rhs:Minutes):Minutes
	{
		return new Minutes(this - rhs.toFloat());
	}

	@:op(A % B)
	inline public function mod(rhs:Minutes):Minutes
	{
		return new Minutes(Std.int(this) % rhs.toFloat());
	}

	@:op(A > B)
	inline public function gt(rhs:Minutes):Bool
	{
		return this > rhs.toFloat();
	}

	@:op(A < B)
	inline public function lt(rhs:Minutes):Bool
	{
		return this < rhs.toFloat();
	}

	@:to
	inline public function toString() :String
	{
		return '[${this}min]';
	}
}