"
```
TodoApplication new run.
```
"
Class {
	#name : #MlsSimpleTaskListPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'todoListPresenter',
		'addButton'
	],
	#category : #'MyLittleSuite-Todo-UI'
}

{ #category : #'instance creation' }
MlsSimpleTaskListPresenter class >> open [ 
	<script>
	self new open
]

{ #category : #actions }
MlsSimpleTaskListPresenter >> addTask [

	(MlsTaskSimplePresenter newApplication: self application) 
		task: MlsTask new;
		openModal.
	self updatePresenter
]

{ #category : #initialization }
MlsSimpleTaskListPresenter >> db [

	^ MlsTaskDB uniqueInstance
]

{ #category : #layout }
MlsSimpleTaskListPresenter >> defaultLayout [ 
	
	^ (SpBoxLayout newTopToBottom 
		add: todoListPresenter;
		add: (SpBoxLayout newLeftToRight
				addLast: addButton expand: false;
				yourself) 
		expand: false;
		yourself)
]

{ #category : #actions }
MlsSimpleTaskListPresenter >> editSelectedTask [

	(MlsTaskSimplePresenter newApplication: self application)
		task: todoListPresenter selection selectedItem;
		openModal.
	"I do not really like to flush all the items and get them all once again."
	self updatePresenter
]

{ #category : #initialization }
MlsSimpleTaskListPresenter >> initializePresenters [

	todoListPresenter := self newTable
		                     addColumn:
			                     ((SpCheckBoxTableColumn evaluated: [ :task | 
					                       task isDone ])
				                      width: 20;
				                      onActivation: [ :task | task done: true ];
				                      onDeactivation: [ :task | task done: false ];
				                      yourself);
		                     addColumn:
		                     (SpStringTableColumn
			                      title: 'Title'
			                      evaluated: [ :task | task title ]);	
		                     yourself.
	todoListPresenter contextMenu: self todoListContextMenu.
	
	addButton := self newButton
		             label: 'Add task';
		             action: [ self addTask ];
		             yourself
]

{ #category : #initialization }
MlsSimpleTaskListPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter 
		title: 'Todo List';
		initialExtent: 500@500
]

{ #category : #actions }
MlsSimpleTaskListPresenter >> removeSelectedTask [

	todoListPresenter selection selectedItem delete.
	self updatePresenter
]

{ #category : #menu }
MlsSimpleTaskListPresenter >> todoListContextMenu [

	^ self newMenu 
		addItem: [ :item | item 
						name: 'Edit...'; 
						action: [ self editSelectedTask ] ];
		addItem: [ :item | item 
						name: 'Remove'; 
						action: [ self removeSelectedTask ] ]
]

{ #category : #actions }
MlsSimpleTaskListPresenter >> updatePresenter [
	todoListPresenter items: self db tasks
]
