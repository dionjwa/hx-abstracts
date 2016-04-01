package t9.abstracts.net;

abstract IP(String)
{
	inline public function new (s: String)
	{
		validate(s);
		this = s;
	}

	@:to
	inline public function toString() :String
	{
		return this;
	}

	inline public function getDigits() :Array<Int>
	{
		return this.split('.').map(Std.parseInt);
	}

	inline public static function validate(s: String)
	{
		if (s.split('.').length != 4) {
			throw 'Invalid IP address $s';
		}
	}

	@:from
	inline static public function fromString(s: String)
	{
		validate(s);
		return new IP(s);
	}

	@:to
	inline public function toHostName() :HostName
	{
		return new HostName(this);
	}
}