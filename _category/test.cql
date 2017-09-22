library test version '0.0.000'

using QDM version '5.3'

include mychild version '0.0.000' called child

context Patient

define "test def":
	child."test def"
