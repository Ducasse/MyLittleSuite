"
I am a virtual list that will answer focused tasks.
"
Class {
	#name : #MlFocusList,
	#superclass : #MlVirtualList,
	#instVars : [
		'tasksCache'
	],
	#category : #'MyLittleSuite-Todo-Crono'
}

{ #category : #visiting }
MlFocusList >> accept: aVisitor [

	^ aVisitor visitFocusList: self
]

{ #category : #accessing }
MlFocusList >> basicTasks [

	^ MlCrTodoTask selectMany: [ :each | each focused = true ]	

]

{ #category : #actions }
MlFocusList >> moveTask: aTask to: aTodoList [

	aTodoList 
		receiveTask: aTask 
		from: aTask owner
]

{ #category : #'notification handling' }
MlFocusList >> noteListChanged: aNotification [
	
	aNotification list type = MlTodoType focus ifFalse: [ ^ self ].
	self resetCache
]

{ #category : #'notification handling' }
MlFocusList >> noteVirtualListTaskChanged: aNotification [
	"do nothing (prevent unnecesary refresh)"
]

{ #category : #initialization }
MlFocusList >> onApplicationStart: anApplication [ 

	self resetCache.
	anApplication notificationCenter 
		subscribeHigh: self
		to: MlListChangedNotification
]

{ #category : #actions }
MlFocusList >> removeTask: aTask follow: follow [ 
	
	super removeTask: aTask follow: follow.
	self resetCache
]

{ #category : #private }
MlFocusList >> resetCache [

	tasksCache := nil
]

{ #category : #actions }
MlFocusList >> saveTask: aTask [

	aTask focus: true.
	super saveTask: aTask
]

{ #category : #accessing }
MlFocusList >> tasks [

	^ tasksCache ifNil: [ tasksCache := self basicTasks ]
]

{ #category : #accessing }
MlFocusList >> type [

	^ MlTodoType focus
]
