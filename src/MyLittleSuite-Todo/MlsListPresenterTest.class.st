Class {
	#name : #MlsListPresenterTest,
	#superclass : #TestCase,
	#instVars : [
		'presenter'
	],
	#category : #'MyLittleSuite-Todo-UI'
}

{ #category : #tests }
MlsListPresenterTest >> tearDown [ 
	presenter ifNotNil: [ presenter delete ].
	super tearDown
]

{ #category : #tests }
MlsListPresenterTest >> testAddingATask [

	
	presenter := MlsTaskListPresenter new. 
	presenter open.
		
]
