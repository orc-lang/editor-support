" Vim syntax file
" Language:     Orc
" Maintainer:   John A. Thywissen
" Last Change:  2017 Mar 12
" URL:		https://orc.csres.utexas.edu/

" Copyright (c) 2017 The University of Texas at Austin. All rights reserved.
"
" Use and redistribution of this file is governed by the license terms in
" the LICENSE file found in the project's top-level directory and also found at
" URL: https://orc.csres.utexas.edu/license.shtml .


" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif


syntax case match

""""""""
" Syntax Group Definitions
""""""""

" Orc Comments
syn cluster orcCommentContents     contains=orcTodo,@Spell
syn region  orcBlockComment		 start="{-"  end="-}" contains=orcBlockComment,@orcCommentContents
syn match   orcLineComment	 "--.*$" contains=@orcCommentContents

" Orc Constants
syn keyword orcConstant	signal stop null
syn region  orcString		start=/"/ end=/"/ end=/$/ contains=orcSpecialChar,@Spell
syn match orcNumber	"([0-9]+)([.][0-9]+)?([Ee][+-]?([0-9]+))?"
syn keyword orcBoolean	true false

" Orc Identifiers
syn match orcIdentifier "[[:upper:][:lower:]][[:upper:][:lower:][:digit:]_']*"
" Note that this is incorrect, because Vim regexp character classes are not fully Unicode-aware

" Orc Operators
syn keyword orcOperator	new
syn keyword orcOperator	as
syn keyword orcLabel	_

" Orc Includes, etc.
syn keyword orcInclude	include import

" Orc types, etc.
syn match orcType "[[:upper:]][[:upper:][:lower:][:digit:]_']*"
syn keyword orcStructure	class def extends lambda site type val with
syn keyword orcDecl	class def extends lambda site type val with
syn keyword orcTypedef	this super
" Note: Odd use of "typedef" group, but consistent with "java" syntax file.

" Orc Special Characters
syn match orcSpecialChar	 contained "\\."
syn match orcSpecialChar	 contained "\\u{[0-9A-Fa-f]{1,6}( +[0-9A-Fa-f]{1,6})*}"
syn match orcSpecialChar	 contained "\\u[0-9A-Fa-f]{4}"

syn match orcDelimiter	"|"
" The following two lines match > and <, but not <= <: => :>
syn match orcDelimiter	"\([=:]\)\@<!>"
syn match orcDelimiter	"<\([=:]\)\@!"
syn match orcDelimiter	";"
syn match orcDelimiter	"{|"
syn match orcDelimiter	"|}"

" TODO etc.
syn keyword	orcTodo	contained TODO FIXME XXX

" Orcdoc Comments
syntax case ignore
" syntax coloring for Orcdoc comments (HTML)
syntax include @orcHtml syntax/html.vim
unlet b:current_syntax
" HTML enables spell checking for all text that is not in a syntax item. This
" is wrong for Orc (all identifiers would be spell-checked), so it's undone
" here.
syntax spell default

syn region  orcDocComment	start="{--"  end="-}" keepend contains=@orcHtml,orcDocTags,orcTodo,@Spell
" TODO: Handle DocComment/non-DocComment nesting

syn match  orcDocTags	 contained "@[[:upper:][:lower:]][[:upper:][:lower:][:digit:]_']*"
syntax case match


""""""""
" Default highlighting links
""""""""

hi def link orcBlockComment	orcComment
hi def link orcLineComment	orcComment
hi def link orcDocComment	orcSpecialComment
hi def link orcDocTags orcSpecial

hi def link orcComment	Comment
hi def link orcConstant	Constant
hi def link orcSpecial	Special
hi def link orcIdentifier	Identifier
hi def link orcStatement	Statement
hi def link orcPreProc	PreProc
hi def link orcType	Type
hi def link orcUnderlined	Underlined
hi def link orcIgnore	Ignore
hi def link orcError	Error
hi def link orcTodo	Todo
hi def link orcString	String
hi def link orcCharacter	Character
hi def link orcNumber	Number
hi def link orcBoolean	Boolean
hi def link orcFloat	Float
hi def link orcFunction	Function
hi def link orcConditional	Conditional
hi def link orcRepeat	Repeat
hi def link orcLabel	Label
hi def link orcOperator	Operator
hi def link orcKeyword	Keyword
hi def link orcException	Exception
hi def link orcInclude	Include
hi def link orcDefine	Define
hi def link orcMacro	Macro
hi def link orcPreCondit	PreCondit
hi def link orcStorageClass	StorageClass
hi def link orcStructure	Structure
hi def link orcTypedef	Typedef
hi def link orcTag	Tag
hi def link orcSpecialChar	SpecialChar
hi def link orcDelimiter	Delimiter
hi def link orcSpecialComment	SpecialComment
hi def link orcDebug	Debug


let b:current_syntax = "orc"

" vim: ts=8
