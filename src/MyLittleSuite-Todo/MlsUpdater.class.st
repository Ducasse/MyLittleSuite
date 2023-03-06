Class {
	#name : #MlsUpdater,
	#superclass : #Object,
	#classVars : [
		'Folder'
	],
	#category : #'MyLittleSuite-Todo-Updater'
}

{ #category : #migrate }
MlsUpdater >> folder [

	Folder := (FileSystem workingDirectory / 'TodoFiles' ) asFileReference
]

{ #category : #migrate }
MlsUpdater >> migrate: anObject [ 
	
	anObject class instVarNames
		doWithIndex: [ :each :index |
				(anObject instVarAt: index) ifNil: [ anObject perform: #initialize, each capitalized ]
			 	]	
]
