Class {
	#name : #MlsTaskPresenter2,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'dueDate',
		'doneDate',
		'checkboxInput',
		'dueDateLabel',
		'nameLabel',
		'nameTextInput',
		'workingModel',
		'submitButton',
		'restoreButton',
		'doneCheckbox',
		'checkboxLabel',
		'doneLabel',
		'descriptionInput',
		'descriptionLabel'
	],
	#category : #'MyLittleSuite-Todo-UI'
}

{ #category : #'instance creation' }
MlsTaskPresenter2 class >> open [
	<script>
	(self on: MlsTask new) open
]

{ #category : #initialization }
MlsTaskPresenter2 >> connectPresenters [
	submitButton action: [ self submit ].
	restoreButton action: [ self restore ]
]

{ #category : #initialization }
MlsTaskPresenter2 >> defaultLayout [
	
	^ SpBoxLayout newTopToBottom
		add: (SpGridLayout build: [ :builder |
			builder
				beColumnHomogeneous;
				add: 'Done:';
				add: doneCheckbox;
				nextRow;
				add: 'Onliner:';
				add: nameTextInput;
				nextRow;
				add: 'Remember me:';
				add: checkboxInput;
				nextRow;
				add: 'Due Date:';
				add: dueDate;
				nextRow;
				add: 'Done Date:';
				add: doneDate ;
				nextRow;
				add: 'Description:' ;
				add: descriptionInput ]) ;
		add: (SpBoxLayout newLeftToRight
			add: submitButton;
			add: restoreButton;
			yourself)
		expand: false	
			;
		yourself
		
]

{ #category : #'model updates' }
MlsTaskPresenter2 >> fillFormWithWorkingModel [
	"| aModel |
	aModel := self workingModel.
	self nameTextInput text: aModel name.
	self surnameTextInput text: aModel surname.
	self number1Input text: aModel number1 asString.
	self number2Input text: aModel number2 asString.
	self scaleInput value: aModel scale.
	self passwordInput text: aModel password.
	self checkboxInput state: aModel rememberMe.
	self dateInput date: aModel date."
]

{ #category : #'model updates' }
MlsTaskPresenter2 >> fillModelWithFormContent [

	"self workingModel
		name: self nameTextInput text;
		surname: self surnameTextInput text;
		scale: self scaleInput value;
		password: self passwordInput text;
		rememberMe: self checkboxInput state;
		date: self dateInput date."
]

{ #category : #'morphic ui' }
MlsTaskPresenter2 >> initialExtent [

	^ 400@400
]

{ #category : #initialization }
MlsTaskPresenter2 >> initializePresenters [ 

	nameLabel := self newLabel label: 'Oneliner'.
	nameTextInput := self newTextInput.
	
	descriptionLabel := self newLabel label: 'Description'.
	descriptionInput := self newTextInput.
	
	checkboxLabel := self newLabel label: 'remember me'.
	checkboxInput := self newCheckBox state: true.
	
	doneLabel := self newLabel label: 'Done'.
	doneCheckbox := self newCheckBox state: false.

	dueDateLabel := self newLabel label: 'Due date'.
	dueDate := self instantiate: SpDatePresenter.
	dueDate display: [ :item | item yyyymmdd ].
	
	dueDateLabel := self newLabel label: 'Done date'.
	doneDate := self instantiate: SpDatePresenter.
	doneDate display: [ :item | item yyyymmdd ].

	submitButton := self newButton label: 'Submit'.
	restoreButton := self newButton label: 'Restore'
]

{ #category : #initialization }
MlsTaskPresenter2 >> modelChanged [

	workingModel := self model copy.
	self fillFormWithWorkingModel
]

{ #category : #initialization }
MlsTaskPresenter2 >> restore [

	self modelChanged
]

{ #category : #initialization }
MlsTaskPresenter2 >> submit [

	self fillModelWithFormContent.
	
	self model: workingModel.
	self announcingObject valueChanged
]

{ #category : #'morphic ui' }
MlsTaskPresenter2 >> title [

	^ self model  title
]

{ #category : #initialization }
MlsTaskPresenter2 >> workingModel [
	^ workingModel
]

{ #category : #initialization }
MlsTaskPresenter2 >> workingModel: anObject [
	workingModel := anObject
]
