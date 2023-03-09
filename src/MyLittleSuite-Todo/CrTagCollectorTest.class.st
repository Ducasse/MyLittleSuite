Class {
	#name : #CrTagCollectorTest,
	#superclass : #TestCase,
	#category : #'MyLittleSuite-Todo-Crono-Tests'
}

{ #category : #tests }
CrTagCollectorTest >> testCalculateTagSegments [
	| collector |
	
	collector := MlTagCollector new.
	collector string: '[this] is a [test]'.
	
	self 
		assert: collector calculateTagSegments
		equals: #((1 6) (13 18)).

	collector string: '\[this\] is a [test]'.
	self 
		assert: collector calculateTagSegments
		equals: #((15 20)).

]

{ #category : #tests }
CrTagCollectorTest >> testCollect [
	| collector |
	
	collector := MlTagCollector new.
	collector string: '[this] is a [test]'.
	
	self 
		assert: collector collect 
		equals: #('this' 'test')
]
