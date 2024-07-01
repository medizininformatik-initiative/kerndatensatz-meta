Invariant: search-param-code-regex
Description: "In SearchParameter.code DÜRFEN NICHT folgende Zeichen enthalten sein: Leerzeichen, `.`, `$`, `|`."
Severity: #error
Expression: "matches('[^\\s.$|]+')"