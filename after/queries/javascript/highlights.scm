; extends
(class_body
	(field_definition
	  (private_property_identifier) @private_class_property
	)
)


(new_expression
	(identifier) @new_class_instance
)


(assignment_expression
  (member_expression
	  (private_property_identifier) @private_class_property_assignment
  )
)

(return_statement
	(class 
		(identifier) @class_name
	)
)


(return_statement
	(class 
	  (class_heritage
		(identifier) @class_extends
	  )
	)
)


(call_expression
	(member_expression 
		(identifier) @private_class_property
	)
)


(object
  (shorthand_property_identifier) @shorthand_property_identifier 
)



(member_expression
	object: (identifier) 
	property: (property_identifier) 
	@property_reference
	(#set! "priority" 110)
)


(member_expression
	object: (this) 
	property: (private_property_identifier) 
	@property_reference
	(#set! "priority" 110)
)

(member_expression
	property: (property_identifier) @property_reference
	(#set! "priority" 110)
)


(call_expression
	function: (member_expression
		object: (identifier) 
		property: (property_identifier) @method_call
		(#set! "priority" 111)
	) 
)


(call_expression
	function: (member_expression
		property: (property_identifier) @testingggg 
		(#set! "priority" 111)
	) 
)

(call_expression
	function: (member_expression
		property: (private_property_identifier) @testingggg 
		(#set! "priority" 111)
	) 
)

(call_expression
 function: (member_expression ; [459, 38] - [459, 83]
	  object: (member_expression ; [459, 38] - [459, 66]
		object: (this) ; [459, 38] - [459, 42]
		property: (private_property_identifier)) ; [459, 43] - [459, 66]
	  property: (property_identifier) @testingggg
		(#set! "priority" 111)
	)
)

(new_expression ; [66, 33] - [66, 74]
	constructor: (member_expression ; [66, 37] - [66, 72]
	property: (property_identifier) @method_call
	  (#set! "priority" 111)
  )
)
