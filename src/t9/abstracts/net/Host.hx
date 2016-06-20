package t9.abstracts.net;

/**
 * Host and port
 */
abstract Host(String)
{
	inline public function new (h :HostName, ?p :Null<Port>)
		this = h + (p != null ? ':' + p : '');

	@:to
	inline public function toString() :String
	{
		return this;
	}

	@:from
	inline public static function fromString(s :String) :Host
	{
		var tokens = s.split(':');
		if (tokens.length > 2) {
			throw 'Not a valid <host>[:port]';
		}
		return new Host(new HostName(tokens[0]), tokens.length == 2 ? tokens[1] : null);
	}

	inline public function getHostname() :HostName
	{
		if (this.split(':').length == 2) {
			return new HostName(this.split(':')[0]);
		} else {
			return new HostName(this);
		}
	}

	inline public function ip() :IP
	{
		return new IP(getHostname());
	}

	inline public function port() :Null<Port>
	{
		if (this.split(':').length == 2) {
			return Port.fromString(this.split(':')[1]);
		} else {
			return null;
		}
	}
}

