"
I'm a list type. In this design this is the list type that gives other properties to the items it contains.
"
Class {
	#name : #MlTodoType,
	#superclass : #Object,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'MyLittleSuite-Todo-Crono'
}

{ #category : #accessing }
MlTodoType class >> allTypes [

	^ MlTodoType allSubclasses collect: #uniqueInstance
]

{ #category : #accessing }
MlTodoType class >> archive [

	^ MlTodoTypeArchive uniqueInstance
]

{ #category : #accessing }
MlTodoType class >> focus [

	^ MlTodoTypeFocus uniqueInstance
]

{ #category : #'instance creation' }
MlTodoType class >> fromSton: stonReader [
	| typeName |
	
	typeName := stonReader parseListSingleton.
	^ self allTypes detect: [ :each | each name = typeName ]
]

{ #category : #accessing }
MlTodoType class >> inbox [

	^ MlTodoTypeInbox uniqueInstance
]

{ #category : #accessing }
MlTodoType class >> life [

	^ MlTodoTypeLife uniqueInstance
]

{ #category : #accessing }
MlTodoType class >> search [

	^ MlTodoTypeSearch uniqueInstance
]

{ #category : #'instance creation' }
MlTodoType class >> uniqueInstance [

	self = MlTodoType ifTrue: [ self error: 'I''m an abstract class. Use one of my children.' ].
	^ uniqueInstance ifNil: [ uniqueInstance := super new ]
]

{ #category : #accessing }
MlTodoType class >> unsorted [

	^ MlTodoTypeUnsorted uniqueInstance
]

{ #category : #accessing }
MlTodoType class >> user [

	^ MlTodoTypeUser uniqueInstance
]

{ #category : #accessing }
MlTodoType >> defaultIconName [
	"This is the default icon to assign to a list when it is created"

	^ nil
]

{ #category : #accessing }
MlTodoType >> defaultName [
	"This is the default name to assign to a list when it is created"

	^ self name
]

{ #category : #testing }
MlTodoType >> isEditable [

	^ false
]

{ #category : #testing }
MlTodoType >> isVisible [

	^ true
]

{ #category : #accessing }
MlTodoType >> name [
	
	^ self subclassResponsibility
]

{ #category : #testing }
MlTodoType >> showsCompletion [

	^ true
]

{ #category : #testing }
MlTodoType >> showsFocus [

	^ true
]

{ #category : #testing }
MlTodoType >> showsPendingSize [

	^ false
]

{ #category : #accessing }
MlTodoType >> typeName [

	^ self subclassResponsibility
]
