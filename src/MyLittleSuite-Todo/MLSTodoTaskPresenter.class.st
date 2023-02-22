Class {
	#name : #MLSTodoTaskPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'task',
		'titlePresenter'
	],
	#category : #'MyLittleSuite-Todo'
}

{ #category : #initialization }
MLSTodoTaskPresenter >> accept [

	self task 
		title: titlePresenter text;
		save.
]

{ #category : #initialization }
MLSTodoTaskPresenter >> initializeDialogWindow: aDialogWindowPresenter [

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
MLSTodoTaskPresenter >> initializePresenters [

	titlePresenter := self newTextInput.
	titlePresenter selectAll.

	self layout: (SpBoxLayout newTopToBottom
				add: titlePresenter expand: false;
				yourself)
]

{ #category : #accessing }
MLSTodoTaskPresenter >> task [

	^ task
]

{ #category : #accessing }
MLSTodoTaskPresenter >> task: aTask [

	task := aTask.
	self updatePresenter
]

{ #category : #initialization }
MLSTodoTaskPresenter >> updatePresenter [

	task ifNotNil: [  
		titlePresenter text: (task title ifNil: [ '' ]) ]
]
