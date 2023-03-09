"
I'm a list type inbox.
"
Class {
	#name : #MlTodoTypeInbox,
	#superclass : #MlTodoType,
	#category : #'MyLittleSuite-Todo-Crono'
}

{ #category : #accessing }
MlTodoTypeInbox >> defaultIconName [

	^ #inbox
]

{ #category : #accessing }
MlTodoTypeInbox >> name [
	
	^ 'Inbox'
]

{ #category : #testing }
MlTodoTypeInbox >> showsCompletion [

	^ false
]

{ #category : #testing }
MlTodoTypeInbox >> showsPendingSize [

	^ true
]

{ #category : #accessing }
MlTodoTypeInbox >> typeName [

	^ #inbox
]
