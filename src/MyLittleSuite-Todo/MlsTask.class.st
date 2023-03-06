Class {
	#name : #MlsTask,
	#superclass : #Object,
	#instVars : [
		'done',
		'title',
		'description',
		'doneDate',
		'dueDate'
	],
	#classVars : [
		'UndeterminedDate'
	],
	#classInstVars : [
		'tasks'
	],
	#category : #'MyLittleSuite-Todo-Model'
}

{ #category : #'task management' }
MlsTask class >> addTask: aTask [
	
	(tasks includes: aTask)
		ifFalse: [ tasks add: aTask ]
]

{ #category : #'task management' }
MlsTask class >> deleteTask: aTask [

	tasks remove: aTask ifAbsent: [ nil ]
]

{ #category : #'task management' }
MlsTask class >> tasks [ 

	^ tasks ifNil: [ tasks := OrderedCollection new]
]

{ #category : #'access protection' }
MlsTask class >> withNewDuring: aBlock [
	"Make sure that we execute aBlock on a new singleton"
	
	| tmp |
	[ tmp := self tasks.
	tasks := OrderedCollection new.
	aBlock value ] ensure: [ tasks := tmp ]
]

{ #category : #saving }
MlsTask >> db [ 

	^ MlsTaskDB uniqueInstance
]

{ #category : #saving }
MlsTask >> delete [

	self db deleteTask: self
]

{ #category : #accessing }
MlsTask >> description [

	^ description
]

{ #category : #accessing }
MlsTask >> description: anObject [

	description := anObject
]

{ #category : #accessing }
MlsTask >> done [

	^ done
]

{ #category : #accessing }
MlsTask >> done: anObject [

	done := anObject
]

{ #category : #accessing }
MlsTask >> doneDate [

	^ doneDate
]

{ #category : #accessing }
MlsTask >> doneDate: anObject [

	doneDate := anObject
]

{ #category : #accessing }
MlsTask >> dueDate [

	^ dueDate
]

{ #category : #accessing }
MlsTask >> dueDate: anObject [

	dueDate := anObject
]

{ #category : #initialization }
MlsTask >> initialize [

	super initialize.
	self done: false.
	self title: 'Please give me a title'
]

{ #category : #testing }
MlsTask >> isDone [

	^ self done
]

{ #category : #printing }
MlsTask >> printOn: aStream [

	super printOn: aStream.
	aStream space nextPutAll: self title.
	done ifTrue: [ aStream space nextPutAll: 'done' ]
]

{ #category : #saving }
MlsTask >> save [

	self db addTask: self
]

{ #category : #accessing }
MlsTask >> title [

	^ title
]

{ #category : #accessing }
MlsTask >> title: anObject [

	title := anObject
]
