Class {
	#name : #MlsTUpdater,
	#superclass : #Object,
	#classVars : [
		'Folder'
	],
	#category : #'MyLittleSuite-Todo-Updater'
}

{ #category : #migrate }
MlsTUpdater >> folder [

	Folder := (FileSystem workingDirectory / 'TodoFiles' ) asFileReference
]

{ #category : #migrate }
MlsTUpdater >> migrate: anObject [ 
	
	anObject class instVarNames
		doWithIndex: [ :each :index |
				(anObject instVarAt: index) ifNil: [ anObject perform: #initialize, each capitalized ]
			 	]	
]
