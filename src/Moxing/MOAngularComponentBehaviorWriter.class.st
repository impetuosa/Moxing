Class {
	#name : #MOAngularComponentBehaviorWriter,
	#superclass : #Object,
	#instVars : [
		'typescriptWriter',
		'behavior'
	],
	#category : #Moxing
}

{ #category : #accessing }
MOAngularComponentBehaviorWriter >> behavior [
	^ behavior
]

{ #category : #visiting }
MOAngularComponentBehaviorWriter >> visitCSNPage: aJinCasinoPage [

	behavior := JinTypescriptClass new.
	behavior name: aJinCasinoPage name.
	behavior implements: { 
			(JinTypescriptTypeReference new
				 name: #OnInit;
				 yourself).
			(JinTypescriptTypeReference new
				 name: #OnDestroy;
				 yourself) }.
	behavior decorator: JinTypescriptDecorator new.
	behavior decorator name: 'Component'.
	behavior decorator attributes at: #selector put: aJinCasinoPage name.
	behavior decorator attributes
		at: #template
		put: './' , aJinCasinoPage name , '.component.html'.
	behavior addMethod: (JinTypescriptMethod new
			 selector: 'ngOnInit';
			 setOwnerClass: behavior;
			 type: (JinTypescriptTypeReference new
					  name: #void;
					  yourself)).
	behavior addMethod: (JinTypescriptMethod new
			 selector: 'ngOnDestroy';
			 setOwnerClass: behavior;
			 type: (JinTypescriptTypeReference new
					  name: #void;
					  yourself)).
	behavior := MOAngularProtoComponentBehavior new
		            angularModel: behavior;
		            yourself
]

{ #category : #writing }
MOAngularComponentBehaviorWriter >> writeBehaviorFor: aJinCasinoPage into: component [

	self assert: typescriptWriter isNil.
	typescriptWriter := MOTypescriptWriter new .
	aJinCasinoPage accept: self.
	component behavior: self behavior.
]
