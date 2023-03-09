Class {
	#name : #MlListVisitor,
	#superclass : #Object,
	#category : #'MyLittleSuite-Todo-Crono'
}

{ #category : #'as yet unclassified' }
MlListVisitor >> visit: aList [ 
	
	^ aList accept: self
]

{ #category : #visiting }
MlListVisitor >> visitArchiveList: aList [

	^ self visitGenericList: aList
]

{ #category : #visiting }
MlListVisitor >> visitFocusList: aList [

	^ self visitGenericList: aList
]

{ #category : #visiting }
MlListVisitor >> visitGenericList: aList [

	^ nil
]

{ #category : #visiting }
MlListVisitor >> visitSearchList: aList [

	^ self visitGenericList: aList
]

{ #category : #visiting }
MlListVisitor >> visitTodoList: aList [

	^ self visitGenericList: aList
]

{ #category : #visiting }
MlListVisitor >> visitVirtualList: aList [

	^ self visitGenericList: aList
]
