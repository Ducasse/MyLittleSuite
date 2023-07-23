"
the freshid is to prevent that we hack the file and that when we load the file, the in image database loses information that got added since the file was saved. 

Now this is unclear that it is useful in practice. 
"
Class {
	#name : #MlsTaskDB,
	#superclass : #Object,
	#instVars : [
		'freshId',
		'tasks',
		'isDirty'
	],
	#classVars : [
		'UniqueInstance'
	],
	#category : #'MyLittleSuite-Todo-Model'
}

{ #category : #initialization }
MlsTaskDB class >> reset [ 
	<script>
	UniqueInstance := nil
]

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
		ifFalse: [ tasks add: aTask. self dirty ]
]

{ #category : #dirty }
MlsTaskDB >> clean [

	isDirty := false
]

{ #category : #'add/remove' }
MlsTaskDB >> deleteTask: aTask [

	tasks remove: aTask ifAbsent: [ nil ].
	"if we remove something that does not exist we could avoid to increment the freshId"
	self dirty
]

{ #category : #dirty }
MlsTaskDB >> dirty [ 

	isDirty := true
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
	freshId := 1.
	isDirty := false
]

{ #category : #dirty }
MlsTaskDB >> isDirty [ 

	^ isDirty
]

{ #category : #accessing }
MlsTaskDB >> setTasks: anOrderedCollection [
	"when we define a collection of tasks we consider that the base is then clean."
	
	tasks := anOrderedCollection.
	self clean.
]

{ #category : #accessing }
MlsTaskDB >> tasks [

	^ tasks 
]

{ #category : #'access protection' }
MlsTaskDB >> withEmptyTasksDuring: aBlock [
	"Make sure that we execute aBlock on empty tasks"
	
	| tmp |
	[ tmp := self tasks.
		tasks := OrderedCollection new.
		aBlock value ] ensure: [ tasks := tmp ]
]

{ #category : #'access protection' }
MlsTaskDB >> withNewTaskDBDuring: aBlock [
	"Make sure that we execute aBlock on a new singleton"
	
	| tmp |
	[ tmp := self.
	UniqueInstance := self class new.
	aBlock value ] ensure: [ UniqueInstance := tmp ]
]
