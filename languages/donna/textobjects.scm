(function_declaration) @function.around
(function_declaration
  body: (block) @function.inside)

(type_declaration) @class.around

(comment)+ @comment.around
(doc_comment)+ @comment.around
(module_comment)+ @comment.around
