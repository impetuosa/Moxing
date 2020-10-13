Class {
	#name : #MOAngularPrebuiltMethodFactory,
	#superclass : #Object,
	#category : #'Moxing-CodeWritingTypescript'
}

{ #category : #'as yet unclassified' }
MOAngularPrebuiltMethodFactory >> addElementsMethod: aType url: anUrlVariable [
	| method |
	method := MOTypescriptTemplatedMethod new
		selector: ('add{1}' format: {aType});
		addParameter:
			(MOTypescriptVariable new
				name: 'object';
				type:
					(MOTypescriptTypeReference new
						name: aType;
						yourself));
		body:
			('
  return this.http.post<{1}>(this.{2}, object, this.httpOptions).pipe(
		catchError(this.handleError<{1}>("add{1}"))
  );
'
				format:
					{aType.
					anUrlVariable});
		type: (self observable: aType).
	^ method
]

{ #category : #'as yet unclassified' }
MOAngularPrebuiltMethodFactory >> deleteElementsMethod: aType url: anUrlVariable [
	| method |
	method := MOTypescriptTemplatedMethod new
		selector: ('delete{1}' format: {aType});
		addParameter:
			(MOTypescriptVariable new
				name: 'object';
				type:
					(MOTypescriptTypeReference new
						name: aType;
						yourself));
		body:
			(' 
 const id = object.getId();
 const url = `$\{this.{2}\}/$\{id\}`;
 return this.http.delete<{1}>(url, object, this.httpOptions).pipe(
     catchError(this.handleError<{1}>("delete{1}"))
 );
			'
				format:
					{aType.
					anUrlVariable});
		type: (self observable: aType).
	^ method
]

{ #category : #'as yet unclassified' }
MOAngularPrebuiltMethodFactory >> editElementsMethod: aType url: anUrlVariable [
	| method |
	method := MOTypescriptTemplatedMethod new
		selector: ('update{1}' format: {aType});
		addParameter:
			(MOTypescriptVariable new
				name: 'object';
				type:
					(MOTypescriptTypeReference new
						name: aType;
						yourself));
		body:
			(' 
return this.http.put(this.{2}, object, this.httpOptions).pipe(
  catchError(this.handleError<any>("update{1}"))
);'
				format:
					{aType.
					anUrlVariable});
		type: self observableAny.
	^ method
]

{ #category : #'as yet unclassified' }
MOAngularPrebuiltMethodFactory >> filterElementsMethod: aType url: anUrlVariable [
	| method |
	method := MOTypescriptTemplatedMethod new
		selector: ('search{1}' format: {aType});
		addParameter:
			(MOTypescriptVariable new
				name: 'filter';
				type:
					(MOTypescriptTypeReference new
						name: 'string';
						yourself));
		body:
			(' 
if (!filter.trim()) \{
   return of([]);
\}
return this.http.get<{1}[]>(`$\{this.{2}\}/?filter=$\{filter\}`).pipe(
  catchError(this.handleError<{1}[]>("search{1}", []))
);
			'
				format:
					{aType.
					anUrlVariable});
		type: (self observableArrayOf: aType).
	^ method
]

{ #category : #'as yet unclassified' }
MOAngularPrebuiltMethodFactory >> getElementsMethod: aType url: anUrlVariable [
	| obtainElementsMethod |
	obtainElementsMethod := MOTypescriptTemplatedMethod new
		selector: ('getAll{1}' format: {aType});
		body:
			(' 
return this.http.get<{1}[]>(this.{2}).pipe(
   catchError(this.handleError<{1}[]>("getAll{1}", []))
);'
				format:
					{aType.
					anUrlVariable});
		type: (self observableArrayOf: aType).
	^ obtainElementsMethod
]

{ #category : #'as yet unclassified' }
MOAngularPrebuiltMethodFactory >> observable: aType [
	^ MOTypescriptPrebuiltTypeFactory default observable: aType
]

{ #category : #'as yet unclassified' }
MOAngularPrebuiltMethodFactory >> observableAny [
	^ MOTypescriptPrebuiltTypeFactory default observableAny
]

{ #category : #'as yet unclassified' }
MOAngularPrebuiltMethodFactory >> observableArrayOf: aType [
	^ MOTypescriptPrebuiltTypeFactory default observableArrayOf: aType
]
