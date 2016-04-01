package tests;

import t9.abstracts.time.*;

class Time extends haxe.unit.TestCase
{
	public function testTime()
	{
		var foo :DummyFloatAbstract = 2000.0;
		// var bar :Milliseconds = foo;


		var timeValue = 2000.0;
		var ms = new Milliseconds(timeValue);
		var msFloatValue :Float = ms;
		iAcceptFloats(ms);
		ms += 1000;
		var s :Seconds = ms;
		assertTrue(ms == s.toMilliseconds());
		assertTrue((ms + 1000) == (s + 1).toMilliseconds());
		assertTrue(s == s.toMinutes().toSeconds());

		var currentTime = 1454711242672;
		var timestampThen = new TimeStamp(new Milliseconds(currentTime));
		var delta = 54321.0;
		var timestampNow = new TimeStamp(new Milliseconds(currentTime + 54321));
		var deltaMs = timestampNow - timestampThen;
		assertEquals(delta, deltaMs.toFloat());

		var deltaMinutes = (timestampNow - timestampThen).toMinutes();
		assertEquals(deltaMinutes.toFloat(), delta / 1000 / 60);

		assertEquals((new Minutes(10) % new Minutes(3)).toFloat(), 1.0);
	}

	static function iAcceptFloats(_ :Float)
	{
		return _;
	}
}