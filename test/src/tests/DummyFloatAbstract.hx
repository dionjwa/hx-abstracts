package tests;

abstract DummyFloatAbstract(Float) to Float from Float
{
	inline public function new(m:Float) this = m;
}
