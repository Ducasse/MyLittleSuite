Class {
	#name : #CrTodoListTest,
	#superclass : #TestCase,
	#category : #'MyLittleSuite-Todo-Crono-Tests'
}

{ #category : #tests }
CrTodoListTest >> testArchive [
	| list task |

	task := MlCrTodoTask new
		name: 'Test';
		notes: 'Test';
		done: false;
		yourself.

	list := MlTodoList newName: 'Test List'. 
	list addAndSaveTask: task.
	
	self deny: list isArchived.
	self deny: task isArchived.
	
	list archive.
	
	self assert: list isArchived.
	self assert: task isArchived
]

{ #category : #tests }
CrTodoListTest >> testMoveTaskTo [
	| task list1 list2 |

	task := MlCrTodoTask new
		name: 'Test';
		notes: 'Test';
		done: false;
		yourself.

	list1 := MlTodoList newName: 'List 1'.
	list2 := MlTodoList newName: 'List 2'.
	
	list1 addTask: task.
	self assert: task owner equals: list1.
	
	list1 moveTask: task to: list2.
		
	self assert: list1 tasks isEmpty.
	self assert: list2 tasks first equals: task.
	"self assert: MlCrTodoTask selectAll anyOne equals: task."
	self assert: task owner equals: list2
]

{ #category : #tests }
CrTodoListTest >> testRemove [
	<skip>
	| list task |
	self skip.
	task := MlCrTodoTask new
		name: 'Test';
		notes: 'Test';
		done: false;
		yourself.

	list := MlTodoList newName: 'Test List'. 
	list addTask: task.
	list remove.
	self halt.
	"self assert: MlTodoList allInstances size equals: 2.
	self assert: MlCrTodoTask allInstances isEmpty."
]

{ #category : #tests }
CrTodoListTest >> testUnarchive [
	| list task |
	task := MlCrTodoTask new
		name: 'Test';
		notes: 'Test';
		done: false;
		yourself.

	list := MlTodoList newName: 'Test List'.
	list addTask: task.
	list archive.	
	
	self assert: list isArchived.
	self assert: task isArchived.
	
	list unarchive. 
	
	self deny: list isArchived.
	self deny: task isArchived
]
