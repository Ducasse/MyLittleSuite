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

	^ Folder ifNil: [(FileSystem workingDirectory / 'TodoFiles' ) asFileReference ]
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

	| taskDB | 
	taskDB := STON fromStream: self mainFile readStream.
	taskDB freshId > MlsTaskDB uniqueInstance freshId 
		ifTrue: [ MlsTaskDB uniqueInstance: taskDB ]
		ifFalse: [  self inform: 'File is older than current' ]
]

{ #category : #installation }
MlsIOManager class >> mainFile [

	^ MainFile ifNil: [ MainFile := self folder / 'Tasks.ston'	 ]
]

{ #category : #installation }
MlsIOManager class >> saveTasks [
	"self saveTasks"
	
	| stream |
	stream := self mainFile writeStream. 
	[ stream nextPutAll: (STON toStringPretty: MlsTaskDB uniqueInstance).
	stream flush ] ensure: [ stream close ]	
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
