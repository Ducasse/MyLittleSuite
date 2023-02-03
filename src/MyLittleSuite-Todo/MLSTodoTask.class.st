Class {
	#name : #MLSTodoTask,
	#superclass : #Object,
	#instVars : [
		'done',
		'title'
	],
	#classInstVars : [
		'tasks'
	],
	#category : #'MyLittleSuite-Todo'
}

{ #category : #'task management' }
MLSTodoTask class >> addTask: aTask [
	
	(tasks includes: aTask)
		ifFalse: [ tasks add: aTask ]
]

{ #category : #'task management' }
MLSTodoTask class >> deleteTask: aTask [

	tasks remove: aTask ifAbsent: [ nil ]
]

{ #category : #'task management' }
MLSTodoTask class >> tasks [ 

	^ tasks ifNil: [ tasks := OrderedCollection new]
]

{ #category : #'access protection' }
MLSTodoTask class >> withNewDuring: aBlock [
	"Make sure that we execute aBlock on a new singleton"
	
	| tmp |
	[ tmp := self tasks.
	tasks := OrderedCollection new.
	aBlock value ] ensure: [ tasks := tmp ]
]

{ #category : #saving }
MLSTodoTask >> delete [

	self class deleteTask: self
]

{ #category : #accessing }
MLSTodoTask >> done [

	^ done
]

{ #category : #accessing }
MLSTodoTask >> done: anObject [

	done := anObject
]

{ #category : #initialization }
MLSTodoTask >> initialize [

	super initialize.
	self done: false.
	self title: 'Please give me a title'
]

{ #category : #testing }
MLSTodoTask >> isDone [

	^ self done
]

{ #category : #printing }
MLSTodoTask >> printOn: aStream [
	super printOn: aStream.
	aStream space nextPutAll: self title.
]

{ #category : #saving }
MLSTodoTask >> save [

	self class addTask: self
]

{ #category : #accessing }
MLSTodoTask >> title [

	^ title
]

{ #category : #accessing }
MLSTodoTask >> title: anObject [

	title := anObject
]
