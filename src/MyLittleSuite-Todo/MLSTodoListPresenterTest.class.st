Class {
	#name : #MLSTodoListPresenterTest,
	#superclass : #TestCase,
	#instVars : [
		'presenter'
	],
	#category : #'MyLittleSuite-Todo'
}

{ #category : #tests }
MLSTodoListPresenterTest >> tearDown [ 
	presenter ifNotNil: [ presenter delete ].
	super tearDown
]

{ #category : #tests }
MLSTodoListPresenterTest >> testAddingATask [

	presenter := MSLTodoListPresenter new. 
	presenter open.
	
	presenter addTask.
	
]
