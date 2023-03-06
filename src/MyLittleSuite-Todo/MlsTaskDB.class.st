Class {
	#name : #MlsTaskDB,
	#superclass : #Object,
	#instVars : [
		'freshId',
		'tasks'
	],
	#classVars : [
		'UniqueInstance'
	],
	#category : #'MyLittleSuite-Todo-Model'
}

{ #category : #'instance creation' }
MlsTaskDB class >> tasks [ 

	^ self uniqueInstance tasks
]

{ #category : #'instance creation' }
MlsTaskDB class >> uniqueInstance [

	^ UniqueInstance ifNil: [ UniqueInstance := self new ]
]

{ #category : #adding }
MlsTaskDB >> addTask: aTask [
	
	(tasks includes: aTask)
		ifFalse: [ tasks add: aTask ]
]

{ #category : #'task management' }
MlsTaskDB >> deleteTask: aTask [

	tasks remove: aTask ifAbsent: [ nil ]
]

{ #category : #accessing }
MlsTaskDB >> initialize [
	
	super initialize.
	self setTasks: OrderedCollection new
]

{ #category : #accessing }
MlsTaskDB >> setTasks: anOrderedCollection [

	tasks := anOrderedCollection 
]

{ #category : #accessing }
MlsTaskDB >> tasks [

	^ tasks 
]

{ #category : #'access protection' }
MlsTaskDB >> withNewDuring: aBlock [
	"Make sure that we execute aBlock on a new singleton"
	
	| tmp |
	[ tmp := self tasks.
		tasks := OrderedCollection new.
		aBlock value ] ensure: [ tasks := tmp ]
]
