; Zed reads queries from the language directory. Keep this in sync with
; queries/highlights.scm until the extension is split from the grammar repo.

(comment) @comment
(module_comment) @comment.doc
(doc_comment) @comment.doc

(string) @string
(integer) @number
(float) @number
(boolean) @boolean
(nil) @constant.builtin
(visibility) @keyword
(pub_keyword) @keyword

(import_keyword) @keyword
(as_keyword) @keyword
(const_keyword) @keyword
(type_keyword) @keyword
(opaque_keyword) @keyword
(external_keyword) @keyword
(fn_keyword) @keyword
(let_keyword) @keyword
(case_keyword) @keyword
(if_keyword) @keyword

(builtin_keyword) @keyword

(echo_statement
  (builtin_keyword) @keyword)

(panic_statement
  (builtin_keyword) @keyword)

(todo_statement
  (builtin_keyword) @keyword)

((identifier) @keyword
  (#match? @keyword "^(echo|panic|todo)$"))

[
  "->"
  "|>"
  "="
  "=="
  "!="
  "&&"
  "||"
  "<"
  "<="
  ">"
  ">="
  "<."
  "<=."
  ">."
  ">=."
  "<>"
  "+"
  "-"
  "*"
  "/"
  "%"
  "+."
  "-."
  "*."
  "/."
  "!"
] @operator

[
  "("
  ")"
  "["
  "]"
] @punctuation.bracket

[
  ","
  "."
  ":"
] @punctuation.delimiter

(type_identifier) @type
(type_variable) @type
(constructor) @constructor

(function_declaration
  name: (identifier) @function)

(external_function_declaration
  name: (identifier) @function)

(call_expression
  function: (identifier) @function.call)

(call_expression
  function: (field_expression
    field: (identifier) @function.method.call))

(parameter
  name: (_) @variable.parameter)

(let_statement
  pattern: (identifier) @variable)

(constant_declaration
  name: (identifier) @constant)

(import_statement
  module: (module_path) @module)

(module_path) @module
(qualified_identifier
  module: (identifier) @module
  name: (identifier) @function)

(qualified_constructor
  module: (identifier) @module
  name: (constructor) @constructor)

(qualified_type
  (identifier) @module
  (type_identifier) @type)

(qualified_generic_type
  (identifier) @module
  (type_identifier) @type)

(discard) @variable.special
