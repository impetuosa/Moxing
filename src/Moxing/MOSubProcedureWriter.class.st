"
I build procedures and allow to add the same as my parent
"
Class {
	#name : #MOSubProcedureWriter,
	#superclass : #MOInvocableWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOSubProcedureWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitProcedureWriter: self 


]

{ #category : #accessing }
MOSubProcedureWriter >> bindingKind: aString [ 
	 writeBuilder bindingKind: aString 
]

{ #category : #writing }
MOSubProcedureWriter >> initializeWriteBuilder [

	writeBuilder := builder procedureBuilder
]

{ #category : #writing }
MOSubProcedureWriter >> privateWriteToSurface: anEntity [
	surface addProcedure: anEntity
]

{ #category : #writing }
MOSubProcedureWriter >> selector: aSelector [
 	writeBuilder selector: aSelector
]

{ #category : #writing }
MOSubProcedureWriter >> setDynamicBinding [

	writeBuilder setDynamicBinding
]

{ #category : #writing }
MOSubProcedureWriter >> setStaticBinding [

	writeBuilder setStaticBinding
]
