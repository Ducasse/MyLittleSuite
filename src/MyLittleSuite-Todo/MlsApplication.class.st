"
To open the app.

```
MlsApplication new run
```
"
Class {
	#name : #MlsApplication,
	#superclass : #SpApplication,
	#category : #'MyLittleSuite-Todo-UI'
}

{ #category : #accessing }
MlsApplication class >> descriptionText [	
	^ 'A todo App under dev'
]

{ #category : #accessing }
MlsApplication class >> iconName [
	^ #jigsawIcon
]

{ #category : #'world menu' }
MlsApplication class >> menuCommandOn: aBuilder [

	<worldMenu>
	(aBuilder item: 'Todo')
		action: [ self new run ];
		order: 32;
		parent: #Tools;
		help: self descriptionText;
		icon: (aBuilder iconNamed: self iconName)
]

{ #category : #running }
MlsApplication class >> run [
	"self run"
	self new run
]

{ #category : #running }
MlsApplication >> start [
		
	MlsSimpleTaskListPresenter new
		application: self ; open.

]
