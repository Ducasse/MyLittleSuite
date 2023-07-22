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

	self taskManager withEmptyTasksDuring: [ 
		self taskManager addTask: (self taskClass new title: 'first'; done: false; yourself).
	 	self assert: self taskManager tasks first title equals: 'first'.
		self assert: self taskManager isDirty
		]
]

{ #category : #'test - dirty' }
MlsTaskTest >> testChangeDescriptionDirtyTheTask [

	self taskManager withNewTaskDBDuring: [ 
		| task |
		task := (self taskClass new title: 'task'; done: false; yourself).
		self taskManager addTask: task.
	 	self assert: self taskManager isDirty.
		self taskManager clean.
		self deny:  self taskManager isDirty.
		task description: 'changed'.
		self assert: self taskManager isDirty.
		]
]

{ #category : #'test - dirty' }
MlsTaskTest >> testChangeDoneDirtyTheTask [

	self taskManager withNewTaskDBDuring: [ 
		| task |
		task := (self taskClass new title: 'task'; done: false; yourself).
		self taskManager addTask: task.
	 	self assert: self taskManager isDirty.
		self taskManager clean.
		self deny:  self taskManager isDirty.
		task done: true.
		self assert: self taskManager isDirty.
		]
]

{ #category : #'test - dirty' }
MlsTaskTest >> testInitializeDirtyIsFalse [

	self taskManager withNewTaskDBDuring: [ 
		self deny: self taskManager isDirty
		]
	
]

{ #category : #tests }
MlsTaskTest >> testRemoveTaskIsNotInTheListAnymore [

	self taskManager withNewTaskDBDuring: [ 
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

	self taskManager withEmptyTasksDuring: [ 
		self taskManager addTask: (self taskClass new title: 'first'; done: false; yourself).
		self taskManager addTask: (self taskClass new title: 'second'; done: true; yourself).
		self taskManager addTask: (self taskClass new title: 'third'; done: false; yourself).
	 	self assert: self taskManager tasks first title equals: 'first'.
		self assert: (self taskManager tasks select: [ :t | t done ]) size equals: 1
		]
]

{ #category : #tests }
MlsTaskTest >> testWithNewDuringStartWithAnEmptyTaskList [

	self taskManager withEmptyTasksDuring: [  MlsTaskDB tasks isEmpty ]
]
