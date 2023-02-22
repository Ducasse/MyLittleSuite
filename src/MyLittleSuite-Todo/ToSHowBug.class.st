Class {
	#name : #ToSHowBug,
	#superclass : #SpPresenter,
	#instVars : [
		'descriptionInput'
	],
	#category : #'MyLittleSuite-Todo'
}

{ #category : #'instance creation' }
ToSHowBug class >> open [ 
	<script>
	self new open
]

{ #category : #layout }
ToSHowBug >> defaultLayout [

	^ (SpGridLayout new
				add: 'Description' at: 1 @ 1;
		  		add: descriptionInput at: 1 @ 2 span: 2 @ 4;
				yourself)
]

{ #category : #layout }
ToSHowBug >> initializePresenters [ 

	descriptionInput := self newText.
]
