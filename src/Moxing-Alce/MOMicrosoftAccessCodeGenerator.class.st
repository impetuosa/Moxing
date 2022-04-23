Class {
	#name : #MOMicrosoftAccessCodeGenerator,
	#superclass : #MOCodeGenerator,
	#category : #'Moxing-Alce'
}

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> blockDelimiterClose [

	^ ''
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> blockDelimiterOpen [

	^ ''
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> lineDelimiter [

	^ ''
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> printSelf [

	stream nextPutAll: 'Me'
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitClass: aJinTypescriptClass [

	stream nextPutAll: 'Option Compare Database
Option Explicit

'.
	aJinTypescriptClass properties do: [ :m | 
		m acceptVisitor: self.
		stream newLine ].
	aJinTypescriptClass invocables do: [ :m | 
		m acceptVisitor: self.
		stream newLine ]
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitProcedure: aMOProcedure [

	stream nextPutAll: aMOProcedure visibility.
	aMOProcedure modifiers do: [ :m | 
		stream
			nextPutAll: m;
			nextPutAll: ' ' ].
	stream
		nextPutAll: ' Sub ';
		nextPutAll: aMOProcedure selector.
	self streamArguments: aMOProcedure parameters.
	stream nextLine .
	aMOProcedure block acceptVisitor: self. 
	stream nextLine .
	stream nextPutAll: 'End Sub'.

	"Sub OpenOrder(Optional PurchaseOrderID As Long)
    If (PurchaseOrderID > 0) Then
        DoCmd.OpenForm ""Purchase Order Details"", acNormal, , ""[Purchase Order ID]="" & PurchaseOrderID, acFormEdit, acDialog
    Else
        DoCmd.OpenForm ""Purchase Order Details"", acNormal, , , acFormAdd, acDialog
    End If
End Sub"
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitVariable: aMOVariable [

	stream
		nextPutAll: 'Dim ';
		nextPutAll: aMOVariable name;
		nextPutAll: ' As '.
	stream nextPutAll:
		(aMOVariable typeReference ifNil: [ 'Variant' ] ifNotNil: [ :t | t type name ])
]
