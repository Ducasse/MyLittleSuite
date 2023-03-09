"
the freshid is to prevent that we hack the file and that when we load the file, the in image database loses information that got added since the file was saved. 

Now this is unclear that it is useful in practice. 
"
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

{ #category : #'instance creation' }
MlsTaskDB class >> uniqueInstance: aDB [

	UniqueInstance := aDB
]

{ #category : #'add/remove' }
MlsTaskDB >> addTask: aTask [
	
	(tasks includes: aTask)
		ifFalse: [ tasks add: aTask. self incrementFreshId ]
]

{ #category : #'add/remove' }
MlsTaskDB >> deleteTask: aTask [

	tasks remove: aTask ifAbsent: [ nil ].
	"if we remove something that does not exist we could avoid to increment the freshId"
	self incrementFreshId.
]

{ #category : #accessing }
MlsTaskDB >> freshId [

	^ freshId
]

{ #category : #'add/remove' }
MlsTaskDB >> incrementFreshId [

	freshId := freshId + 1
]

{ #category : #initialization }
MlsTaskDB >> initialize [
	
	super initialize.
	self setTasks: OrderedCollection new.
	freshId := 1
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
