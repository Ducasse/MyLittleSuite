"
`TodoApplication new run`
"
Class {
	#name : #TodoApplication,
	#superclass : #SpApplication,
	#category : #'MyLittleSuite-Todo'
}

{ #category : #running }
TodoApplication >> start [

	TodoListPresenter open
]
