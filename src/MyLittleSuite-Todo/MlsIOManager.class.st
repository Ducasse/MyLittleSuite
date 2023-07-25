Class {
	#name : #MlsIOManager,
	#superclass : #Object,
	#instVars : [
		'folderReference',
		'workingDirectoryReference'
	],
	#classVars : [
		'Folder',
		'WorkingDirectory'
	],
	#category : #'MyLittleSuite-Todo-Model'
}

{ #category : #installation }
MlsIOManager class >> initialize [
	WorkingDirectory := FileSystem workingDirectory.
	Folder := (WorkingDirectory / 'TodoFiles/' ) resolve
]

{ #category : #'system startup' }
MlsIOManager class >> shutDown: isImageQuitting [
	
	"this implies that we need to keep folder information as shared variable since
	we may have set a different folder and the new instance should get initialized with it."
	self new saveTasks
	
]

{ #category : #'system startup' }
MlsIOManager class >> startUp: isResuming [

	self new loadTasks
]

{ #category : #actions }
MlsIOManager >> createFolder [

	self folderReference ensureCreateDirectory.
	(self folderReference / 'tasks.ston') ensureCreateFile

]

{ #category : #accessing }
MlsIOManager >> folderReference [
	
	^ folderReference ifNil: [ folderReference := Folder  ]
]

{ #category : #accessing }
MlsIOManager >> folderReference: aFileReference [

	folderReference := aFileReference.
	self createFolder 
]

{ #category : #actions }
MlsIOManager >> loadTasks [
	"self loadTasks"
	
	| tasks | 
	tasks := STON fromStream: self mainFile readStream.
	MlsTaskDB uniqueInstance setTasks: tasks.

	
	
]

{ #category : #accessing }
MlsIOManager >> mainFile [
	"self mainFile nextVersion"

	^  self folderReference resolve: (self folderReference lastFileFor: 'tasks' extension: 'ston') 
]

{ #category : #actions }
MlsIOManager >> safeLoadTasks [
	"self loadTasks"
	
	| tasks | 
	tasks:= STON fromStream: self mainFile readStream.
	"we only install saved todos if there is no new ones."
	
	MlsTaskDB uniqueInstance isDirty 
		ifFalse: [ MlsTaskDB uniqueInstance setTasks: tasks ]
	
]

{ #category : #actions }
MlsIOManager >> saveTasks [
	"self saveTasks"
	
	"only save when necessary"
	MlsTaskDB uniqueInstance isDirty 
		ifTrue: [ | stream |
			stream := self mainFile nextVersion writeStream.
			[
			stream nextPutAll: (STON toStringPretty: MlsTaskDB uniqueInstance tasks).
			"once saved, there is no dirty information anymore."
			MlsTaskDB uniqueInstance clean.
			stream flush ] ensure: [ stream close ] ]
]

{ #category : #accessing }
MlsIOManager >> workingDirectoryReference [

	^ workingDirectoryReference ifNil: [ workingDirectoryReference := WorkingDirectory ]
]

{ #category : #accessing }
MlsIOManager >> workingDirectoryReference: aWorkingDirectory [

	workingDirectoryReference := aWorkingDirectory.
	WorkingDirectory := aWorkingDirectory
]
