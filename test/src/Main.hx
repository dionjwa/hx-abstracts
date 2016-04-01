import t9.abstracts.time.*;

class Main
{
	static function main()
	{
		var r = new haxe.unit.TestRunner();
		r.add(new tests.Time());
		r.add(new tests.Net());
		r.run();


		// var timeValue = 2000;
		// var ms = new Milliseconds(timeValue);
		// trace('ms=${ms}');
		// // ms += 1000;
		// var s :Seconds = ms;//.toSeconds();
		// trace('s=${s}');
	}
}