Class {
	#name : #MOGlobalConstant,
	#superclass : #MOGlobalVariable,
	#instVars : [
		'#value => MOExpressesSlot one'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOGlobalConstant >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitGlobalConstant: self
]

{ #category : #visiting }
MOGlobalConstant >> canBeReferredAsConstant [
	 ^ true 
]

{ #category : #visiting }
MOGlobalConstant >> kindString [

	^ 'GLOBAL CONST'
]

{ #category : #visiting }
MOGlobalConstant >> value [

	^ value
]

{ #category : #visiting }
MOGlobalConstant >> value: aValue [
 	 value := aValue 
]
