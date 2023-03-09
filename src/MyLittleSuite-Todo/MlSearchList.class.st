"
I am a virtual list that will answer current searched tasks.
"
Class {
	#name : #MlSearchList,
	#superclass : #MlVirtualList,
	#instVars : [
		'searchText',
		'tasks'
	],
	#category : #'MyLittleSuite-Todo-Crono'
}

{ #category : #visiting }
MlSearchList >> accept: aVisitor [

	^ aVisitor visitSearchList: self
]

{ #category : #testing }
MlSearchList >> hasElements [

	^ self tasks isEmptyOrNil not
]

{ #category : #initialization }
MlSearchList >> initialize [

	super initialize.
	tasks := #()
]

{ #category : #private }
MlSearchList >> refresh [

	tasks := self searchText
		ifNotEmpty: [ :text | MlCrTodoTask findTasksMatching: '.*', text, '.*' ]
		ifEmpty: [ #() ]
]

{ #category : #accessing }
MlSearchList >> searchText [
	^ searchText
]

{ #category : #accessing }
MlSearchList >> searchText: aString [

	searchText = aString ifTrue: [ ^ self ].
	searchText := aString.
	self refresh
]

{ #category : #accessing }
MlSearchList >> tasks [

	^ tasks
]

{ #category : #accessing }
MlSearchList >> type [

	^ MlTodoTypeSearch uniqueInstance
]
