Class {
	#name : #MLSTodoTask,
	#superclass : #Object,
	#instVars : [
		'done',
		'title',
		'description',
		'doneDate',
		'dueDate'
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
MLSTodoTask >> description [

	^ description
]

{ #category : #accessing }
MLSTodoTask >> description: anObject [

	description := anObject
]

{ #category : #accessing }
MLSTodoTask >> done [

	^ done
]

{ #category : #accessing }
MLSTodoTask >> done: anObject [

	done := anObject
]

{ #category : #accessing }
MLSTodoTask >> doneDate [

	^ doneDate
]

{ #category : #accessing }
MLSTodoTask >> doneDate: anObject [

	doneDate := anObject
]

{ #category : #accessing }
MLSTodoTask >> dueDate [

	^ dueDate
]

{ #category : #accessing }
MLSTodoTask >> dueDate: anObject [

	dueDate := anObject
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
	done ifTrue: [ aStream space nextPutAll: 'done' ]
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
