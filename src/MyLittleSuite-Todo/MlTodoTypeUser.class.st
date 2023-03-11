"
I represent a type of list created by the user.
"
Class {
	#name : #MlTodoTypeUser,
	#superclass : #MlTodoType,
	#category : #'MyLittleSuite-Todo-Crono'
}

{ #category : #accessing }
MlTodoTypeUser >> defaultIconName [

	^ #user
]

{ #category : #accessing }
MlTodoTypeUser >> defaultName [

	^ 'New list'
]

{ #category : #testing }
MlTodoTypeUser >> isEditable [

	^ true
]

{ #category : #accessing }
MlTodoTypeUser >> name [
	
	^ 'User'
]

{ #category : #accessing }
MlTodoTypeUser >> typeName [

	^ #user
]
