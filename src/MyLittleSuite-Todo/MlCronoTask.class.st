"
I am a ""crono task"": a task that is independent of a todo list.
It happens often that you work on a task you forgot to add to the list (or simply you do not consider it worth of being there), but you still want to register that activity. 
Well, I am used for that :)
"
Class {
	#name : #MlCronoTask,
	#superclass : #Object,
	#instVars : [
		'doneDate',
		'notes',
		'tags'
	],
	#category : #'MyLittleSuite-Todo-Crono'
}

{ #category : #accessing }
MlCronoTask class >> findTasksDoneBetween: start and: end [
	| startTS endTS |  

	startTS := start asZTimestamp printString.
	endTS := end asZTimestamp printString.
	^ self selectMany: [ :each | (each doneDate >= startTS) & (each doneDate <= endTS) ]
]

{ #category : #testing }
MlCronoTask class >> isVoyageRoot [

	^ true
]

{ #category : #persistence }
MlCronoTask class >> voyageCollectionName [
	"Sending to a per-year collection to optimise storage. 
	 Maybe unnecesary."
	
	^ 'crono-tasks' format: { Year current year }
]

{ #category : #persistence }
MlCronoTask class >> voyageDoneDate [
	<voyageDescription>
	
	^ VOToOneDescription new 
		attributeName: 'doneDate';
		accessor: (MAPluggableAccessor 
			read: [ :aTask | aTask doneDate ifNotNil: #asString ]
			write: [ :aTask :date | aTask setDoneDateFromString: date ]);
		yourself
]

{ #category : #persistence }
MlCronoTask class >> voyageRepository [

	^ MlModelApplication current repository
]

{ #category : #persistence }
MlCronoTask class >> voyageTags [
	<voyageDescription>
	
	^ VOToManyDescription new 
		attributeName: 'tags';
		kindCollection: Array;
		yourself
]

{ #category : #private }
MlCronoTask >> collectTagsOn: aString [

	^ MlTagCollector collectTagsOn: aString
]

{ #category : #accessing }
MlCronoTask >> doneDate [

	^ doneDate
]

{ #category : #testing }
MlCronoTask >> hasNotes [

	^ self notes isEmptyOrNil not
]

{ #category : #testing }
MlCronoTask >> isDone [

	^ doneDate notNil
]

{ #category : #accessing }
MlCronoTask >> notes [

	^ notes
]

{ #category : #accessing }
MlCronoTask >> notes: aString [

	notes := aString
]

{ #category : #accessing }
MlCronoTask >> pomodoroName [

	^ self notes lines first
]

{ #category : #printing }
MlCronoTask >> printChangeLogOn: stream [ 
	
	(('* ', self notes) withNoLineLongerThan: 96) lines 
		do: [ :each | stream << '    ' << each ]
		separatedBy: [ stream cr ]
]

{ #category : #printing }
MlCronoTask >> printCronoTimeLogOn: stream [ 
	| time separator |
	
	separator := String new: 6 withAll: Character space.
	time :=  self doneDate 
		ifNotNil: [ :ts | ts asTime logPrintTime, ' ' ]
		ifNil: [ separator ].
		
	(self notes withNoLineLongerThan: 94) lines 
		do: [ :each | 
			stream << time << each.
			time := separator ]
		separatedBy: [ 
			stream cr ]
]

{ #category : #printing }
MlCronoTask >> printOn: stream [ 
	
	stream << self notes
]

{ #category : #persistence }
MlCronoTask >> save [ 

	self setDoneDate: Time now.
	self updateTags.
	super save
]

{ #category : #private }
MlCronoTask >> setDoneDate: aZTimestamp [
	
	doneDate := aZTimestamp
]

{ #category : #private }
MlCronoTask >> setDoneDateFromString: aString [ 
	
	aString isString ifFalse: [ ^ self ].
	self setDoneDate: (aString ifNotNil: [ ZTimestamp fromString: aString ]).
	
]

{ #category : #accessing }
MlCronoTask >> tags [

	^ tags
]

{ #category : #private }
MlCronoTask >> updateTags [
	
	tags := (self collectTagsOn: self notes) asSet asArray
]
