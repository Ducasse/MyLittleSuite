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
	#classInstVars : [
		'developmentEnvironmentEnabled'
	],
	#category : #'MyLittleSuite-Todo-UI'
}

{ #category : #settings }
MlsApplication class >> closeAllWindows [

	[ World closeAllWindowsDiscardingChanges ]
		on: ProvideAnswerNotification
		do: [ :err | err return: false ]
]

{ #category : #settings }
MlsApplication class >> closeWindowsAndOpenDevelopmentEnvironment [
	PanelMorph allInstancesDo: [  :pm | pm delete ].
	self closeAllWindows.
	TaskbarMorph reset.
	Smalltalk tools workspace openContents: 'PharoLauncherApplication open.'.

	"PanelMorph comes from use of #openWorldWithSpec"
]

{ #category : #settings }
MlsApplication class >> closeWindowsAndOpenLauncher [

	self
		closeAllWindows;
		openFull
]

{ #category : #accessing }
MlsApplication class >> descriptionText [	
	^ 'A todo App under dev'
]

{ #category : #accessing }
MlsApplication class >> developmentEnvironmentEnabled [

    ^ developmentEnvironmentEnabled
]

{ #category : #settings }
MlsApplication class >> developmentEnvironmentEnabled: aBoolean [
   developmentEnvironmentEnabled := aBoolean.
	aBoolean
		ifTrue: [ "self undoAll. "
		self closeWindowsAndOpenDevelopmentEnvironment ]
		ifFalse: [ "self doAll. 
			self closeWindowsAndOpenLauncher." ]
]

{ #category : #accessing }
MlsApplication class >> iconName [
	^ #jigsawIcon
]

{ #category : #initialization }
MlsApplication class >> initialize [ 

   developmentEnvironmentEnabled := true
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

{ #category : #opening }
MlsApplication class >> open [
	<script>
	
	^ (Default := self new)
		beOpenedNotAsWorld;
		run
]

{ #category : #opening }
MlsApplication class >> openFull [ 
	<script>
	
	^ (Default := self new) 
		beOpenedAsWorld;
		run
]

{ #category : #settings }
MlsApplication class >> settingsOn: aBuilder [
	<systemsettings>
	(aBuilder setting: #developmentEnvironmentEnabled) 
		parent: #Todo;
		target: self;
		order: 60;
		label: 'Enable development environment' translated;
		description: 'Missing a feature?  Hey come join in!  Add your custom feature.
When enabled, exits the application into the Pharo development environment.
When disabled, closes all windows and locks application as the only running application. '.
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
