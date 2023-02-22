Class {
	#name : #MLSTodoTaskPresenter2,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'task',
		'title',
		'dueDate',
		'done',
		'doneDate',
		'description',
		'checkboxInput',
		'dateLabel',
		'dateInput',
		'nameLabel',
		'nameTextInput',
		'workingModel',
		'submitButton',
		'restoreButton',
		'doneCheckbox',
		'checkboxLabel',
		'doneLabel',
		'descriptionInput'
	],
	#category : #'MyLittleSuite-Todo'
}

{ #category : #'instance creation' }
MLSTodoTaskPresenter2 class >> open [
	<script>
	(self on: MLSTodoTask new) open
]

{ #category : #initialization }
MLSTodoTaskPresenter2 >> connectPresenters [
	submitButton action: [ self submit ].
	restoreButton action: [ self restore ]
]

{ #category : #initialization }
MLSTodoTaskPresenter2 >> defaultLayout [
	
	^ SpBoxLayout newTopToBottom
		add: (SpGridLayout build: [ :builder |
			builder
				add: 'Done:';
				add: doneCheckbox;
				nextRow;
				add: 'Onliner';
				add: nameTextInput;
				nextRow;
				add: 'Remember me:';
				add: checkboxInput;
				nextRow;
				add: 'Due Date:';
				add: dateInput;
				nextRow;
				add: 'Done Date:';
				add: dateInput
				]);
		add: (SpGridLayout new
				add: 'Description' at: 1 @ 1;
		  		add: descriptionInput at: 1 @ 2 span: 2 @ 4;
				yourself); 
			
		add: (SpBoxLayout newLeftToRight
			add: submitButton;
			add: restoreButton;
			yourself)
		expand: false;
		yourself
]

{ #category : #'model updates' }
MLSTodoTaskPresenter2 >> fillFormWithWorkingModel [
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
MLSTodoTaskPresenter2 >> fillModelWithFormContent [

	"self workingModel
		name: self nameTextInput text;
		surname: self surnameTextInput text;
		scale: self scaleInput value;
		password: self passwordInput text;
		rememberMe: self checkboxInput state;
		date: self dateInput date."
]

{ #category : #initialization }
MLSTodoTaskPresenter2 >> initializePresenters [ 

	nameLabel := self newLabel label: 'Oneliner'.
	nameTextInput := self newTextInput.
	descriptionInput := self newTextInput.
	
	checkboxLabel := self newLabel label: 'remember me'.
	checkboxInput := self newCheckBox state: true.
	
	doneLabel := self newLabel label: 'Doner'.
	doneCheckbox := self newCheckBox state: false.

	dateLabel := self newLabel label: 'date:'.
	dateInput := self instantiate: SpDatePresenter.
	dateInput display: [ :item | item yyyymmdd ].
	

	submitButton := self newButton label: 'Submit'.
	restoreButton := self newButton label: 'Restore'
]

{ #category : #initialization }
MLSTodoTaskPresenter2 >> modelChanged [

	workingModel := self model copy.
	self fillFormWithWorkingModel
]

{ #category : #initialization }
MLSTodoTaskPresenter2 >> restore [

	self modelChanged
]

{ #category : #initialization }
MLSTodoTaskPresenter2 >> submit [

	self fillModelWithFormContent.
	
	self model: workingModel.
	self announcingObject valueChanged
]

{ #category : #initialization }
MLSTodoTaskPresenter2 >> workingModel [
	^ workingModel
]

{ #category : #initialization }
MLSTodoTaskPresenter2 >> workingModel: anObject [
	workingModel := anObject
]
