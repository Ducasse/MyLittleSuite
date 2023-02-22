"
`TodoApplication new run`
"
Class {
	#name : #MLSTodoApplication,
	#superclass : #SpApplication,
	#category : #'MyLittleSuite-Todo'
}

{ #category : #running }
MLSTodoApplication class >> run [
	"self run"
	self new run
]

{ #category : #running }
MLSTodoApplication >> start [
	"self new run"
	
	MSLTodoListPresenter open
]
