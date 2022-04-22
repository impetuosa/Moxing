Class {
	#name : #MODecorator,
	#superclass : #MOAnnotationInstance,
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #accessing }
MODecorator >> acceptVisitor: aMOJavaModelReader [

	^ aMOJavaModelReader visitDecorator: self
]

{ #category : #accessing }
MODecorator >> isDecorator [
	 ^ true 
]
