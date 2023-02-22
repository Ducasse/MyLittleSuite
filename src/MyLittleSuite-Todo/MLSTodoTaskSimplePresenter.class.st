Class {
	#name : #MLSTodoTaskSimplePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'task',
		'titlePresenter'
	],
	#category : #'MyLittleSuite-Todo'
}

{ #category : #initialization }
MLSTodoTaskSimplePresenter >> accept [

	self task 
		title: titlePresenter text;
		save.
]

{ #category : #initialization }
MLSTodoTaskSimplePresenter >> initializeDialogWindow: aDialogWindowPresenter [

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
MLSTodoTaskSimplePresenter >> initializePresenters [

	titlePresenter := self newTextInput.
	titlePresenter selectAll.

	self layout: (SpBoxLayout newTopToBottom
				add: titlePresenter expand: false;
				yourself)
]

{ #category : #accessing }
MLSTodoTaskSimplePresenter >> task [

	^ task
]

{ #category : #accessing }
MLSTodoTaskSimplePresenter >> task: aTask [

	task := aTask.
	self updatePresenter
]

{ #category : #initialization }
MLSTodoTaskSimplePresenter >> updatePresenter [

	task ifNotNil: [  
		titlePresenter text: (task title ifNil: [ '' ]) ]
]
