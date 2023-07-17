"
`MlsApplication new run`
"
Class {
	#name : #MlsApplication,
	#superclass : #SpApplication,
	#category : #'MyLittleSuite-Todo-UI'
}

{ #category : #running }
MlsApplication class >> run [
	"self run"
	self new run
]

{ #category : #running }
MlsApplication >> start [
		
	MlsSimpleTaskListPresenter open.

]
