" Vim filetype plugin file
" Language:	Orc
" Maintainer:	John A. Thywissen
" Last Change:  2017 Mar 12
" URL:		https://orc.csres.utexas.edu/

" Copyright (c) 2017 The University of Texas at Austin. All rights reserved.
"
" Use and redistribution of this file is governed by the license terms in
" the LICENSE file found in the project's top-level directory and also found at
" URL: https://orc.csres.utexas.edu/license.shtml .

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1


setlocal comments=s1:{-,mb:-,ex:-},:--

setlocal commentstring={-%s-}

setlocal formatoptions-=t formatoptions+=croql
