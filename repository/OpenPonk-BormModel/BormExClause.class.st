"
I am an inner node in a BORM boolean expression tree. I hold a logical operator (`All`, `Any`, `One`) and group multiple child expressions (variables or other clauses).
"
Class {
	#name : 'BormExClause',
	#superclass : 'BormExBooleanExpression',
	#instVars : [
		'operator'
	],
	#category : 'OpenPonk-BormModel-Conditions',
	#package : 'OpenPonk-BormModel',
	#tag : 'Conditions'
}
