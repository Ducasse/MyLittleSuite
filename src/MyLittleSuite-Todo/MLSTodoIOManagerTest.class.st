Class {
	#name : #MLSTodoIOManagerTest,
	#superclass : #TestCase,
	#instVars : [
		'filesystem',
		'emptyFilesystem',
		'file'
	],
	#category : #'MyLittleSuite-Todo-IO'
}

{ #category : #initialization }
MLSTodoIOManagerTest >> fillUpTasksStonFile [
	
	^ (filesystem workingDirectory / 'TodoFiles' / 'tasks.ston')
			writeStreamDo: [ :stream | stream nextPutAll: self tasksStonFileContents ];
		yourself
]

{ #category : #initialization }
MLSTodoIOManagerTest >> setUp [
	
	super setUp.
	filesystem := FileSystem memory.
	(filesystem workingDirectory / 'TodoFiles') ensureCreateDirectory.
	self fillUpTasksStonFile
	
]

{ #category : #initialization }
MLSTodoIOManagerTest >> tasksStonFileContents [
	"STON toStringPretty: MLSTodoTask tasks"
	^  'OrderedCollection [
	MLSTodoTask {
		#done : true,
		#title : ''horaire poubelle''
	},
	MLSTodoTask {
		#done : true,
		#title : ''Gitane''
	},
	MLSTodoTask {
		#done : true,
		#title : ''gonflage pneus''
	},
	MLSTodoTask {
		#done : false,
		#title : ''PMI: 106 rue pierre legrand''
	},
	MLSTodoTask {
		#done : true,
		#title : ''Chercher mac''
	},
	MLSTodoTask {
		#done : true,
		#title : ''98 euros dms -> devis''
	},
	MLSTodoTask {
		#done : false,
		#title : ''dddsdsPlease give me a title''
	},
	MLSTodoTask {
		#done : true,
		#title : ''Contact Quanteos''
	},
	MLSTodoTask {
		#done : true,
		#title : ''Invitation''
	},
	MLSTodoTask {
		#done : false,
		#title : ''CFP deadline for presentation''
	},
	MLSTodoTask {
		#done : false,
		#title : ''Missing check for Quanteos''
	},
	MLSTodoTask {
		#done : false,
		#title : ''Autre entreprise pour facade''
	},
	MLSTodoTask {
		#done : false,
		#title : ''Trip at Brest''
	}
]'
]

{ #category : #tests }
MLSTodoIOManagerTest >> testAssertFilesAreThere [

	self assert: (filesystem / 'TodoFiles') isDirectory.
	self assert:  (filesystem / 'TodoFiles' / 'tasks.ston') isFile.
	self assert: (filesystem  / 'TodoFiles') children size equals: 1
]

{ #category : #tests }
MLSTodoIOManagerTest >> testStonToObjects [

	| objects |
	objects := STON fromString: self tasksStonFile contents.
	self assert: objects size equals: 13.
	self assert: objects first class equals: MLSTodoTask 
]
