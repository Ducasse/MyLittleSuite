"
This version is expecting an object.
Imagine you get a ston object serialized and you load it back but the class got new fields.
This updater does not handle renamed fields because this should not be done at the object level (if the object has been created then this is too late). 
"
Class {
	#name : #MlsTObjectUpdater,
	#superclass : #Object,
	#category : #'MyLittleSuite-Todo-Updater'
}

{ #category : #migrate }
MlsTObjectUpdater >> migrate: anObject [ 
	
	anObject class instVarNames
		doWithIndex: [ :each :index |
				(anObject instVarAt: index) ifNil: [ anObject perform: #initialize, each capitalized ]
			 	]	
]
