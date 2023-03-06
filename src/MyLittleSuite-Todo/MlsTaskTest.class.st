Class {
	#name : #MlsTaskTest,
	#superclass : #TestCase,
	#category : #'MyLittleSuite-Todo-Model'
}

{ #category : #tests }
MlsTaskTest >> taskManager [

	^ MlsTask
]

{ #category : #tests }
MlsTaskTest >> testAddTaskIsInTheList [

	self taskManager withNewDuring: [ 
		self taskManager addTask: (self taskManager new title: 'first'; done: false; yourself).
	 	self assert: self taskManager tasks first title equals: 'first'
		]
]

{ #category : #tests }
MlsTaskTest >> testTasksContainsDone [

	self taskManager withNewDuring: [ 
		self taskManager addTask: (self taskManager new title: 'first'; done: false; yourself).
		self taskManager addTask: (self taskManager new title: 'second'; done: true; yourself).
		self taskManager addTask: (self taskManager new title: 'third'; done: false; yourself).
	 	self assert: self taskManager tasks first title equals: 'first'.
		self assert: (self taskManager tasks select: [ :t | t done ]) size equals: 1
		]
]
