# Provide easy access to QueryString data

class QueryString
	# `input` defaults to the document's querystring, e.g. `"?key=value&v=0"`,
	# stripping off the initial "?"
	constructor: (input = window.document.location.search) ->
		input = input.substr 1 if input.charAt(0) is "?"
		@params = input.split '&'
		@vars = {}
		for pair in @params
			[key, value] = pair.split '='
			if key isnt ''
				@vars[decode key] = decode value
	
	##### Methods

	# Set a key to a specific value
	# Will override an existing key of that name
	setKey: (name, value) ->
		@vars[name] = value
	
	# Get the value of a key
	getKey: (name) ->
		@vars[name]
	
	# Remove a specific key
	removeKey: (name) ->
		delete @vars[name]
	
	# Return the encoded string, complete with the "?" at the beginning
	toString: ->
		output = []
		for key, value of @vars
			output.push "#{encode key}=#{encode value}"
		"#{(if output.length > 0 then '?' else '')}#{output.join("&")}"

# Add shortcuts to the encoders
decode = window.decodeURIComponent
encode = window.encodeURIComponent

# Export `QueryString` object to `window` for use in pages' JS.
window.QueryString = QueryString
