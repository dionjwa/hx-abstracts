package t9.abstracts.net;

using StringTools;

abstract HostName(String) to String
{
	inline public function new (s: String)
	{
		if (s.startsWith('http:') || s.startsWith('https:') || s.startsWith('ws:') || s.startsWith('wss:')) {
			throw 'HostName does not include the protocol';
		}
		this = s;
	}
}