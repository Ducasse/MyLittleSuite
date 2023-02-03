Class {
	#name : #MLSTodoTaskTest,
	#superclass : #TestCase,
	#category : #'MyLittleSuite-Todo'
}

{ #category : #tests }
MLSTodoTaskTest >> taskManager [

	^ MLSTodoTask
]

{ #category : #tests }
MLSTodoTaskTest >> testAddTaskIsInTheList [

	self taskManager withNewDuring: [ 
		self taskManager addTask: (self taskManager new title: 'first'; done: false; yourself).
	 	self assert: self taskManager tasks first title equals: 'first'. 	
		]
]

{ #category : #tests }
MLSTodoTaskTest >> testTasksContainsDone [

	self taskManager withNewDuring: [ 
		self taskManager addTask: (self taskManager new title: 'first'; done: false; yourself).
		self taskManager addTask: (self taskManager new title: 'second'; done: true; yourself).
		self taskManager addTask: (self taskManager new title: 'third'; done: false; yourself).
	 	self assert: self taskManager tasks first title equals: 'first'. 
		self assert: (self taskManager tasks select: [ :t | t done ]) size equals: 1
		]
]
