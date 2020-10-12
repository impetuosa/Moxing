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
	behavior name: aJinCasinoPage name.
	behavior implements: { 
			(MOTypescriptTypeReference new
				 name: #OnInit;
				 yourself).
			(MOTypescriptTypeReference new
				 name: #OnDestroy;
				 yourself) }.
	behavior decorator: MOTypescriptDecorator new.
	behavior decorator name: 'Component'.
	behavior decorator attributes at: #selector put: aJinCasinoPage name.
	behavior decorator attributes
		at: #template
		put: './' , aJinCasinoPage name , '.component.html'.
	
	behavior addMethod: (MOTypescriptMethod new
			 selector: 'ngOnInit';
			 setOwnerClass: behavior;
			 type: (MOTypescriptTypeReference new
					  name: #void;
					  yourself)).
	behavior addMethod: (MOTypescriptMethod new
			 selector: 'ngOnDestroy';
			 setOwnerClass: behavior;
			 type: (MOTypescriptTypeReference new
					  name: #void;
					  yourself)).
					
	behavior := MOAngularProtoComponentBehavior new
		            angularModel: behavior;
		            yourself.
	
	aJinCasinoPage attributes do: [ :a | a accept: self  ].
	
]

{ #category : #'as yet unclassified' }
MOAngularComponentBehaviorWriter >> visitDataBinding: aMODataBindingAttribute [
	behavior angularModel
		addProperty:
			(MOTypescriptVariable new
				name: aMODataBindingAttribute binding entity compilableIdentifier;
				type:
					(MOTypescriptTypeReference new
						name: aMODataBindingAttribute binding entity compilableTypeIdentifier;
						yourself);
				yourself).
	behavior angularModel
		addImport:
			(MOTypescriptImport new
				types:
					{(MOTypescriptTypeReference new
						name: aMODataBindingAttribute binding entity compilableTypeIdentifier)};
				from:
					('../models/'
						, aMODataBindingAttribute binding entity compilableIdentifier)
						asFileReference;
				yourself)
]

{ #category : #writing }
MOAngularComponentBehaviorWriter >> writeBehaviorFor: aJinCasinoPage into: component [
	aJinCasinoPage accept: self.
	component behavior: self behavior.
]
