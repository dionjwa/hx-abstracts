package tests;

import t9.abstracts.net.*;

class Net extends haxe.unit.TestCase
{
	public function testNet()
	{
		var ipValues = [192,168,0,1];
		var hostString = ipValues.join('.');
		var portInt = 8000;

		var host = new HostName(hostString);
		assertTrue(host == hostString);
		iAcceptStrings(host);

		var port = new Port(portInt);
		var hostAndPort = new Host(host, port);
		iAcceptStrings(hostAndPort);

		var ip = hostAndPort.ip();
		assertTrue(ip.getDigits()[2] == ipValues[2]);
		// hostAndPort = host;//Compiler failure, which is what we want.

		assertTrue(hostAndPort.toString() == hostString + ':' + portInt);

		var urlString :UrlString = 'http://$hostString:$portInt/some/path';
		assertTrue(urlString.getHost() == '$hostString:$portInt');
		assertTrue(urlString.getHostName() == hostString);
		// iAcceptStringHost(urlString);//Compiler failure, which is what we want.
	}

	static function iAcceptFloats(_ :Float)
	{
		return _;
	}

	static function iAcceptStrings(_ :String)
	{
		return _;
	}

	static function iAcceptStringHost(_ :Host)
	{
		return _;
	}
}