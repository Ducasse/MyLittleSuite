Class {
	#name : #MlsTObjectUpdaterTest,
	#superclass : #TestCase,
	#category : #'MyLittleSuite-Todo-Updater'
}

{ #category : #tests }
MlsTObjectUpdaterTest >> testMigrateChange [

	| updater toMigrate value1Before value2Before |
	updater := MlsTObjectUpdater new. 
	toMigrate :=	 MlsObjectNoChange new.
	toMigrate value1: 12.		
	value1Before := toMigrate value1. 
	value2Before := toMigrate value2. 
	updater migrate: toMigrate.
	self assert: value1Before equals: toMigrate value1.
	self deny: value2Before equals: toMigrate value2.
		
]

{ #category : #tests }
MlsTObjectUpdaterTest >> testMigrateNoChange [

	| updater toMigrate value1Before value2Before |
	updater := MlsTObjectUpdater new. 
	toMigrate :=	 MlsObjectNoChange new.
	toMigrate value1: 12.
	toMigrate value2: true.	
		
		
	value1Before := toMigrate value1. 
	value2Before := toMigrate value2. 
	updater migrate: toMigrate.
	self assert: value1Before equals: toMigrate value1.
	self assert: value2Before equals: toMigrate value2.
		
]

{ #category : #tests }
MlsTObjectUpdaterTest >> testMigrateRename [

	| updater toMigrate value1Before value2Before migrated |
	updater := MlsTObjectUpdater new. 
	updater newClass: MlsObjectRenamedChange.
		"I'm forced to specify a different class. In reality the class will have changed."
	updater rename: { #value1 -> #value11 . #value2 -> #value22 }.
	toMigrate :=	 MlsObjectRenamedChange new.
	toMigrate value1: 12.
	toMigrate value2: true.	
		
		
	value1Before := toMigrate value1. 
	value2Before := toMigrate value2. 
	migrated := updater migrate: toMigrate.
	self assert: value1Before equals: toMigrate value1.
	self assert: value2Before equals: toMigrate value2.
		
]
