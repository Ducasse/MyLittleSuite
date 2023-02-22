Class {
	#name : #MLSTodoTaskPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'task',
		'title',
		'dueDate',
		'done',
		'doneDate',
		'description'
	],
	#category : #'MyLittleSuite-Todo'
}

{ #category : #actions }
MLSTodoTaskPresenter >> accept [

	self task 
		title: title text;
		done: done ;
		doneDate: doneDate;
		dueDate: dueDate;
		description: description;
		save.
]

{ #category : #accessing }
MLSTodoTaskPresenter >> defaultLayout [ 
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
MLSTodoTaskPresenter >> initializePresenters [ 
	
	title := self newTextInput.
	dueDate := self instantiate: SpDatePresenter.
	doneDate := self instantiate: SpDatePresenter.
	description := self newTextInput.
	done := self newToggleButton 

]

{ #category : #accessing }
MLSTodoTaskPresenter >> task [

	^ task
]
