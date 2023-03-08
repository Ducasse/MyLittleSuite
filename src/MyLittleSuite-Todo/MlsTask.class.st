Class {
	#name : #MlsTask,
	#superclass : #Object,
	#instVars : [
		'done',
		'title',
		'description',
		'doneDate',
		'dueDate',
		'isPending'
	],
	#classVars : [
		'UndeterminedDate'
	],
	#classInstVars : [
		'tasks'
	],
	#category : #'MyLittleSuite-Todo-Model'
}

{ #category : #saving }
MlsTask >> db [ 

	^ MlsTaskDB uniqueInstance
]

{ #category : #saving }
MlsTask >> declareTask [

	self db addTask: self
]

{ #category : #saving }
MlsTask >> delete [

	self db deleteTask: self
]

{ #category : #accessing }
MlsTask >> description [

	^ description
]

{ #category : #accessing }
MlsTask >> description: anObject [

	description := anObject
]

{ #category : #accessing }
MlsTask >> done [

	^ done
]

{ #category : #accessing }
MlsTask >> done: aBoolean [

	done := aBoolean.
	aBoolean ifTrue: [ self doneDate: Date today ]
]

{ #category : #accessing }
MlsTask >> doneDate [

	^ doneDate
]

{ #category : #accessing }
MlsTask >> doneDate: anObject [

	doneDate := anObject
]

{ #category : #accessing }
MlsTask >> dueDate [

	^ dueDate
]

{ #category : #accessing }
MlsTask >> dueDate: anObject [

	dueDate := anObject
]

{ #category : #initialization }
MlsTask >> initialize [

	super initialize.
	self done: false.
	self title: 'Please give me a title'
]

{ #category : #testing }
MlsTask >> isDone [

	^ self done
]

{ #category : #accessing }
MlsTask >> isPending [
	"a pending task is one that is not done yet but got started"
	
	^ isPending
]

{ #category : #printing }
MlsTask >> printOn: aStream [

	aStream nextPutAll: 'Task'.
	aStream space nextPutAll: self title.
	done ifTrue: [ aStream space nextPutAll: '[done]' ]
]

{ #category : #accessing }
MlsTask >> setAsPending [
	"a pending task is one that is not done yet but got started.
	In the future we should certainly unified done and pending into a kind of more 
	powerful state"
	
	isPending := true
]

{ #category : #accessing }
MlsTask >> title [

	^ title
]

{ #category : #accessing }
MlsTask >> title: anObject [

	title := anObject
]
