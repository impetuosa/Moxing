Class {
	#name : #MOCommentWriter,
	#superclass : #MOStatementWriter,
	#instVars : [
		'#statement => MOContainmentSlot one'
	],
	#category : #'Moxing-MicroWriters'
}

{ #category : #initialization }
MOCommentWriter >> build [

	| entity |

	entity := self writerBuilder build.
	self installFromTo: entity.
	^ entity
]

{ #category : #initialization }
MOCommentWriter >> initialize [
	
	self class initializeSlots: self.
	super initialize.
]

{ #category : #initialization }
MOCommentWriter >> initializeWriteBuilder [ 
	writeBuilder := builder commentBuilder
]

{ #category : #initialization }
MOCommentWriter >> registerStatement: aStatement [
	writeBuilder statement: aStatement.

]
