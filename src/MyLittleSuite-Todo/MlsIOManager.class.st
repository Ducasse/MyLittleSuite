Class {
	#name : #MlsIOManager,
	#superclass : #Object,
	#instVars : [
		'fileReference'
	],
	#classVars : [
		'Folder'
	],
	#category : #'MyLittleSuite-Todo-IO'
}

{ #category : #installation }
MlsIOManager class >> createFolder [

	self folder ensureCreateDirectory 
]

{ #category : #installation }
MlsIOManager class >> folder [

	^ Folder ifNil: [(FileSystem workingDirectory / 'TodoFiles/' ) resolve ]
]

{ #category : #installation }
MlsIOManager class >> initialize [

	self install
]

{ #category : #installation }
MlsIOManager class >> install [

	self folder exists 
		ifFalse: [ self createFolder ].
	self mainFile exists
		ifTrue: [ 
			"here we should pay attention because the image 
			may be older than the file so we should check the freshId."
			self loadTasks ]
		ifFalse: [ self saveTasks ]
]

{ #category : #installation }
MlsIOManager class >> loadTasks [
	"self loadTasks"
	
	| taskDB | 
	taskDB := STON fromStream: self mainFile readStream.
	taskDB freshId >= MlsTaskDB uniqueInstance freshId 
		ifTrue: [ MlsTaskDB uniqueInstance: taskDB ]
		ifFalse: [  self inform: 'File is older than current' ]
]

{ #category : #installation }
MlsIOManager class >> mainFile [
	"self mainFile nextVersion"

	^  self folder resolve: (self folder lastFileFor: 'tasks' extension: 'ston') 
]

{ #category : #installation }
MlsIOManager class >> saveTasks [
	"self saveTasks"
	
	| stream |
	stream := self mainFile nextVersion writeStream. 
	[ stream nextPutAll: (STON toStringPretty: MlsTaskDB uniqueInstance).
	stream flush ] ensure: [ stream close ]	
]

{ #category : #accessing }
MlsIOManager >> folder [
	^ self class folder
]

{ #category : #actions }
MlsIOManager >> load [
	"self new save"
	
	self class loadTasks
	

]

{ #category : #actions }
MlsIOManager >> save [
	"self new save"
	
	self class saveTasks
	

]
