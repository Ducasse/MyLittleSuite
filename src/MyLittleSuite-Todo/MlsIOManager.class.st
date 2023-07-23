Class {
	#name : #MlsIOManager,
	#superclass : #Object,
	#instVars : [
		'folderReference',
		'workingDirectoryReference'
	],
	#category : #'MyLittleSuite-Todo-Model'
}

{ #category : #installation }
MlsIOManager class >> initialize [

	
	self install
]

{ #category : #'system startup' }
MlsIOManager class >> shutDown: isImageQuitting [
	Transcript show: 'shutdown'.
	"self saveTasks"
	
]

{ #category : #'system startup' }
MlsIOManager class >> startUp: isResuming [
	Transcript show: 'startUp'.
	"self loadTasks"
]

{ #category : #actions }
MlsIOManager >> createFolder [

	self folder ensureCreateDirectory 
]

{ #category : #accessing }
MlsIOManager >> folder [

	^ folderReference ifNil: [ ( workingDirectoryReference / 'TodoFiles/' ) resolve ]
]

{ #category : #accessing }
MlsIOManager >> folder: aFileReference [

	folderReference := aFileReference.
	self createFolder 
]

{ #category : #actions }
MlsIOManager >> loadTasks [
	"self loadTasks"
	
	| taskDB | 
	taskDB := STON fromStream: self mainFile readStream.
	MlsTaskDB uniqueInstance setTasks: taskDB.

	
	
]

{ #category : #accessing }
MlsIOManager >> mainFile [
	"self mainFile nextVersion"

	^  self folder resolve: (self folder lastFileFor: 'tasks' extension: 'ston') 
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
MlsIOManager >> save [
	"self new save"
	
	self class saveTasks
	

]

{ #category : #actions }
MlsIOManager >> saveTasks [
	"self saveTasks"
	
	| stream |
	stream := self mainFile nextVersion writeStream. 
	[ stream nextPutAll: (STON toStringPretty: MlsTaskDB uniqueInstance tasks).
	MlsTaskDB uniqueInstance clean.
	stream flush ] ensure: [ stream close ]	
]

{ #category : #accessing }
MlsIOManager >> workingDirectoryReference [

	^ workingDirectoryReference ifNil: [ FileSystem workingDirectory ]
]

{ #category : #accessing }
MlsIOManager >> workingDirectoryReference: aWorkingDirectory [

	workingDirectoryReference := aWorkingDirectory
]
