describe("QueryString", function() {
	it("can take an existing string as input", () => {
		const qs = new QueryString("someKey=value");
		expect(qs).toBeDefined();
		expect(qs.toString()).toEqual("?someKey=value");
	});
	
	it("will strip the '?' character if its the first", function() {
		expect(new QueryString("?myVariable=MyValue").toString()).toEqual("?myVariable=MyValue");
	});
	
	it("can get the value for a key", function() {
		const qs = new QueryString("?Key1=YES&Key2=NO&Key3=");
		expect(qs.getKey("Key1")).toEqual("YES");
		expect(qs.getKey("Key2")).toEqual("NO");
	});
	
	it("can set a value for a key", function() {
		const qs = new QueryString('');
		qs.setKey("keyname", "value");
		expect(qs.toString()).toEqual("?keyname=value");
	});
	
	it("can remove a key", () => {
		const qs = new QueryString("?a=1&b=2&c=3");
		qs.removeKey("b");
		expect(qs.toString()).toEqual("?a=1&c=3");
	});
	
});
