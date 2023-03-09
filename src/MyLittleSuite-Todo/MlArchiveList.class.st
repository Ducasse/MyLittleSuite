"
I am a virtual list that will answer archived tasks.
"
Class {
	#name : #MlArchiveList,
	#superclass : #MlVirtualList,
	#category : #'MyLittleSuite-Todo-Crono'
}

{ #category : #visiting }
MlArchiveList >> accept: aVisitor [

	^ aVisitor visitArchiveList: self
]

{ #category : #accessing }
MlArchiveList >> summaryString [

	^ ''
]

{ #category : #accessing }
MlArchiveList >> tasks [

	self flag: #TODO.
	^ #()
]

{ #category : #accessing }
MlArchiveList >> type [

	^ MlTodoType trash
]
