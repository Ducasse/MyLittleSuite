Class {
	#name : #MlsTaskSimplePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'task',
		'titlePresenter'
	],
	#category : #'MyLittleSuite-Todo-UI'
}

{ #category : #initialization }
MlsTaskSimplePresenter >> accept [

	self task 
		title: titlePresenter text;
		save.
]

{ #category : #initialization }
MlsTaskSimplePresenter >> initializeDialogWindow: aDialogWindowPresenter [

	aDialogWindowPresenter 
		title: 'New task';
		initialExtent: 350@120;
		addButton: 'Accept' do: [ :dialog |
			self accept.
			dialog close ];
		addButton: 'Cancel' do: [ :dialog |
			dialog close ]
]

{ #category : #initialization }
MlsTaskSimplePresenter >> initializePresenters [

	titlePresenter := self newTextInput.
	titlePresenter selectAll.

	self layout: (SpBoxLayout newTopToBottom
				add: titlePresenter expand: false;
				yourself)
]

{ #category : #accessing }
MlsTaskSimplePresenter >> task [

	^ task
]

{ #category : #accessing }
MlsTaskSimplePresenter >> task: aTask [

	task := aTask.
	self updatePresenter
]

{ #category : #initialization }
MlsTaskSimplePresenter >> updatePresenter [

	task ifNotNil: [  
		titlePresenter text: (task title ifNil: [ '' ]) ]
]
