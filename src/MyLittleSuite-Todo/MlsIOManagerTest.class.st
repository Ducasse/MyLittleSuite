Class {
	#name : #MlsIOManagerTest,
	#superclass : #TestCase,
	#instVars : [
		'filesystem',
		'emptyFilesystem',
		'file'
	],
	#category : #'MyLittleSuite-Todo-Model'
}

{ #category : #initialization }
MlsIOManagerTest >> fillUpTasksStonFile [
	
	^ self tasksStonFile 
			writeStreamDo: [ :stream | stream nextPutAll: self tasksStonFileContents ];
		yourself
]

{ #category : #initialization }
MlsIOManagerTest >> setUp [
	
	super setUp.
	filesystem := FileSystem memory.
	(filesystem workingDirectory / 'TodoFiles') ensureCreateDirectory.
	self fillUpTasksStonFile
	
]

{ #category : #initialization }
MlsIOManagerTest >> tasksStonFile [

	^ (filesystem workingDirectory / 'TodoFiles' / 'tasks.ston') 
]

{ #category : #initialization }
MlsIOManagerTest >> tasksStonFileContents [
	"STON toStringPretty: MlsTaskDB tasks"
	
	^ 'OrderedCollection [
	MlsTask {
		#done : true,
		#title : ''Gitane''
	},
	MlsTask {
		#done : true,
		#title : ''gonflage pneus''
	},
	MlsTask {
		#done : true,
		#title : ''PMI: 106 rue pierre legrand''
	}	
]'  
]

{ #category : #tests }
MlsIOManagerTest >> testAssertFilesAreInAnotherPlace [

	| manager |
	manager := MlsIOManager new folderReference: filesystem / 'NewToo'.
	
	self assert: (filesystem / 'NewToo') isDirectory.
	self assert:  (filesystem / 'NewToo' / 'tasks.ston') exists.
	
]

{ #category : #'tests - setup' }
MlsIOManagerTest >> testAssertFilesAreThere [

	self assert: (filesystem / 'TodoFiles') isDirectory.
	self assert:  (filesystem / 'TodoFiles' / 'tasks.ston') isFile.
	self assert: (filesystem  / 'TodoFiles') children size equals: 1
]

{ #category : #tests }
MlsIOManagerTest >> testCreateFolderInstallsFileZeroToo [

	| manager |
	manager := MlsIOManager new folderReference: filesystem / 'NewToo'.
	self assert: (filesystem / 'NewToo') isDirectory.
	self assert:  (filesystem / 'NewToo' / 'tasks.ston') exists.
	
]

{ #category : #tests }
MlsIOManagerTest >> testFilesSavedInAnotherPlace [

	| manager |
	manager := MlsIOManager new folderReference: filesystem / 'NewToo'.
	manager saveTasks.
	self assert:  (filesystem / 'NewToo' / 'tasks.1.ston') exists.
	
]

{ #category : #tests }
MlsIOManagerTest >> testFilesSavedInAnotherPlaceTwoTimes [

	| manager |
	manager := MlsIOManager new folderReference: filesystem / 'NewToo'.
	manager saveTasks.
	manager saveTasks.
	self assert:  (filesystem / 'NewToo' / 'tasks.1.ston') exists.
	self assert:  (filesystem / 'NewToo' / 'tasks.2.ston') exists.
	
]

{ #category : #'tests - setup' }
MlsIOManagerTest >> testStonToObjects [

	| objects |
	objects := STON fromString: self tasksStonFile contents.
	self assert: objects size equals: 3.
	self assert: objects first class equals: MlsTask 
]
