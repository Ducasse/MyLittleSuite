"
I'm a list type unsorted.
"
Class {
	#name : #MlTodoTypeUnsorted,
	#superclass : #MlTodoType,
	#category : #'MyLittleSuite-Todo-Crono'
}

{ #category : #accessing }
MlTodoTypeUnsorted >> defaultIconName [

	^ #waiting
]

{ #category : #accessing }
MlTodoTypeUnsorted >> name [
	
	^ 'Unsorted'
]

{ #category : #testing }
MlTodoTypeUnsorted >> showsCompletion [

	^ false
]

{ #category : #testing }
MlTodoTypeUnsorted >> showsPendingSize [

	^ true
]

{ #category : #accessing }
MlTodoTypeUnsorted >> typeName [

	^ #unsorted
]
