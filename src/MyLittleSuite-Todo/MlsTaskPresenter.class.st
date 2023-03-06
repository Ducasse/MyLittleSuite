Class {
	#name : #MlsTaskPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'task',
		'title',
		'dueDate',
		'done',
		'doneDate',
		'description'
	],
	#category : #'MyLittleSuite-Todo-UI'
}

{ #category : #actions }
MlsTaskPresenter >> accept [

	self task 
		title: title text;
		done: done ;
		doneDate: doneDate;
		dueDate: dueDate;
		description: description;
		declareTask.
]

{ #category : #accessing }
MlsTaskPresenter >> defaultLayout [ 
	"MLSTodoTaskPresenter new open"
	^ SpBoxLayout newTopToBottom
			add: (SpBoxLayout newLeftToRight 
						add: done; add: title; yourself );
			add: (SpBoxLayout newLeftToRight 
						add: 'dueDate'; add: dueDate; yourself );
			add: (SpBoxLayout newLeftToRight 
						add: 'dueDate'; add: doneDate; yourself );
			add: description;
			yourself 
]

{ #category : #accessing }
MlsTaskPresenter >> initializePresenters [ 
	
	title := self newTextInput.
	dueDate := self instantiate: SpDatePresenter.
	doneDate := self instantiate: SpDatePresenter.
	description := self newTextInput.
	done := self newToggleButton 

]

{ #category : #accessing }
MlsTaskPresenter >> task [

	^ task
]
