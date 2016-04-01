package t9.abstracts.net;

using StringTools;

abstract UrlString(String)
{
	inline public function new (s: String)
		this = s;

	@:to
	inline public function toString() :String
	{
		return this;
	}

	@:from
	inline public static function fromString(s :String) :UrlString
	{
		return new UrlString(s);
	}

	inline public function getHost() :Host
	{
#if nodejs
		return new Host(return js.npm.Url.parse(this, true));
#else
		var s :String = stripProtocol(this).split('/')[0];
		var host :Host = s;
		return host;
		// return new Host(new HostName(s));
#end
	}

	inline public function getHostName() :HostName
	{
		return getHost().getHostname();
	}

	inline public static function stripProtocol(s :String) :String
	{
		return s.replace('http://', '').replace('https://', '').replace('ws://', '').replace('wss://', '');
	}
}