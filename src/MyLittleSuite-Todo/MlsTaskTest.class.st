Class {
	#name : #MlsTaskTest,
	#superclass : #TestCase,
	#category : #'MyLittleSuite-Todo-Model'
}

{ #category : #tests }
MlsTaskTest >> taskClass [

	^ MlsTask
]

{ #category : #tests }
MlsTaskTest >> taskManager [

	^ MlsTaskDB uniqueInstance
]

{ #category : #tests }
MlsTaskTest >> testAddTaskIsInTheList [

	self taskManager withNewDuring: [ 
		self taskManager addTask: (self taskClass new title: 'first'; done: false; yourself).
	 	self assert: self taskManager tasks first title equals: 'first'
		]
]

{ #category : #tests }
MlsTaskTest >> testRemoveTaskIsNotInTheListAnymore [

	self taskManager withNewDuring: [ 
		| toBeRemoved |
		toBeRemoved := (self taskClass new title: 'third'; done: false; yourself).
		self taskManager addTask: (self taskClass new title: 'first'; done: false; yourself).
		self taskManager addTask: (self taskClass new title: 'second'; done: false; yourself).
		self taskManager addTask: toBeRemoved.
		self taskManager deleteTask: toBeRemoved.
	 	self assert: self taskManager tasks size equals: 2
		]
]

{ #category : #tests }
MlsTaskTest >> testSetDoneDateWhenDoneIsSet [
	
	| t |
	t := self taskClass new title: 'first'; done: false; yourself.
	self assert: t doneDate isNil.
	t done: true.
	self assert: t doneDate class equals: Date
]

{ #category : #tests }
MlsTaskTest >> testTasksContainsDone [

	self taskManager withNewDuring: [ 
		self taskManager addTask: (self taskClass new title: 'first'; done: false; yourself).
		self taskManager addTask: (self taskClass new title: 'second'; done: true; yourself).
		self taskManager addTask: (self taskClass new title: 'third'; done: false; yourself).
	 	self assert: self taskManager tasks first title equals: 'first'.
		self assert: (self taskManager tasks select: [ :t | t done ]) size equals: 1
		]
]

{ #category : #tests }
MlsTaskTest >> testWithNewDuringStartWithAnEmptyTaskList [

	self taskManager withNewDuring: [  MlsTaskDB tasks isEmpty ]
]
