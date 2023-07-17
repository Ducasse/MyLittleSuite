Class {
	#name : #MlsApplicationTest,
	#superclass : #TestCase,
	#instVars : [
		'application'
	],
	#category : #'MyLittleSuite-Todo-UI'
}

{ #category : #tests }
MlsApplicationTest >> closeWindows [ 
	self flag: #hack.
	"closeAllWindows of SpSapplication does not look to work so turn around."
	(SpWindow allInstances select: [ :each | each labelString = 'Todo List' ]) do: [ :each | each close ]
]

{ #category : #tests }
MlsApplicationTest >> systemWindows [ 
	(SystemWindow allInstances select: [ :each | each title = 'Todo List' ]) do: [ :each | each close ]
]

{ #category : #tests }
MlsApplicationTest >> tearDown [

	application ifNotNil: [ application closeAllWindows ].
	super tearDown
]

{ #category : #tests }
MlsApplicationTest >> testEmptyTaskShouldNotFail [

	MlsTaskDB uniqueInstance withNewDuring: 
		[ MlsTaskDB tasks isEmpty. 
		application := MlsApplication new run ]
]
