"
Moxing is model implemented responding to the modelling discussions contributed by the thesis of Santiago Bragagnolo [https://hal.science/tel-04132315v1](https://hal.science/tel-04132315v1).

Moxing is an Heterogeneous Unified Meta-Models (HUMM) with the computational representation known as Abstract Semantic Graph (ASG).

## Modelling 
 A heterogeneous meta-model represents common concepts only once, allowing developers to define unique extensions for each language
### ASG 

Let us suppose the factorial function. 

Visual Basic Applications version 
```vba
Function factorial (i as Integer) as Integer
 If i = 0 Then
 return 1
 Else
 return i * (factorial( i - 1))
 End If
 End Function
```

Java version
```java
Class MyClass {
 static int factorial (int i) {
 if (i == 0) {
 return 1
 } else {
 return i * (MyClass.factorial( i − 1))
 }
}
```

Given these two pieces of code, we can consider the figures:
 1- ASG of the VBA version of the source code.
![ASG-VBA](https://github.com/impetuosa/Jindao/blob/master/figures/asg-vba.jpg?raw=true).
 2- ASG of the Java version of the source code. 
![ASG-JAVA](https://github.com/impetuosa/Jindao/blob/master/figures/asg-java.jpg?raw=true).

 Both ASGs are highly similar. Each node in the graph
is represented as a box; its composition is represented by including a box inside
another box. Each pattern used for drawing the box indicates a different kind of
object in terms of role. The only arrows drawn are the ones that turn it into an ASG.



### Concepts 
The basic structuring concepts From a grammatical and syntactical point of
view, we often find three main concepts: Declarations, Statements and Expressions.

A **Declaration** is any construction that structures and names an artefact. e.g. Type, Class, Module, Function, etc. 

A **Statement** is any construction that structures and carry on some behaviour. e.g. control flow structures such as if, while, etc. 

An **Expression** is any construction that carries out some behaviour and yields a value. e.g. Assignment, built-in operators, primitive call, function invocations, etc.

Since we add the linking dimension to jump into ASG structure, we take into
account a fourth concept: the Reference.

A **Reference** is any construction that refers to some artefact defined elsewhere.
e.g. Function invocation, message-send, typed variable declarations, etc. In contrast with the reference, we add Grammatical, any construction that bases its behaviour on its grammatical structure instead of a referred artefact.

In this meta-model, we find each of these core elements. 
All the core elements inherit from LanguageObject. LanguageObject class defines default
behaviours and minimal structures: All entities in our model have a parent and
a language. The parent indicates where the node was declared. It reinforces the
hierarchical nature of our structure. The language is used to declare the element’s
language and is used by the element as an oracle to know if a relation between this
and another object is incorrect.

We also find the meta-model entities required to represent the
factorial ASG in Java and Microsoft Access. We observe that a large majority of
meta-model entities are used for both languages, but some of the entities are only
used in one language.

### Relations 
In our model, we typify the relations to understand the nature of the relation between concepts. We recognise seven kinds of relations: Parent, Declares, States, Express, Refers, Referee and Property. None of these relations entangles any static typing.

**Parent** This relation is expected to relate an object with the object where the
first exists: defined, declared, used, etc. For example, a method can have a class as
a parent. A binary expression is the parent of the left-hand and right-hand expressions.

**Declares** Describes the relation between a “declarer” entity (often a declaration
that works as scope) and a “declared” entity. A class declares methods. It is the
opposite relation to the parent relation.

**States** Describes the relation between a “stating” entity (often a declaration that
works as scope) and a “stated” entity. A function states a while statement. It is the
opposite relation to the parent relation.

**Expresses** Describes the relationship between an “expressing” entity and an
“expressed” entity. e.g. an “if statement” expresses a condition. It is the opposite
relation to the parent relation.

**Refers** Describes the relation between a “referrer” entity and a “referring” entity. A variable declaration refers to a type reference.

**Referee** Describes the relation between a “referring” entity and a “referred”
entity. A type reference “referee” a type. A function invokation “referee” a function.

**Property** Describes the relation between an entity and any other terminal object.
e.g. A class has a property “name” with the name of the class. A function has a
selector.


## Languages

The current state of the Moxing model covers all code in Microsoft Access.
An almost complete cover of the Java language. 
A complete cover of the smalltalk languages Pharo and Cincom Visual Works. 
A reduced cover of Typescript and Angular framework.


## Main features

Moxing is a relation based model, where the relations are probably the most important concept. 

Moxing provides a complete suit of writers and builders that allow to write and build models. 

Moxing also provides copy mechanisms, which allows to regenerate a part of a source model within a specific target model enitity. 


## Importers 

Moxing currently has few importers:

 * JinDAM importer for importing Microsoft Access projects (MOJinDAMImporter).
 * Maven-Java importer for importing Java maven managed projects (MOJavaMavenProjectLoader).
 * Chunk-Visualworks importer for importing packages extracted in chunck format from Visual Works (MOVisualWorksChunkImporter).
 * Pharo reflective API importer for importing packages defined in the Pharo running image (MORBPharoImporter). 
 * Angular Typescript importer for importing projects defined with Angular and Typescript projects (MOAngularLoader) .





































"
Class {
	#name : #MoxingManifest,
	#superclass : #PackageManifest,
	#classInstVars : [
		'northwindSymbolTable'
	],
	#category : #'Moxing-Manifest'
}

{ #category : #'5- Copy models' }
MoxingManifest class >> exampleCopySimpleModel [
	<example>
]

{ #category : #'4- Create and Modify Models' }
MoxingManifest class >> exampleHandUpdateSimpleModel [
	<example>
]

{ #category : #'4- Create and Modify Models' }
MoxingManifest class >> exampleHandWriteSimpleModel [
	<example>
]

{ #category : #'2- Loading Examples' }
MoxingManifest class >> exampleLoadAngularTsSimpleProject [
	<example>
]

{ #category : #'2- Loading Examples' }
MoxingManifest class >> exampleLoadJavaMavenProject [
	<example>
]

{ #category : #'2- Loading Examples' }
MoxingManifest class >> exampleLoadNorthwind [

	<example>
	| dam moxing importer |
	
	"1- To load a Microsoft Access project into a Moxing model we need a DAM model. "
	dam := self northwindDAM.
	
	"2- Instanciate an DAM importer. "
	importer := MOJinDAMImporter new.

	"3- Create an instance of a MOModel, configured to deal with Microsoft Access language details . "
	moxing := MOModel newMicrosoftAccess.

	moxing name: #Northwind. 

	"4- Configure the importer with the model to use for importing. "
	importer model: moxing.

	"5- Import the DAM model. "
	importer import: dam.

	"6- Now the model is filled up with the Northwind project information. "
	moxing inspect.
	
	^ moxing
]

{ #category : #'2- Loading Examples' }
MoxingManifest class >> exampleLoadPharoProject [
	<example>
]

{ #category : #'2- Loading Examples' }
MoxingManifest class >> exampleLoadVisualWorksProject [
	<example>
]

{ #category : #'3- Tranverse Relations' }
MoxingManifest class >> exampleTransverseRelations [
	<example> 
]

{ #category : #'2- Loading Examples' }
MoxingManifest class >> importNorthwindSymbolTable [

	^ northwindSymbolTable ifNil: [ 
		  northwindSymbolTable := JinNamespacesManifest nortwindSymbolTable ]
]

{ #category : #'1- Load' }
MoxingManifest class >> loadAddBaseline [

	<load>
	| spec |
	spec
		baseline: 'Moxing'
		with: [ 
		spec repository: 'github://impetuosa/Moxing:v1.x.x/src' ]
]

{ #category : #'1- Load' }
MoxingManifest class >> loadMetacello [

	<load>
	  Metacello new
    	githubUser: 'Impetuosa' project: 'Moxing' commitish: 'v1.x.x' path: 'src';
    	baseline: 'Moxing';
    	onWarningLog;
    	load
	

]

{ #category : #'2- Loading Examples' }
MoxingManifest class >> northwindDAM [

	| importer path dam |
	" Create symbol table "
	self importNorthwindSymbolTable.

	" 
	
	This importer is configured to load all the structure of the project. 
	It also imports all the syntactical elements, representing all the written code. 
	It also imports all the forms/reports objects, storing all the configuration properties.
	
"
	importer := JinDAMImporter new.
	importer provider
		importAccessReferences;
		importDatabase;
		importProjectElements;
		importGUIElements;
		importGUIControlElements;
		importCodeElements;
		importAllSyntacticElements;
		importLibraryReferences.


	path := self northwindPath.

	" 
	The importer requires a symbol table previously calculated. 
"
	dam := importer
		       import: path asFileReference
		       symbolTable: northwindSymbolTable.

	" 
	The imported model is not yet linked. i.e. connects all the calls to the methods or functions.
"
	importer link: dam.
	^ dam
]

{ #category : #'2- Loading Examples' }
MoxingManifest class >> northwindPath [

	^ JindaoManifest northwind
]
