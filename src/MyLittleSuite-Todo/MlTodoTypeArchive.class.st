"
I'm a list type archive. It means that the items (even if they are not done) are in a special status (archived).
"
Class {
	#name : #MlTodoTypeArchive,
	#superclass : #MlTodoType,
	#category : #'MyLittleSuite-Todo-Crono'
}

{ #category : #accessing }
MlTodoTypeArchive >> defaultIconName [

	^ #trash
]

{ #category : #testing }
MlTodoTypeArchive >> isVisible [

	^ false
]

{ #category : #accessing }
MlTodoTypeArchive >> name [
	
	^ 'Archive'
]

{ #category : #testing }
MlTodoTypeArchive >> showsCompletion [

	^ false
]

{ #category : #accessing }
MlTodoTypeArchive >> typeName [

	^ #archive
]
