Class {
	#name : #MOAngularComponentBehaviorWriter,
	#superclass : #Object,
	#instVars : [
		'behavior'
	],
	#category : #'Moxing-Angular-Writting'
}

{ #category : #accessing }
MOAngularComponentBehaviorWriter >> behavior [
	^ behavior
]

{ #category : #visiting }
MOAngularComponentBehaviorWriter >> visitCSNPage: aJinCasinoPage [
	behavior := MOClass new.
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
			(MOMethod new
				selector: 'ngOnInit';
				setOwnerClass: behavior;
				type: MOTypescriptPrebuiltTypeReferenceFactory default void).
	behavior
		addMethod:
			(MOMethod new
				selector: 'ngOnDestroy';
				setOwnerClass: behavior;
				type: MOTypescriptPrebuiltTypeReferenceFactory default void).
	behavior := MOAngularTransientComponentBehavior new
		angularModel: behavior;
		yourself.
	aJinCasinoPage attributes do: [ :a | a accept: self ]
]

{ #category : #'as yet unclassified' }
MOAngularComponentBehaviorWriter >> visitDataBinding: aMODataBindingAttribute [
	behavior angularModel
		addProperty:
			(MOVariable new
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
