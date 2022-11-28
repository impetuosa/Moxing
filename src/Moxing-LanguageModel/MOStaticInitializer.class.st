Class {
	#name : #MOStaticInitializer,
	#superclass : #MOInvocable,
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOStaticInitializer >> acceptVisitor: aMOModelVariableResolver [

	^ aMOModelVariableResolver visitStaticInitializer: self
]
