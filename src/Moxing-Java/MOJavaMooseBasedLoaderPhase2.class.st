Class {
	#name : #MOJavaMooseBasedLoaderPhase2,
	#superclass : #MOJavaMooseBasedLoader,
	#category : #'Moxing-Java-Loader'
}

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> mapping: aMapping [

	mapping := aMapping
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> visitAnnotationInstance: aFamixJavaAnnotationInstance [

	(mapping at: aFamixJavaAnnotationInstance annotatedEntity) 
		addAnnotation:
		(mapping at: aFamixJavaAnnotationInstance annotationType)
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> visitAttribute: aFamixJavaAttribute [

	| var |
	var := self instantiate: MOVariable for: aFamixJavaAttribute.
	var name: aFamixJavaAttribute name.
	aFamixJavaAttribute declaredType ifNotNil: [ 
		var type: (mapping at: aFamixJavaAttribute declaredType) ].
	self withTop: [ :t | 
		t addVariable: var.
		var anchor: t anchor / #variables / var name ]
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> visitClass: aFamixJavaClass [

	| class |
	class := mapping at: aFamixJavaClass.

	self push: class during: [ 
		self visitCollection: aFamixJavaClass attributes.
		self visitCollection: aFamixJavaClass methods.
		self visitCollection: aFamixJavaClass annotationInstances ]
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> visitLocalVariable: aFamixJavaLocalVariable [ 
	self visitAttribute: aFamixJavaLocalVariable 
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> visitMethod: aFamixJavaMethod [

	| method |
	method := self instantiate: MOMethod for: aFamixJavaMethod.
	method block:
		(self instantiate: MOBlock for: aFamixJavaMethod localVariables).
	method selector: aFamixJavaMethod name.
	self withTop: [ :t | 
		t addMethod: method.
		method anchor: t anchor / #methods / method selector ].
	self push: method during: [ 
		self visitCollection: aFamixJavaMethod parameters.
		self visitCollection: aFamixJavaMethod localVariables ]
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> visitMooseModel: aFamixJavaModel [
	(aFamixJavaModel allNamespaces select: [ :a | 
		 a parentNamespace isNil ]) do: [ :d | d accept: self ].
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> visitNamespace: aFamixJavaNamespace [

	| pack |
	pack := mapping at: aFamixJavaNamespace.
	self push: pack during: [ 
		self visitCollection: aFamixJavaNamespace childNamespaces.
		self visitCollection: aFamixJavaNamespace types ]
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> visitParameterizedType: aFamixJavaParameterizedType [

	| class |
	class := mapping at: aFamixJavaParameterizedType.

	self push: class during: [ 
		self visitCollection: aFamixJavaParameterizedType methods.
		self visitCollection:
			aFamixJavaParameterizedType annotationInstances ]
]
