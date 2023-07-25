"
To open the app.

```
MlsApplication new run
```
"
Class {
	#name : #MlsApplication,
	#superclass : #SpApplication,
	#instVars : [
		'openAsWorld'
	],
	#classVars : [
		'Default'
	],
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

{ #category : #'instance creation' }
MlsApplication class >> open [
	<script>
	
	^ (Default := self new)
		beOpenedNotAsWorld;
		run
]

{ #category : #scripts }
MlsApplication class >> openFull [ 
	<script>
	
	^ (Default := self new) 
		beOpenedAsWorld;
		run
]

{ #category : #opening }
MlsApplication >> beOpenedAsWorld [
	self openAsWorld: true
]

{ #category : #opening }
MlsApplication >> beOpenedNotAsWorld [
	self openAsWorld: false
]

{ #category : #running }
MlsApplication >> configuredPresenter [
	
	^ (MlsSimpleTaskListPresenter new
		application: self; yourself )
	
]

{ #category : #initialization }
MlsApplication >> initialize [

	super initialize.
	self openAsWorld: false.
]

{ #category : #accessing }
MlsApplication >> openAsWorld: aBoolean [
	openAsWorld := aBoolean
]

{ #category : #running }
MlsApplication >> start [
	
	
	openAsWorld ifTrue: [ 
		self startFull.
	^ self ].

	self configuredPresenter open

]

{ #category : #running }
MlsApplication >> startFull [
	
	| presenter |
	presenter := self configuredPresenter.
	presenter asWorldWindow title: 'Todo' ; open
	
]
