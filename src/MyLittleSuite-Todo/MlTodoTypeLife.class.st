"
I'm a list type ""life"" (general life tasks).
"
Class {
	#name : #MlTodoTypeLife,
	#superclass : #MlTodoType,
	#category : #'MyLittleSuite-Todo-Crono'
}

{ #category : #accessing }
MlTodoTypeLife >> defaultIconName [

	^ #life
]

{ #category : #accessing }
MlTodoTypeLife >> name [
	
	^ 'Life'
]

{ #category : #testing }
MlTodoTypeLife >> showsCompletion [

	^ false
]

{ #category : #testing }
MlTodoTypeLife >> showsPendingSize [

	^ true
]

{ #category : #accessing }
MlTodoTypeLife >> typeName [

	^ #life
]
