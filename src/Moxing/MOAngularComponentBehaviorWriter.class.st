Class {
	#name : #MOAngularComponentBehaviorWriter,
	#superclass : #Object,
	#instVars : [
		'behavior'
	],
	#category : #'Moxing-CodeWritingTypescript'
}

{ #category : #accessing }
MOAngularComponentBehaviorWriter >> behavior [
	^ behavior
]

{ #category : #visiting }
MOAngularComponentBehaviorWriter >> visitCSNPage: aJinCasinoPage [
	behavior := MOTypescriptClass new.
	behavior name: aJinCasinoPage name .
	behavior
		implements:
			{MOTypescriptPrebuiltTypeReferenceFactory default onInit.
			MOTypescriptPrebuiltTypeReferenceFactory default onDestroy}.
	behavior
		decorator: MOTypescriptPrebuiltTypeReferenceFactory default component.
	behavior decorator attributes at: #selector put: aJinCasinoPage name asLowercase.
	behavior decorator attributes
		at: #templateUrl
		put: './' , aJinCasinoPage name asLowercase , '.component.html'.
	behavior
		addMethod:
			(MOTypescriptMethod new
				selector: 'ngOnInit';
				setOwnerClass: behavior;
				type: MOTypescriptPrebuiltTypeReferenceFactory default void).
	behavior
		addMethod:
			(MOTypescriptMethod new
				selector: 'ngOnDestroy';
				setOwnerClass: behavior;
				type: MOTypescriptPrebuiltTypeReferenceFactory default void).
	behavior := MOAngularProtoComponentBehavior new
		angularModel: behavior;
		yourself.
	aJinCasinoPage attributes do: [ :a | a accept: self ]
]

{ #category : #'as yet unclassified' }
MOAngularComponentBehaviorWriter >> visitDataBinding: aMODataBindingAttribute [
	behavior angularModel
		addProperty:
			(MOTypescriptVariable new
				name: aMODataBindingAttribute binding entity compilableIdentifier;
				type:
					(MOTypescriptPrebuiltTypeReferenceFactory default
						typeReference: aMODataBindingAttribute binding entity compilableTypeIdentifier
						definedAt: './' , aMODataBindingAttribute binding entity compilableIdentifier))
]

{ #category : #writing }
MOAngularComponentBehaviorWriter >> writeBehaviorFor: aJinCasinoPage into: component [
	aJinCasinoPage accept: self.
	component behavior: self behavior.
]
