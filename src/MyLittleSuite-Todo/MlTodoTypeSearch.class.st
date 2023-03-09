"
I'm a list type search... to show search results.
"
Class {
	#name : #MlTodoTypeSearch,
	#superclass : #MlTodoType,
	#category : #'MyLittleSuite-Todo-Crono'
}

{ #category : #accessing }
MlTodoTypeSearch >> defaultIconName [

	^ #search
]

{ #category : #accessing }
MlTodoTypeSearch >> name [
	
	^ 'Search'
]

{ #category : #testing }
MlTodoTypeSearch >> showsCompletion [

	^ false
]

{ #category : #testing }
MlTodoTypeSearch >> showsFocus [

	^ true
]

{ #category : #testing }
MlTodoTypeSearch >> showsPendingSize [

	^ true
]

{ #category : #accessing }
MlTodoTypeSearch >> typeName [

	^ 'search'
]
