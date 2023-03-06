Class {
	#name : #MlsIOManager,
	#superclass : #Object,
	#instVars : [
		'fileReference'
	],
	#classVars : [
		'Folder',
		'MainFile'
	],
	#category : #'MyLittleSuite-Todo-IO'
}

{ #category : #installation }
MlsIOManager class >> createFolder [

	self folder ensureCreateDirectory 
]

{ #category : #installation }
MlsIOManager class >> folder [

	Folder := (FileSystem workingDirectory / 'TodoFiles' ) asFileReference
]

{ #category : #installation }
MlsIOManager class >> install [

	self folder exists 
		ifFalse: [ self createFolder ].
	self mainFile exists
		ifTrue: [ self loadTasks ]
		ifFalse: [ self saveTasks ]
]

{ #category : #installation }
MlsIOManager class >> mainFile [

	MainFile := self folder / 'Tasks.ston'	
]

{ #category : #installation }
MlsIOManager class >> saveTasks [

	self halt
]

{ #category : #'as yet unclassified' }
MlsIOManager >> folder [
	^ self class folder
]

{ #category : #'as yet unclassified' }
MlsIOManager >> save [
	"self new save"
	
	| stream | 
	fileReference := FileSystem workingDirectory / 'TodoFiles' / 'tasks.ston'.
	fileReference ensureCreateFile.
	stream := fileReference writeStream. 
	[
	stream nextPutAll: (STON toStringPretty: MlsTaskDB tasks).
	stream flush
		] ensure: [ stream close ].	
	
	

]
