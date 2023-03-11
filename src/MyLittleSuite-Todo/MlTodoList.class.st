"
I represent lists created by the user.
The system lists such as focus, search or archive are subclasses of VirtualList.
"
Class {
	#name : #MlTodoList,
	#superclass : #MlAbstractList,
	#instVars : [
		'type',
		'name',
		'iconName',
		'tasks',
		'archived'
	],
	#classInstVars : [
		'lists'
	],
	#category : #'MyLittleSuite-Todo-Crono'
}

{ #category : #'list accessing' }
MlTodoList class >> activeLists [
	
	^ self allLists reject: [ :each | each isArchived ]
]

{ #category : #'list accessing' }
MlTodoList class >> allLists [
	
	^ self systemLists, self userLists
]

{ #category : #accessing }
MlTodoList class >> allListsOfType: aString [
	
	^ self allLists select: [ :each | each type = aString ]
]

{ #category : #accessing }
MlTodoList class >> archivedLists [

	^ self allLists select: [ :each | each isArchived ]
]

{ #category : #accessing }
MlTodoList class >> baseLists [

	^ self systemLists
]

{ #category : #'system lists' }
MlTodoList class >> focus [

	^ MlFocusList uniqueInstance
]

{ #category : #'system lists' }
MlTodoList class >> inbox [

	^ MlApplication defaultApplication 
		propertyAt: #inbox 
		ifAbsentPut: [ self allListsOfType: MlTodoType inbox typeName ]
]

{ #category : #initialization }
MlTodoList class >> initialize [ 
	
	lists := Dictionary new. 
]

{ #category : #'system lists' }
MlTodoList class >> life [

	^ self allListsOfType: MlTodoType life typeName
]

{ #category : #accessing }
MlTodoList class >> listNamed: aString [
	
	^ self selectOne: [ :each | each name = aString ]
]

{ #category : #accessing }
MlTodoList class >> lists [
	
	^ self allLists reject: [ :each | each isVirtual ]
]

{ #category : #'instance creation' }
MlTodoList class >> newName: aString [

	^ (self newType: MlTodoType user) 
		name: aString;
		yourself
]

{ #category : #'instance creation' }
MlTodoList class >> newType: aListType [

	^ self basicNew
		initializeType: aListType;
		yourself
]

{ #category : #'system lists' }
MlTodoList class >> search [

	^ MlSearchList uniqueInstance
]

{ #category : #accessing }
MlTodoList class >> summaryString [

	^ '{1} pending task{2} ({3} completed).'
]

{ #category : #'list accessing' }
MlTodoList class >> systemLists [

	^ MlApplication defaultApplication  
		propertyAt: #systemLists 
		ifAbsentPut: [ { self inbox . self focus . self unsorted . self life } ]
]

{ #category : #accessing }
MlTodoList class >> trash [

	^ MlArchiveList uniqueInstance
]

{ #category : #'system lists' }
MlTodoList class >> unsorted [

	^ self allLists select: [ :each | each type = MlTodoType unsorted typeName ]
]

{ #category : #accessing }
MlTodoList class >> userLists [
	
	^ self allListsOfType: MlTodoType user typeName
]

{ #category : #visiting }
MlTodoList >> accept: aVisitor [

	^ aVisitor visitTodoList: self
]

{ #category : #accessing }
MlTodoList >> addTask: aTask [

	aTask owner: self.
	tasks add: aTask
]

{ #category : #actions }
MlTodoList >> archive [

	self isArchived ifTrue: [ ^ self ].

	self archived: true.
	self save
]

{ #category : #accessing }
MlTodoList >> archived: aBoolean [

	archived := aBoolean
]

{ #category : #accessing }
MlTodoList >> completion [

	self tasksSize = 0 ifTrue: [ ^ 0 ].  
	^ self doneTasksSize / self tasksSize
]

{ #category : #accessing }
MlTodoList >> iconName [

	^ iconName ifNil: [ super iconName ]
]

{ #category : #accessing }
MlTodoList >> iconName: aSymbol [

	iconName := aSymbol
]

{ #category : #initialization }
MlTodoList >> initialize [

	super initialize.
	archived := false.
	tasks := OrderedCollection new
]

{ #category : #initialization }
MlTodoList >> initializeType: aType [

	self initialize.
	self setType: aType
]

{ #category : #accessing }
MlTodoList >> isArchived [

	^ archived
]

{ #category : #testing }
MlTodoList >> isUser [

	^ self type = MlTodoType user
]

{ #category : #actions }
MlTodoList >> moveTask: aTask to: aTodoList [

	(self includesTask: aTask) ifFalse: [ 
		^ self error: 'Task does not belong to this list' ].
	
	aTodoList receiveTask: aTask from: self
]

{ #category : #accessing }
MlTodoList >> name [

	^ name ifNil: [ self type defaultName ]
]

{ #category : #accessing }
MlTodoList >> name: aString [

	name := aString
]

{ #category : #printing }
MlTodoList >> printOn: stream [

	super printOn: stream.
	stream << '(' << self name << ')'
]

{ #category : #'private actions' }
MlTodoList >> receiveTask: aTask from: aTodoList [

	"self class voyageRepository commit: [" 
		"remove task from previous list"
		aTodoList 
			removeTask: aTask 
			follow: false.
		"add the task as a regular task"
		self saveTask: aTask.
		"ensure task is saved with changes"
		aTask save
		
]

{ #category : #persistence }
MlTodoList >> remove [

	"self class voyageRepository commit: [ "
		self tasks copy do: [ :each | 
			self removeTask: each.
			"each remove" ].
		"super remove"
]

{ #category : #accessing }
MlTodoList >> removeAllTasks [
	
	tasks := Array new
]

{ #category : #accessing }
MlTodoList >> removeTask: aTask [

	aTask owner: nil.
	^ self tasks remove: aTask
]

{ #category : #actions }
MlTodoList >> removeTask: aTask follow: follow [

	(self includesTask: aTask) ifFalse: [ 
		self error: 'Task does not belong to this list.' ].

	"self class voyageRepository commit: ["  
		self removeTask: aTask.
		self save.
		follow ifTrue: [ aTask remove ].
]

{ #category : #persistence }
MlTodoList >> save [
	self flag: #todo.
]

{ #category : #actions }
MlTodoList >> saveTask: aTask [

	self addTask: aTask.
	self save
]

{ #category : #private }
MlTodoList >> setType: aType [

	type := aType
]

{ #category : #accessing }
MlTodoList >> tasks [

	^ tasks
]

{ #category : #accessing }
MlTodoList >> tasks: aCollection [

	tasks := aCollection asOrderedCollection
]

{ #category : #actions }
MlTodoList >> toggleArchive [

	self isArchived 
		ifTrue: [ self unarchive ]
		ifFalse: [ self archive ]
]

{ #category : #accessing }
MlTodoList >> type [

	^ type
]

{ #category : #accessing }
MlTodoList >> type: aListType [

	type := aListType
]

{ #category : #actions }
MlTodoList >> unarchive [

	self isArchived ifFalse: [ ^ self ].
	self archived: false.
	self save
]

{ #category : #writing }
MlTodoList >> writeToFile [

	| reference |
	reference := (self class todoListReference / self name) withExtension: 'ston'.
	reference writeStreamDo: [ :stream | 
		STON put: self onStreamPretty: stream ]
]
