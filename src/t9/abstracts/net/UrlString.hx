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

	public function getHost() :Host
	{
#if nodejs
		var urlObj = js.node.Url.parse(this, true);
		var hostName = new HostName(urlObj.hostname);
		var port = urlObj.port != null ? Port.fromString(urlObj.port) : null;
		return new Host(hostName, port);
#else
		return Host.fromString(stripProtocol(this).split('/')[0]);
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