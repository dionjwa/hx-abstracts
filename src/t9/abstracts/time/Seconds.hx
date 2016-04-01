package t9.abstracts.time;

abstract Seconds(Float)
{
	inline public function new(s:Float) this = s;

	@:to
	inline public function toMilliseconds() :Milliseconds
	{
		return new Milliseconds(this * 1000.0);
	}

	@:to
	inline public function toMinutes() :Minutes
	{
		return new Minutes(this / 60.0);
	}

	@:op(A + B)
	inline public function add(rhs:Seconds):Seconds
	{
		return new Seconds(this + rhs.toFloat());
	}

	@:op(A + B)
	inline public function addInt(rhs:Int):Seconds
	{
		return new Seconds(this + rhs);
	}

	@:op(A - B)
	inline public function subtract(rhs:Seconds):Seconds
	{
		return new Seconds(this - rhs.toFloat());
	}

	@:op(A % B)
	inline public function mod(rhs:Seconds):Seconds
	{
		return new Seconds(Std.int(this) % Std.int(rhs));
	}

	@:op(A > B)
	inline public function gt(rhs:Seconds):Bool
	{
		return this > rhs.toFloat();
	}

	@:op(A < B)
	inline public function lt(rhs:Seconds):Bool
	{
		return this < rhs.toFloat();
	}

	@:op(A == B)
	inline public function eq(rhs:Seconds):Bool
	{
		return this == rhs.toFloat();
	}

	@:to
	inline public function toString() :String
	{
		return '[${this}s]';
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
}