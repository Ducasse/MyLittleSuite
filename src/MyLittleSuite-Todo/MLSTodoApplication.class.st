"
`TodoApplication new run`
"
Class {
	#name : #MLSTodoApplication,
	#superclass : #SpApplication,
	#category : #'MyLittleSuite-Todo'
}

{ #category : #running }
MLSTodoApplication >> start [

	MSLTodoListPresenter open
]
