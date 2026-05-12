# Estructuras de datos

Lista de videos 

[![Estructuras de Datos - Clase 1](https://img.youtube.com/vi/CW09lRWB1cY/0.jpg)](https://www.youtube.com/watch?v=CW09lRWB1cY)


 {
	// Place your snippets for haskell here. Each snippet is defined under a snippet name and has a prefix, body and 
	// description. The prefix is what is used to trigger the snippet and the body will be expanded and inserted. Possible variables are:
	// $1, $2 for tab stops, $0 for the final cursor position, and ${1:label}, ${2:another} for placeholders. Placeholders with the 
	// same ids are connected.
	// Example:
	// "Print to console": {
	// 	"prefix": "log",
	// 	"body": [
	// 		"console.log('$1');",
	// 		"$2"
	// 	],
	// 	"description": "Log output to console"
	// }
	//
	// You can also restrict snippets to specific files using include/exclude patterns:
	// "Test snippet": {
	// 	"prefix": "test",
	// 	"body": "test('$1', () => {\n\t$0\n});",
	// 	"include": ["**/*.test.ts", "*.spec.ts"],
	// 	"exclude": ["**/temp/*.ts"],
	// 	"description": "Insert test block"
	// }
	"ppc": {
		"prefix": "ppc",
		"body": [
			"{-",
			"    Proposito: ",
			"    PRECONDICION:   ",
			"    COSTO:  ",
			"-}"
		],
		"include": ["**/*.hs", "**/*.lhs"],
		"description": "Comment template for Haskell"
	},
	"ir" : {
		"prefix": "ir",
		"body": [
			"{-",
			"    INVARIANTE DE REPRENSENTACION:  ",
			"-}"
		],
		"include": ["**/*.hs", "**/*.lhs"],
		"description": "INVARIANTE DE REPRENSENTACION"
	},
	"c" : {
		"prefix": "c",
		"body": [
			" O(1) Constante"
		],
		"include": ["**/*.hs", "**/*.lhs"],
		"description": "Constante"
	},
	"l" : {
		"prefix": "l",
		"body": [
			" O(n) Lineal"
		],
		"include": ["**/*.hs", "**/*.lhs"],
		"description": "Lineal"
	},
	"cc" : {
		"prefix": "cc",
		"body": [
			" O(n^2) Cuadratico"
		],
		"include": ["**/*.hs", "**/*.lhs"],
		"description": "Cuadratico"
	},
	"ej" : {
		"prefix": "ej",
		"body": [
			"{--Ejemplo de uso --}"
		],
		"include": ["**/*.hs", "**/*.lhs"],
		"description": "Ejemplo de uso"
	}

}