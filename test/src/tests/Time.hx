package tests;

import t9.abstracts.time.*;

class Time extends haxe.unit.TestCase
{
	public function testTime()
	{
		var foo :DummyFloatAbstract = 2000.0;

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

	public function testTime2()
	{
		var nowFloat = Date.now().getTime();
		var now = new Milliseconds(nowFloat);
		var ts = new TimeStamp(now);
		assertEquals(ts.toString(), Date.fromTime(now.toFloat()).toString());
		assertEquals(ts.toFloat(), nowFloat);

		var ms1 = new Milliseconds(20);
		var ms2 = new Milliseconds(5);
		var ms3 = ms1 - ms2;
		assertEquals(ms3.toFloat(), 15.0);

		var seconds = new Seconds(10);
		var ms = seconds.toMilliseconds().toFloat();
		var timePlus :TimeStamp = ts.addSeconds(seconds);
		var floatTimePlus = nowFloat + ms;
		var timePlusFloat :Float = timePlus.toFloat();
		assertEquals(timePlusFloat, floatTimePlus);
	}

	static function iAcceptFloats(_ :Float)
	{
		return _;
	}
}