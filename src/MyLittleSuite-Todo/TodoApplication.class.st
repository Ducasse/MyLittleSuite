"
`TodoApplication new run`
"
Class {
	#name : #TodoApplication,
	#superclass : #SpApplication,
	#category : #'MyLittleSuite-Todo'
}

{ #category : #accessing }
TodoApplication >> start [ 

	TodoListPresenter open
]
