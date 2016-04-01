package t9.abstracts.time;

abstract Milliseconds(Float)
{
	inline public function new(m:Float) this = m;

	@:to
	inline public function toMinutes() :Minutes
	{
		return toSeconds().toMinutes();
	}

	@:from
	inline static public function fromInt(i :Int) :Milliseconds
	{
		return new Milliseconds(i + 0.0);
	}

	@:to
	inline public function toInt() :Int
	{
		return Std.int(this);
	}

	@:to
	inline public function toFloat() :Float
	{
		return this;
	}

	@:op(A + B)
	inline public function add(rhs:Milliseconds):Milliseconds
	{
		return new Milliseconds(this + rhs.toFloat());
	}

	@:op(A - B)
	inline public function subtract(rhs:Milliseconds):Milliseconds
	{
		return new Milliseconds(this - rhs.toFloat());
	}

	@:from
	inline static public function fromSecond(s:Seconds) :Milliseconds
	{
		return s.toMilliseconds();
	}

	@:to
	inline public function toSeconds() :Seconds
	{
		return new Seconds(this / 1000.0);
	}

	@:to
	inline public function toString() :String
	{
		return '[${this}ms]';
	}
}