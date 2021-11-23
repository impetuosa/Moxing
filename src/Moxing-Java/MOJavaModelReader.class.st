Class {
	#name : #MOJavaModelReader,
	#superclass : #MOModelReader,
	#category : #'Moxing-Java-Writer'
}

{ #category : #'meta-object-protocol' }
MOJavaModelReader >> instantiateLangAware: aClass [

	^ aClass newForJavaIn: model
]

{ #category : #'meta-object-protocol' }
MOJavaModelReader >> read: anEntity [

	read := anEntity acceptVisitor: self.



	mapper hasErrors ifTrue: [ 
		FylgjaMapWarning new
			mapper: mapper;
			signal ].
	^ read
]

{ #category : #visiting }
MOJavaModelReader >> visitAnnotation: aMOAnnotationInstance [

	| annotation |
	annotation := self
		              instantiate: MOAnnotationInstance
		              for: aMOAnnotationInstance
]

{ #category : #visiting }
MOJavaModelReader >> visitBlock: aMOBlock [

	| block |
	block := self instantiate: MOBlock for: aMOBlock.
	self
		push: block
		during: [ 
		block statements: (self visitCollection: aMOBlock statements) ].
	^ block
]

{ #category : #visiting }
MOJavaModelReader >> visitMethod: aMOMethod [

	| method |
	method := self instantiate: MOMethod for: aMOMethod.

	self push: method during: [ 
		method annotations: (self visitCollection: aMOMethod annotations).
		method parameters: (self visitCollection: aMOMethod parameters).
		method block: (aMOMethod block acceptVisitor: self).
		method selector: aMOMethod selector. 
		aMOMethod type ifNotNil: [ :type | 
			method type: (type acceptVisitor: self) ] ].
	^ method
]

{ #category : #visiting }
MOJavaModelReader >> visitMethodInvocation: aMOMethodInvocation [ 
	self shouldBeImplemented.
]

{ #category : #visiting }
MOJavaModelReader >> visitNewExpression: aMOAnnotationInstance [ 
	self shouldBeImplemented.
]

{ #category : #visiting }
MOJavaModelReader >> visitTypeReference: aMOTypeReference [

	^ mapper getReference: aMOTypeReference type from: aMOTypeReference
]

{ #category : #visiting }
MOJavaModelReader >> visitVariable: aMOVariable [

	| var |
	var := self instantiate: MOVariable for: aMOVariable.
	var name: aMOVariable name.
	aMOVariable typeReference ifNotNil: [ :type | 
		var typeReference: (type acceptVisitor: self) ].
	^ var
]
