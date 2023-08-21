# Moxing - API

## MOAnchor
I am an Anchor that mixes kind of entry and entry name.

### Properties
path
to
from

### Methods
#### MOAnchor>>/ aString
Returns a new anchor, adding a new fragment aString.



## MOCatalog
I am a catalog model.  A secondary model that do not link and that gets all the possible elements regarding the project that may be used and do not have yet any relation with the analyzed call .

### Properties
entities
anchor
name
language
broot

### Methods
#### MOCatalog>>saveAs: aString
Saves the catalog as STON file.



## MODeclarationStructuralRelation
Structural relation. I represent a relation: From, To and slot type. The slot type describes the kind of relation. 


### Properties
from
to
name
slot

### Methods
#### MODeclarationStructuralRelation>>to
returns the target (to) of the relationship.

#### MODeclarationStructuralRelation>>from: aMOAlias 
Sets the source (from) of the relationship.

#### MODeclarationStructuralRelation>>isToMany
Responds if the relations is to many or not.

#### MODeclarationStructuralRelation>>relationName
Relation name.

#### MODeclarationStructuralRelation>>write: anObject to: aDestination
Sets the given object into a destination.

#### MODeclarationStructuralRelation>>from: aFrom to: aTo 
sets the source (from) and target (to) of the relationship.

#### MODeclarationStructuralRelation>>isReference
Tests if the relation is a referential relation.

#### MODeclarationStructuralRelation>>from
Returns the source (from) of the relationship.

#### MODeclarationStructuralRelation>>isExpression
Tests if the relation is a expression relation.

#### MODeclarationStructuralRelation>>isContainment 
Tests if the relation is a declaration relation.

#### MODeclarationStructuralRelation>>read: aMOModelMethodBuilder
Reads the content from a gven object.

#### MODeclarationStructuralRelation>>to: aMOClass
sets the target (to) of the relationship.



## MOModel
I am a model. A façade an entities holder. 

### Properties
entities
anchor
name
language
broot
catalog
unknownType
objects
root
fileReference
readOnly

### Methods
#### MOModel>>isCorrect
Tests if the model is correct or not. A model is correct if all the entities are correct (according to the language constraints). 

#### MOModel>>typeNamed: aString
A single type named as given. The size must be 1.

#### MOModel>>incorrectEntities
Query all entities which are incorrect, according to the language semantics

#### MOModel>>sourceCodeIsAvailable
Tests if the model source directory exists.

#### MOModel>>derivative
Creates a derivative model. A derivative model is capable to scope modifications.

#### MOModel>>libraries
Query all the libraries defined within the model.

#### MOModel>>variableReferences
Query all the references to variables defined within the model.

#### MOModel>>allVersionsOf: aMOFunction
Query all the elements which are equivalent to a given element.

#### MOModel>>allDeclarations
Query all the declarations defined within the model.

#### MOModel>>literals
Query all the literals defined within the model.

#### MOModel>>allLiterals
Query all the literals defined within the model.

#### MOModel>>tablesAndQueries
Query all the queries or tables defined within the model.

#### MOModel>>allInvocations
Query all the invocations defined within the model.

#### MOModel>>saveAs: aString
Save this model as STON file.

#### MOModel>>typeReferences
Query all the references to types defined within the model.

#### MOModel>>writer
Creates a new model writer if the model is not read only. A model writer allows the user to update existing entities or create new entities.

#### MOModel>>declarations
Query all the declarations defined within the model.

#### MOModel>>typesNamed: aString
Query all the types named as given defined within the model.

#### MOModel>>expressions
Query all the expressions defined within the model.

#### MOModel>>allReferences
Query all the referential objects defined within the model.



## MOModelDerivative
I am a derivative model. 
A model on changing transition. I do hold new entities and relations before been add to the real model 

### Properties
entities
model
hasBeenModified

### Methods
#### MOModelDerivative>>allTypes
Returns all the types, favoring the definition closer to this derivative model.

#### MOModelDerivative>>entities
Returns all the entities of this derivative.

#### MOModelDerivative>>derivative
Returns a derivative model of a derivative model.

#### MOModelDerivative>>types
Returns all the types of this derivative.

#### MOModelDerivative>>variableReferences
Returns all the variable references of this derivative.

#### MOModelDerivative>>allVersionsOf: aMOFunction
Returns all the versions of a given element.

#### MOModelDerivative>>allDeclarations
Returns all the declarations, favoring the definition closer to this derivative model.

#### MOModelDerivative>>references
Returns all the references of this derivative.

#### MOModelDerivative>>allLiterals
Returns all the literals, favoring the definition closer to this derivative model.

#### MOModelDerivative>>allInvocations
Returns all the invocations, favoring the definition closer to this derivative model.

#### MOModelDerivative>>typeReferences
Returns all the type references of this derivative.

#### MOModelDerivative>>imports
Returns all the imports of this derivative.

#### MOModelDerivative>>writer
Returns a writer over this derivative models.

#### MOModelDerivative>>invocations
Returns all the invocations of this derivative.

#### MOModelDerivative>>allDerivariveEntities
Returns all the entities of this derivative models and the following chained models (derivative or not).

#### MOModelDerivative>>declarations
Returns all the declarations of this derivative.

#### MOModelDerivative>>allReferences
Returns all the references, favoring the definition closer to this derivative model.

#### MOModelDerivative>>packages
Returns all the packages of this derivative.



## MOModelUpdateResolver
I know how to resolve the object that knows how to update a given entity 

### Properties
writingBlock
writer
writingEntityRelation

### Methods
#### MOModelUpdateResolver>>resolveWriterFor: aProvenanceEntityRelation forUpdating: aDestinationContextRelation writingContext: aContextWriter do: aFullBlockClosure
Updates target entity based on a source entity by applying a given block.  



## MOModelWriter
I represent a model writer. I know how and where to add. 
I give the entry point for writing first class citizens: writeClass, writePackage, etc 

### Properties
model
builder
entity
anchoringOn
autoPopulate
mustUpdateDependencies
updatingElements

### Methods
#### MOModelWriter>>updaterFor: aDestinationContextRelation with: aProvenanceEntityRelation do: anUpdatingBlock
Update a target relation based on a source relation, using an updating block. 
	 .



## MOAnnotationWriter
I am an annotation writer. I now how to write and annotation instances and add them on the context of usag 

### Methods
#### MOAnnotationWriter>>writeAnnotation: aFullBlockClosure
Writes an annotation writer in the context of an annotation.



## MOArtefactWriter
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
For the Class part:  State a one line summary. For example, "I represent a paragraph of text".
For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.
For the Collaborators Part: State my main collaborators and one line about how I interact with them. 
Public API and Key Messages
- message one   
- message two 
- (for bonus points) how to create instances.
   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.
    Instance Variables
	typeReferences:		<Object>

    Implementation Points

### Properties
builder
surface
writeBuilder
from
to
anchor
writeResult
parentWriter
copyHelper
useless
typeReferences

### Methods
#### MOArtefactWriter>>writeDeclarationUnit: aBlock
Writes a declaration unit within a Library/Project.

#### MOArtefactWriter>>writePrimitiveType: aFullBlockClosure
Writes a primitive type within a Library/Project.

#### MOArtefactWriter>>writeAlias: aBlock
Writes an alias within a Library/Project.

#### MOArtefactWriter>>writeStructure: aBlock
Writes a structure within a Library/Project.



## MOBlockWriter
I write blocks

### Properties
builder
surface
writeBuilder
from
to
anchor
writeResult
parentWriter
copyHelper
useless
messageToRegisterBlock

### Methods
#### MOBlockWriter>>writeExpressionStatement: aFullBlockClosure
Writes expression within a the context of a block.

#### MOBlockWriter>>writeDoUntil: aBlock
Writes do-until within a the context of a block.

#### MOBlockWriter>>writeGoSub: aBlock
Writes go-sub within a the context of a block.

#### MOBlockWriter>>writeSelect: aBlock
Writes select within a the context of a block.

#### MOBlockWriter>>writeSetToReturn: aFullBlockClosure
Writes set-to-return within a the context of a block.

#### MOBlockWriter>>writeStatementDeclaration: aBlock
Writes statement-declaration within a the context of a block.

#### MOBlockWriter>>writeVariable: aBlock
Writes variable within a the context of a block.

#### MOBlockWriter>>writeWhile: aBlock
Writes while within a the context of a block.

#### MOBlockWriter>>writeExit: aFullBlockClosure 
Writes exit within a the context of a block.

#### MOBlockWriter>>writeFirstStatement: aBlock
Writes the first statement within a the context of a block.

#### MOBlockWriter>>writeGoTo: aBlock
Writes go-to within a the context of a block.

#### MOBlockWriter>>writeOnErrorGoTo: aFullBlockClosure
Writes on-error-go-to within a the context of a block.

#### MOBlockWriter>>writeDoWhile: aBlock
Writes do-while within a the context of a block.

#### MOBlockWriter>>writeFor: aBlock
Writes for within a the context of a block.

#### MOBlockWriter>>writeForNext: aBlock
Writes for-next within a the context of a block.

#### MOBlockWriter>>writeIfElse: aBlock
Writes IF within a the context of a block.

#### MOBlockWriter>>writeLastStatement: aBlock
Writes the last statement within a the context of a block.

#### MOBlockWriter>>writeRedimVariable: aBlock
Writes ReDim within a the context of a block.

#### MOBlockWriter>>writeResume: aBlock
Writes resume within a the context of a block.

#### MOBlockWriter>>writeStatement: aBlock
Writes statement within a the context of a block.

#### MOBlockWriter>>writeComment: aFullBlockClosure
Writes comment within a the context of a block.

#### MOBlockWriter>>writeForEach: aBlock
Writes for-each within a the context of a block.

#### MOBlockWriter>>writeLabel: aBlock
Writes label within a the context of a block.

#### MOBlockWriter>>writeOnErrorResumeNext: aFullBlockClosure 
Writes on-error-resume-next within a the context of a block.

#### MOBlockWriter>>writeReturn: aBlock
Writes return within a the context of a block.

#### MOBlockWriter>>writeTryCatch: aFullBlockClosure 
Writes try-catch within a the context of a block.

#### MOBlockWriter>>writeWith: aFullBlockClosure
Writes with within a the context of a block.



## MOConstructorWriter
I build constructors and allow to include annotations, blocks, parameters and type parameters

### Methods
#### MOConstructorWriter>>writeTypeParameter: aFullBlockClosure
Writes a parameter type within a the context of a constructor.



## MODeclarationUnitWriter
I write declaration units. I allow the inclusion of class, types and imports 

### Properties
builder
surface
writeBuilder
from
to
anchor
writeResult
parentWriter
copyHelper
useless
mustUpdateDependencies
typeReferences

### Methods
#### MODeclarationUnitWriter>>writeFileImport: aFullBlockClosure
Writes file-import within a the context of a Declaration Unit.

#### MODeclarationUnitWriter>>writeModule: aFullBlockClosure
Writes module within a the context of a Declaration Unit.

#### MODeclarationUnitWriter>>writeParametrizableClass: aFullBlockClosure 
Writes class with generics within a the context of a Declaration Unit.

#### MODeclarationUnitWriter>>writeQuery: aFullBlockClosure
Writes query within a the context of a Declaration Unit.

#### MODeclarationUnitWriter>>writeStClass: aBlock
Writes Smalltalk class within a the context of a Declaration Unit.

#### MODeclarationUnitWriter>>writeTypescriptClass: aFullBlockClosure 
Writes Typescript class within a the context of a Declaration Unit.

#### MODeclarationUnitWriter>>writeClassType: aBlock
Writes class-type within a the context of a Declaration Unit.

#### MODeclarationUnitWriter>>writeEnum: aFullBlockClosure
Writes enum within a the context of a Declaration Unit.

#### MODeclarationUnitWriter>>writeForm: aFullBlockClosure
Writes Form within a the context of a Declaration Unit.

#### MODeclarationUnitWriter>>writeParametrizableClassType: aBlock
Writes intercace with generics within a the context of a Declaration Unit.

#### MODeclarationUnitWriter>>writeJavaClassType: aBlock
Writes java interface (class type) within a the context of a Declaration Unit.

#### MODeclarationUnitWriter>>writeJavaEnum: aFullBlockClosure
Writes enum within a the context of a Declaration Unit.

#### MODeclarationUnitWriter>>writeReport: aFullBlockClosure 
Writes Report within a the context of a Declaration Unit.

#### MODeclarationUnitWriter>>writeTable: aFullBlockClosure
Writes Table within a the context of a Declaration Unit.

#### MODeclarationUnitWriter>>writeClass: aBlock
Writes class within a the context of a Declaration Unit.

#### MODeclarationUnitWriter>>writeImport: aFullBlockClosure
Writes import within a the context of a Declaration Unit.

#### MODeclarationUnitWriter>>writeJavaClass: aBlock
Writes Java Class within a the context of a Declaration Unit.

#### MODeclarationUnitWriter>>writeStructure: aBlock
Writes Structure within a the context of a Declaration Unit.



## MOEventWriter
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
For the Class part:  State a one line summary. For example, "I represent a paragraph of text".
For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.
For the Collaborators Part: State my main collaborators and one line about how I interact with them. 
Public API and Key Messages
- message one   
- message two 
- (for bonus points) how to create instances.
   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.
    Instance Variables
	typeReferences:		<Object>

    Implementation Points

### Properties
builder
surface
writeBuilder
from
to
anchor
writeResult
parentWriter
copyHelper
useless
typeReferences

### Methods
#### MOEventWriter>>writeParameter: aBlock
Writes a parameter within a the context of an event.



## MOInvocableWriter
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
For the Class part:  State a one line summary. For example, "I represent a paragraph of text".
For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.
For the Collaborators Part: State my main collaborators and one line about how I interact with them. 
Public API and Key Messages
- message one   
- message two 
- (for bonus points) how to create instances.
   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.
    Instance Variables
	typeReferences:		<Object>

    Implementation Points

### Properties
builder
surface
writeBuilder
from
to
anchor
writeResult
parentWriter
copyHelper
useless
typeReferences

### Methods
#### MOInvocableWriter>>writeParameter: aBlock
Writes a parameter within a the context of an invocable (function, method, etc).

#### MOInvocableWriter>>writeBlock: aBlock
Writes a block within a the context of an invocable (function, method, etc).



## MOLibraryWriter
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
For the Class part:  State a one line summary. For example, "I represent a paragraph of text".
For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.
For the Collaborators Part: State my main collaborators and one line about how I interact with them. 
Public API and Key Messages
- message one   
- message two 
- (for bonus points) how to create instances.
   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Implementation Points

### Methods
#### MOLibraryWriter>>writeFunction: aBlock
Writes an function within a Library.

#### MOLibraryWriter>>writeAttribute: aBlock
Writes an attribute within a Library.

#### MOLibraryWriter>>writeEnum: aFullBlockClosure
Writes an enum within a Library.



## MOMethodWriter
I build methods and allow to add the same as my parent

### Methods
#### MOMethodWriter>>writeAnnotation: aFullBlockClosure
Writes an annotation within a the context of a method.

#### MOMethodWriter>>writeTypeParameter: aFullBlockClosure
Writes a type parameter within a the context of a method.



## MOModuleWriter
I write modules allowing to add functions procedures and variables 

### Properties
builder
surface
writeBuilder
from
to
anchor
writeResult
parentWriter
copyHelper
useless
typeReferences

### Methods
#### MOModuleWriter>>writeExternalProcedure: aFullBlockClosure
Writes an external procedure within a the context of a module.

#### MOModuleWriter>>writeGlobalConstant: aFullBlockClosure 
Writes a golboal constant within a the context of a module.

#### MOModuleWriter>>writeGlobalVariable: aBlock
Writes a global variable within a the context of a module.

#### MOModuleWriter>>writeSubprocedure: aBlock
Writes a subprocedure within a the context of a module.

#### MOModuleWriter>>writeExternalFunction: aFullBlockClosure
Writes an external function within a the context of a module.

#### MOModuleWriter>>writeFunction: aBlock
Writes a function within a the context of a module.

#### MOModuleWriter>>writeLocalConstant: aBlock
Writes a local constant within a the context of a module.

#### MOModuleWriter>>writeVariableAccessor: aFullBlockClosure
Writes a variable accessor  within a the context of a module.

#### MOModuleWriter>>writeAttribute: aBlock
Writes an attribute within a the context of a module.

#### MOModuleWriter>>writeAttributeAccessor: aFullBlockClosure
Writes an attribute accessor within a the context of a module.

#### MOModuleWriter>>writeConstant: aFullBlockClosure
Writes an constant within a the context of a module.

#### MOModuleWriter>>writeStructure: aBlock
Writes a strcuture within a the context of a module.



## MOPackageWriter
I write packages. I allow the wirting of subpackages, classes and declaration units 

### Methods
#### MOPackageWriter>>writeDeclarationUnit: aBlock
Writes a declaration unit within a the context of a package.

#### MOPackageWriter>>writeJavaClassType: aBlock
Writes a java class type within a the context of a package.

#### MOPackageWriter>>writeModule: aFullBlockClosure
Writes a module within a the context of a package.

#### MOPackageWriter>>writeParametrizableClass: aFullBlockClosure 
Writes a parametrizable class within a the context of a package.

#### MOPackageWriter>>writePrimitiveType: aFullBlockClosure
Writes a primitive type within a the context of a package.

#### MOPackageWriter>>writeStClass: aFullBlockClosure
Writes a smalltalk class within a the context of a package.

#### MOPackageWriter>>writePackage: aBlock
Writes a package within a the context of a package.

#### MOPackageWriter>>writeStExensionMethodDeclarationUnit: aFullBlockClosure 
Writes a smalltalk extension unit within a the context of a package.

#### MOPackageWriter>>writeClassType: aFullBlockClosure
Writes a class type (interface) within a the context of a package.

#### MOPackageWriter>>writeClass: aBlock
Writes a class within a the context of a package.

#### MOPackageWriter>>writeEnum: aFullBlockClosure
Writes a enum within a the context of a package.

#### MOPackageWriter>>writeForm: aFullBlockClosure
Writes a form within a the context of a package.

#### MOPackageWriter>>writeJavaClass: aBlock
Writes a java class within a the context of a package.

#### MOPackageWriter>>writeParametrizableClassType: aBlock
Writes a parametrizable class type within a the context of a package.



## MOParametrizableMethodWriter
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
For the Class part:  State a one line summary. For example, "I represent a paragraph of text".
For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.
For the Collaborators Part: State my main collaborators and one line about how I interact with them. 
Public API and Key Messages
- message one   
- message two 
- (for bonus points) how to create instances.
   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Implementation Points

### Methods
#### MOParametrizableMethodWriter>>writeTypeParameter: aFullBlockClosure 
Writes type parameter within a the context of a method.



## MOOntologicalConstraint
I represent a set of language semantic constraints establishing if each specific relation between two objects is or not correct. 
I base my behaviour by delegating to an ontology which works as an oracle.

### Properties
ontology

### Methods
#### MOOntologicalConstraint>>can: anObject declare: anOtherObject with: aSlot
Responds if an object can be linked as declaration to an other object using a specific slot

#### MOOntologicalConstraint>>can: anObject express: anOtherObject with: aSlot
Responds if an object can be linked as expression to an other object using a specific slot

#### MOOntologicalConstraint>>can: anObject beDescribedBy: anOtherObject with: aSlot
Responds if an object can be linked as property to an other object using a specific slot

#### MOOntologicalConstraint>>can: anObject refer: anOtherObject with: aSlot
Responds if an object can be linked as refer to an other object using a specific slot

#### MOOntologicalConstraint>>can: anObject useAsReferee: anOtherObject with: aSlot
Responds if an object can be linked as referee to an other object using a specific slot

#### MOOntologicalConstraint>>can: anObject state: anOtherObject with: aSlot
Responds if an object can be linked as states to an other object using a specific slot



## MOPermissiveConstraint
I represent a set of language semantic constraints establishing if each specific relation between two objects is or not correct. 
I admit any relation. 

### Methods
#### MOPermissiveConstraint>>can: anObject declare: anOtherObject with: aSlot
Responds if an object can be linked as declaration to an other object using a specific slot

#### MOPermissiveConstraint>>can: anObject express: anOtherObject with: aSlot
Responds if an object can be linked as expression to an other object using a specific slot

#### MOPermissiveConstraint>>can: anObject beDescribedBy: anOtherObject with: aSlot
Responds if an object can be linked as property to an other object using a specific slot

#### MOPermissiveConstraint>>can: anObject refer: anOtherObject with: aSlot
Responds if an object can be linked as refer to an other object using a specific slot

#### MOPermissiveConstraint>>can: anObject useAsReferee: anOtherObject with: aSlot
Responds if an object can be linked as referee to an other object using a specific slot

#### MOPermissiveConstraint>>can: aMOBlock state: aMOStatementExpression with: aMOStatesSlot
Responds if an object can be linked as states to an other object using a specific slot



## MOStructuralRoleConstraint
I represent a set of language semantic constraints establishing if each specific relation between two objects is or not correct. 
I base my behaviour by testing the structural reality of the referenced object.


### Methods
#### MOStructuralRoleConstraint>>can: anObject declare: anOtherObject with: aSlot
Responds if an object can be linked as declaration to an other object using a specific slot

#### MOStructuralRoleConstraint>>can: anObject express: anOtherObject with: aSlot
Responds if an object can be linked as expression to an other object using a specific slot

#### MOStructuralRoleConstraint>>can: anObject beDescribedBy: anOtherObject with: aSlot
Responds if an object can be linked as property to an other object using a specific slot

#### MOStructuralRoleConstraint>>can: anObject refer: anOtherObject with: aSlot
Responds if an object can be linked as refer to an other object using a specific slot

#### MOStructuralRoleConstraint>>can: anObject useAsReferee: anOtherObject with: aSlot
Responds if an object can be linked as referee to an other object using a specific slot

#### MOStructuralRoleConstraint>>can: aMOBlock state: aMOStatementExpression with: aMOStatesSlot
Responds if an object can be linked as states to an other object using a specific slot



