"
I am a virtual list. 
I can keep different kind of lists (for example, the focused tasks or archived, but also ""smart lists"").
The correspondent behaviour will be defined in my children.
"
Class {
	#name : #MlVirtualList,
	#superclass : #MlAbstractList,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'MyLittleSuite-Todo-Crono'
}

{ #category : #accessing }
MlVirtualList class >> allLists [

	^ self allSubclasses collect: #uniqueInstance
]

{ #category : #'instance creation' }
MlVirtualList class >> new [

	self error: 'Use #uniqueInstance'
]

{ #category : #'instance creation' }
MlVirtualList class >> uniqueInstance [

	^ uniqueInstance ifNil: [ uniqueInstance := super new ]
]

{ #category : #visiting }
MlVirtualList >> accept: aVisitor [

	^ aVisitor visitVirtualList: self
]

{ #category : #actions }
MlVirtualList >> addAndSaveTask: aTask [ 
	"Adding a task here is in fact adding it to unsorted"
	
	^ self listForAddTask addAndSaveTask: aTask. 
]

{ #category : #testing }
MlVirtualList >> isVirtual [

	^ true
]

{ #category : #accessing }
MlVirtualList >> listForAddTask [
	"We cannot use a virtual list as tasks repository (since they are calculated). 
	 In that case we need to provide one 'default', which will be 'unsorted'"

	^ MlTodoList inbox
]

{ #category : #accessing }
MlVirtualList >> name [

	^ self type name
]

{ #category : #initialization }
MlVirtualList >> onApplicationStart: anApplication [
	"Override this if the virtual list needs some initialization on startup"
]

{ #category : #actions }
MlVirtualList >> removeTask: aTask follow: follow [ 
	
	aTask owner
		removeTask: aTask 
		follow: follow.
]
