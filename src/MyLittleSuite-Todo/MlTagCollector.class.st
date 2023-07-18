"
I'm a simple parser splitting [kkk] from string as tag kkk.
"
Class {
	#name : #MlTagCollector,
	#superclass : #Object,
	#instVars : [
		'string'
	],
	#category : #'MyLittleSuite-Todo-Crono'
}

{ #category : #'as yet unclassified' }
MlTagCollector class >> collectTagsOn: aString [

	^ self new 
		string: aString;
		collect
]

{ #category : #private }
MlTagCollector >> calculateTagSegments [
	| startIndex previous |

	previous := nil.
	startIndex := nil.
	^ Array streamContents: [ :stream | 
		string withIndexDo: [ :each :index |
			(each = $[ and: [ previous ~= $\ ]) ifTrue: [ startIndex := index ].
			(each = $] and: [ previous ~= $\ and: [ startIndex notNil ] ]) ifTrue: [ 
				stream nextPut: { startIndex. index }.
				startIndex := nil ].
			previous := each ] ]
]

{ #category : #'as yet unclassified' }
MlTagCollector >> collect [ 

	^ self calculateTagSegments collect: [ :aSegment | 
		string 
			copyFrom: aSegment first + 1
			to: aSegment second - 1 ]

]

{ #category : #accessing }
MlTagCollector >> string: aString [
	
	string := aString
]
