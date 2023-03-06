Class {
	#name : #MlsObjectNoChange,
	#superclass : #Object,
	#instVars : [
		'value1',
		'value2'
	],
	#category : #'MyLittleSuite-Todo-Updater'
}

{ #category : #initialization }
MlsObjectNoChange >> initializeValue1 [

	value1 := 421
]

{ #category : #initialization }
MlsObjectNoChange >> initializeValue2 [

	value2 := false
]

{ #category : #accessing }
MlsObjectNoChange >> value1 [
	^ value1
]

{ #category : #accessing }
MlsObjectNoChange >> value1: anInteger [ 
	value1 := anInteger
]

{ #category : #accessing }
MlsObjectNoChange >> value2 [
	^ value2
]

{ #category : #accessing }
MlsObjectNoChange >> value2: aBoolean [ 
	value2 := aBoolean
]
