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
		'addButton',
		'saveButton',
		'toolbarPresenter'
	],
	#category : #'MyLittleSuite-Todo-UI'
}

{ #category : #'instance creation' }
MlsSimpleTaskListPresenter class >> open [ 
	<script>
	self new open
]

{ #category : #toolbar }
MlsSimpleTaskListPresenter >> addButton [

	^ SpToolbarButtonPresenter new
		  icon: (self iconNamed: #smallOk);
		  label: 'New Task';
		  action: [ self addTask ];
		  yourself
]

{ #category : #actions }
MlsSimpleTaskListPresenter >> addTask [

	(MlsTaskSimplePresenter newApplication: self application) 
		task: MlsTask new;
		openModal.
	self updatePresenter
]

{ #category : #toolbar }
MlsSimpleTaskListPresenter >> buildToolbar [

	^ self newPresenter
		layout: (SpBoxLayout newLeftToRight
			add: (self newTaskToolbar add: self addButton ;yourself)  expand: false;
			addLast: (self newTaskToolbar add: self settingButton; yourself) expand: false;
			yourself);
		yourself
]

{ #category : #initialization }
MlsSimpleTaskListPresenter >> db [

	^ MlsTaskDB uniqueInstance
]

{ #category : #layout }
MlsSimpleTaskListPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: toolbarPresenter expand: false ;
		  add: todoListPresenter;
		  add: (SpBoxLayout newLeftToRight
				   addLast: addButton expand: false;
				   addLast: saveButton expand: false;
				   yourself)
		  expand: false;
		  yourself
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

   toolbarPresenter := self buildToolbar.
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
	"todoListPresenter 
		searchMatching: [  ]."

	addButton := self newButton
		             label: 'Add task';
		             action: [ self addTask ];
		             yourself.
	saveButton := self newButton
		              label: 'Save';
		              action: [ self save ];
		              yourself
]

{ #category : #initialization }
MlsSimpleTaskListPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter 
		title: 'Todo List';
		initialExtent: 500@500
]

{ #category : #toolbar }
MlsSimpleTaskListPresenter >> newTaskToolbar [

	^ self newToolbar
		addStyle: 'compact';
		yourself
]

{ #category : #actions }
MlsSimpleTaskListPresenter >> removeSelectedTask [

	todoListPresenter selection selectedItem delete.
	self updatePresenter
]

{ #category : #actions }
MlsSimpleTaskListPresenter >> save [

	MlsIOManager new saveTasks
]

{ #category : #toolbar }
MlsSimpleTaskListPresenter >> settingButton [

	^ SpToolbarButtonPresenter new
		  icon: (self iconNamed: #smallOk);
		  label: 'Settings';
		  action: [ SettingBrowser new 
			              changePackageSet: { #'MyLittleSuite-Todo' asPackage};
		                 open ];
		  yourself
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
	| items |
	items := self db tasks.
	todoListPresenter items: items.
	todoListPresenter selectFirst.
	"items ifNotEmpty: [  
		todoListPresenter selectItem: items last ]"

]
