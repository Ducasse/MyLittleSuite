"
I'm a list type focus.
"
Class {
	#name : #MlTodoTypeFocus,
	#superclass : #MlTodoType,
	#category : #'MyLittleSuite-Todo-Crono'
}

{ #category : #accessing }
MlTodoTypeFocus >> defaultIconName [

	^ #active
]

{ #category : #accessing }
MlTodoTypeFocus >> name [
	
	^ 'Focus'
]

{ #category : #testing }
MlTodoTypeFocus >> showsCompletion [

	^ false
]

{ #category : #testing }
MlTodoTypeFocus >> showsFocus [

	^ false
]

{ #category : #testing }
MlTodoTypeFocus >> showsPendingSize [

	^ true
]

{ #category : #accessing }
MlTodoTypeFocus >> typeName [

	^ #focus
]
