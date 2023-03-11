"
I am a task in a todo list.
A task has different properties: title, description, start date and last modification date.
It has also a done (completion) date and a status (completed or not).
"
Class {
	#name : #MlCrTodoTask,
	#superclass : #Object,
	#instVars : [
		'owner',
		'name',
		'notes',
		'startDate',
		'doneDate',
		'tags',
		'focused',
		'archived'
	],
	#category : #'MyLittleSuite-Todo-Crono'
}

{ #category : #accessing }
MlCrTodoTask class >> findTasksDoneBetween: start and: end [
	| startTS endTS | 

	startTS := start asZTimestamp printString.
	endTS := end asZTimestamp printString.
	^ self selectMany: [ :each | (each doneDate >= startTS) & (each doneDate <= endTS) ]
]

{ #category : #'ston-core' }
MlCrTodoTask class >> stonName [

	^ 'Task'
]

{ #category : #persistence }
MlCrTodoTask class >> voyageCollectionName [

	^ 'tasks'
]

{ #category : #persistence }
MlCrTodoTask class >> voyageDoneDate [
	<voyageDescription>
	
	^ VOToOneDescription new 
		attributeName: 'doneDate';
		accessor: (MAPluggableAccessor 
			read: [ :aTask | aTask doneDate ifNotNil: #asString ]
			write: [ :aTask :date | 
				date ifNotNil: [ aTask setDoneDate: (ZTimestamp fromString: date) ] ]);
		yourself
]

{ #category : #persistence }
MlCrTodoTask class >> voyageRepository [

	^ MlModelApplication current repository
]

{ #category : #persistence }
MlCrTodoTask class >> voyageStartDate [
	<voyageDescription>
	
	^ VOToOneDescription new 
		attributeName: 'startDate';
		accessor: (MAPluggableAccessor 
			read: [ :aTask | aTask startDate ifNotNil: #asString ]
			write: [ :aTask :date | 
				date ifNotNil: [ aTask setStartDate: (ZTimestamp fromString: date) ] ]);
		yourself
]

{ #category : #persistence }
MlCrTodoTask class >> voyageTags [
	<voyageDescription>
	
	^ VOToManyDescription new 
		attributeName: 'tags';
		kindCollection: Array;
		yourself
]

{ #category : #actions }
MlCrTodoTask >> archive [

	self isArchived ifTrue: [ ^ self ].
	self archived: true.
	self focus: false.
	self save
]

{ #category : #actions }
MlCrTodoTask >> archiveIfDone [

	self archiveIfDoneAfterDays: 0
	
]

{ #category : #actions }
MlCrTodoTask >> archiveIfDoneAfterDays: daysNumber [

	self isArchived ifTrue: [ ^ self ].
	self isDone ifFalse: [ ^ self ].
	(self doneDate < (Time now - daysNumber days)) ifFalse: [ ^ self ].
	
	self archived: true.
	self focus: false.
	self save
]

{ #category : #accessing }
MlCrTodoTask >> archived: aBoolean [

	archived := aBoolean
]

{ #category : #actions }
MlCrTodoTask >> changeFocusTo: aBoolean [

	self focus: aBoolean.
	self save
]

{ #category : #actions }
MlCrTodoTask >> changeStatusTo: aBoolean [

	self done: aBoolean.
	self save
]

{ #category : #private }
MlCrTodoTask >> collectTagsOn: aString [

	^ #()
]

{ #category : #accessing }
MlCrTodoTask >> done: aBoolean [

	doneDate := aBoolean 
		ifTrue: [ Time now ]
		ifFalse: [ nil ]
]

{ #category : #accessing }
MlCrTodoTask >> doneDate [
	^ doneDate
]

{ #category : #accessing }
MlCrTodoTask >> focus: aBoolean [

	focused := aBoolean
]

{ #category : #accessing }
MlCrTodoTask >> fullName [

	^ String streamContents: [ :stream |
		stream << '[' << self owner name << '] ' << self name ]
]

{ #category : #testing }
MlCrTodoTask >> hasNotes [

	^ self notes isEmptyOrNil not
]

{ #category : #initialization }
MlCrTodoTask >> initialize [

	super initialize. 
	startDate := Time now.
	focused := false.
	archived := false
]

{ #category : #testing }
MlCrTodoTask >> isArchived [

	^ archived or: [ self owner isArchived ]
]

{ #category : #testing }
MlCrTodoTask >> isDone [

	^ doneDate notNil
]

{ #category : #accessing }
MlCrTodoTask >> isFocused [

	^ focused
]

{ #category : #testing }
MlCrTodoTask >> isVisible [

	^ self isArchived not 
		and: [ self isDone not or: [ self isStillShown: self doneDate ] ]
]

{ #category : #accessing }
MlCrTodoTask >> listName [

	^ self owner name
]

{ #category : #accessing }
MlCrTodoTask >> name [
	^ name
]

{ #category : #accessing }
MlCrTodoTask >> name: aString [

	name := aString
]

{ #category : #accessing }
MlCrTodoTask >> notes [
	^ notes
]

{ #category : #accessing }
MlCrTodoTask >> notes: aString [

	notes := aString
]

{ #category : #accessing }
MlCrTodoTask >> owner [
	
	^ owner
]

{ #category : #accessing }
MlCrTodoTask >> owner: aTodoList [

	owner := aTodoList
]

{ #category : #printing }
MlCrTodoTask >> printChangeLogLines: aString on: stream [

	(aString withNoLineLongerThan: 96) lines 
		do: [ :each | stream << '    ' << each ]
		separatedBy: [ stream newLine ].

]

{ #category : #printing }
MlCrTodoTask >> printChangeLogOn: stream [ 
	
	self printChangeLogLines: ('* ', self fullName) on: stream.
	self notes isEmptyOrNil ifFalse: [  
		stream newLine.
		self printChangeLogLines: self notes on: stream ].
	self hasPomodoroTasks ifTrue: [ 
		stream newLine.
		self printChangeLogPomodorosOn: stream ].
]

{ #category : #printing }
MlCrTodoTask >> printChangeLogPomodorosOn: stream [
	| size |
	
	size := self pomodoroTasks size.
	stream << '    ' << ('{1} pomodoro{2}.' format: { 
	 	size. 
		size > 1 ifTrue: [ 's' ] ifFalse: [ '' ]})
]

{ #category : #printing }
MlCrTodoTask >> printCronoTimeLines: aString time: aBoolean on: stream [
	| time separator |
	
	separator := String new: 6 withAll: Character space.
	time :=  (aBoolean and: [ self doneDate notNil ]) 
		ifTrue: [ self doneDate asTime printString, ' ' ]
		ifFalse: [ separator ].	
			
	(aString withNoLineLongerThan: 94) lines 
		do: [ :each | 
			stream << time << each.
			time := separator ]
		separatedBy: [ 
			stream newLine ]
]

{ #category : #printing }
MlCrTodoTask >> printCronoTimeLogOn: stream [ 

	self printCronoTimeLines: self fullName time: true on: stream.
	self notes isEmptyOrNil ifTrue: [ ^ self ].  

	stream newLine.
	self printCronoTimeLines: self notes time: false on: stream
]

{ #category : #printing }
MlCrTodoTask >> printOn: stream [

	super printOn: stream.
	stream << '(' << self name << ')'
]

{ #category : #persistence }
MlCrTodoTask >> save [ 

	self updateTags.
	self flag: #save
]

{ #category : #private }
MlCrTodoTask >> setDoneDate: aDateAndTime [
	
	doneDate := aDateAndTime
]

{ #category : #private }
MlCrTodoTask >> setStartDate: aDateAndTime [
	
	startDate := aDateAndTime
]

{ #category : #accessing }
MlCrTodoTask >> shortName [

	"maybe truncateWithElipsisTo: ?"
	^ self name contractTo: 20
]

{ #category : #accessing }
MlCrTodoTask >> startDate [

	^ startDate
]

{ #category : #accessing }
MlCrTodoTask >> takeMemento [

	^ self class allSlots 
		collect: [ :each | (self readSlot: each) copy ]
		as: Array
]

{ #category : #actions }
MlCrTodoTask >> toggleArchive [

	self isArchived 
		ifTrue: [ self unarchive ]
		ifFalse: [ self archive ]
]

{ #category : #actions }
MlCrTodoTask >> toggleFocus [
	
	self changeFocusTo: self isFocused not
]

{ #category : #actions }
MlCrTodoTask >> unarchive [

	self isArchived ifFalse: [ ^ self ].
	self archived: false.
	self save
]

{ #category : #private }
MlCrTodoTask >> updateTags [
	
	tags := ((self collectTagsOn: self name), (self collectTagsOn: self notes)) asSet asArray
]
