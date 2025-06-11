; Rainbow delimiters for JavaScript
(parenthesized_expression) @rainbow.delimiter

; Arrow functions
(arrow_function
  parameters: (formal_parameters) @rainbow.delimiter
  "=>" @rainbow.delimiter)

; Object literals
(object) @rainbow.delimiter

; Array literals
(array) @rainbow.delimiter

; Function parameters
(formal_parameters) @rainbow.delimiter

; Template literals
(template_string) @rainbow.delimiter
