"
I am a base for lists.
My childrne define whether this is a real list or a virtual, but in any case I have always a type, a name and a lists of tasks.
"
Class {
	#name : #MlAbstractList,
	#superclass : #Object,
	#category : #'MyLittleSuite-Todo-Crono'
}

{ #category : #visiting }
MlAbstractList >> accept: aVisitor [

	^ aVisitor visitGenericList: self
]

{ #category : #actions }
MlAbstractList >> archiveCompletedTasks [

	self tasks do: [ :each | each archiveIfDone ]
]

{ #category : #actions }
MlAbstractList >> archiveCompletedTasksAfterDays: daysNumber [

	self tasks do: [ :each | each archiveIfDoneAfterDays: daysNumber ]
]

{ #category : #accessing }
MlAbstractList >> doneTasks [

	^ self tasks select: #isDone
]

{ #category : #accessing }
MlAbstractList >> doneTasksSize [

	^ self doneTasks size
]

{ #category : #accessing }
MlAbstractList >> iconName [

	^ self type defaultIconName
]

{ #category : #accessing }
MlAbstractList >> iconOn: anApplication [

	^ self iconName ifNotNil: [ 
		anApplication iconNamed: self iconName ]
]

{ #category : #testing }
MlAbstractList >> includesTask: aTask [

	^ self tasks includes: aTask
]

{ #category : #testing }
MlAbstractList >> isArchived [

	^ false
]

{ #category : #testing }
MlAbstractList >> isEditable [

	^ self type isEditable
]

{ #category : #testing }
MlAbstractList >> isUser [

	^ false
]

{ #category : #testing }
MlAbstractList >> isVirtual [

	^ false
]

{ #category : #testing }
MlAbstractList >> isVisible [
	
	^ self type isVisible
]

{ #category : #accessing }
MlAbstractList >> name [

	^ self subclassResponsibility
]

{ #category : #accessing }
MlAbstractList >> pendingTasks [

	^ self tasks reject: #isDone
]

{ #category : #accessing }
MlAbstractList >> pendingTasksSize [

	^ self pendingTasks size
]

{ #category : #actions }
MlAbstractList >> saveTask: aTask [ 

	self subclassResponsibility
]

{ #category : #testing }
MlAbstractList >> showsCompletion [

	^ self type showsCompletion
]

{ #category : #testing }
MlAbstractList >> showsFocus [

	^ self type showsFocus
]

{ #category : #testing }
MlAbstractList >> showsPendingSize [

	^ self type showsPendingSize
]

{ #category : #accessing }
MlAbstractList >> summaryString [
	| tasks tasksSize doneTasksSize pendingTasksSize |
	
	tasks := self tasks.
	
	tasksSize := tasks size.
	tasksSize = 0 ifTrue: [ ^ 'No tasks.' ].
	
	doneTasksSize := (tasks select: [ :each | each isDone ]) size.
	doneTasksSize = tasksSize ifTrue: [ ^ 'No pending tasks.' ]. 
	
	pendingTasksSize := tasksSize - doneTasksSize.
	
	^ String streamContents: [ :stream |
		stream << ('{1} pending task{2}' format: { 
			pendingTasksSize. 
			pendingTasksSize > 1 ifTrue: [ 's' ] ifFalse: [ '' ] }).
		(self showsCompletion and: [ doneTasksSize > 0]) ifTrue: [ 
			stream << ', '.
			stream << ('{1} completed' format: { doneTasksSize }) ].
		stream << '.' ]
]

{ #category : #accessing }
MlAbstractList >> tasks [

	^ self subclassResponsibility
]

{ #category : #accessing }
MlAbstractList >> tasksSize [

	^ self tasks size
]

{ #category : #accessing }
MlAbstractList >> type [

	^ self subclassResponsibility
]
