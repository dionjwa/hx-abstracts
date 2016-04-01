package t9.abstracts.net;

abstract Port(Int)
{
	inline public function new (i: Int)
		this = i;

	@:to
	inline public function toInt() :Int
	{
		return this;
	}

	@:from
	inline static public function fromString (s: String)
	{
		return new Port(Std.parseInt(s));
	}
}