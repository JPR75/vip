" VIP : VHDL Interface Plugin
" File:        vip.vim
" Version:     0.1.0
" Last Change: nov. 07 2010
" Author:      Jean-Paul Ricaud
" License:     LGPLv3
" Description: Copy entity (or component) and paste as component (or entity)
"              or instance of component

if exists("g:loaded_VIP")
  finish
endif
let g:loaded_VIP = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Simple paste
" Useless, just to avoid annoying warning
" Use VIM built-in commands like yap instead
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function s:SPaste(yankBlock)
  call append(line("."), a:yankBlock)
  return 1
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Paste as entity or component
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function s:PasteEC(blockType, blockSubstitute, yankBlock)
  let copyType  = a:blockType " to avoid alteration of the copied block
  let copyBlock = copy(a:yankBlock) " to avoid alteration of the copied block
  let newBlock = map(copyBlock, 'substitute(v:val, copyType, a:blockSubstitute, "g")')
  call append(line("."), newBlock)
  return 1
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Paste as instance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function s:PasteI(sigPrefix, yankBlock)
  let instanceBlock = []
  let braceCnt = 0
  let openBlock = 0
  let closeBrace = 0
  let i = 0
  let braceAtEnd = 0
  let portAtLine = 0
  " Get signals inside entity / component
  while ((braceCnt != 0) || (closeBrace == 0))
    let currentList = split(a:yankBlock[i])
    let currentLine = a:yankBlock[i]
    let signalLeft = substitute(currentLine, "\:.*$", "", "g") " remove everything after :
    let signalRight = substitute(signalLeft, "\[ \t]", "", "g") " remove space & tab at begenning of line
   for currentWord in currentList
      if (currentWord==? "end") " Security check
                                " To do : add EOF check
        echohl WarningMsg | echo  "error : \"end\" detected" | echohl None
        return 0
      endif
      if (currentWord ==? "port") || (currentWord ==? "port(")
        let openBlock = 1 "Opening of the block detected
      endif
      if ((match(currentWord, "(") != -1) && (openBlock == 1))
        let braceCnt += 1
      endif
      if ((match(currentWord, ")") != -1) && (openBlock == 1))
        let braceCnt -= 1
        let closeBrace = 1
        if ((braceCnt == 0) && (signalRight == ");")) " have we a closing brace at a new line ?
          let braceAtEnd = 0
        else
          let braceAtEnd = 1
        endif
      endif
    endfor
    if (signalRight ==? "port (") || (signalRight ==? "port(")
      let portAtLine = 1
      let instanceBlock += [substitute(currentLine, "port", "port map", "")]
    else
      if ((braceCnt > 0) || (braceAtEnd == 1))
        let instanceBlock += [signalLeft." => ".a:sigPrefix.signalRight.","]
      else
        let instanceBlock += [currentLine] " add generic
      endif
    endif
    let i += 1
  endwhile
  " Head and tail of the instance
  let instanceName = split(a:yankBlock[0])
  let indentPos = match(a:yankBlock[0], "[a-zA-Z]")
  let indentVal = strpart(a:yankBlock[0], 0, indentPos)
  if portAtLine == 0
    let instanceBlock[0] = indentVal.instanceName[1]."_ : ".instanceName[1]." port map ("
  else
    let instanceBlock[0] = indentVal.instanceName[1]."_ : ".instanceName[1]
  endif
  if braceAtEnd == 0
    let instanceBlock[i-2] = substitute(instanceBlock[i-2], "\,", "", "g") " remove the , of last signal
  else
    let instanceBlock[i-1] = substitute(instanceBlock[i-1], "\,", ");", "g") " remove the , of last signal
  endif
  let instanceBlock += [""] " Add a blank line after the instance
  call append(line("."), instanceBlock)
  return 1
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy the block
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function s:CopyLines(blockType)
  let braceCnt = 0
  let openBlock = 0
  let closeBrace = 0
  let i = 0
  let currentLine = []
  let fLine = line(".")
  while ((braceCnt != 0) || (closeBrace == 0))
    let currentLine += [getline(fLine + i)]
    let currentList = split(currentLine[i])
    for currentWord in currentList
      "echo currentWord
      "echo braceCnt
      if (currentWord==? "end") " Security check
                                " To do : add EOF check
        echohl WarningMsg | echo  "error : \"end\" detected" | echohl None
        return []
      endif
      if (currentWord ==? "port") || (currentWord ==? "port(")
        let openBlock = 1 "Opening of the block detected
      endif
      if ((match(currentWord, "(") != -1) && (openBlock == 1))
        let braceCnt += 1
      endif
      if ((match(currentWord, ")") != -1) && (openBlock == 1))
        let braceCnt -= 1
        let closeBrace = 1
      endif
    endfor
    let i += 1
  endwhile
  if ((a:blockType == "entity") || (a:blockType == "component"))
    let currentLine += [getline(fLine + i)] " Get the end entity / end component line
  endif
  let currentLine += [""] " let add a blank element to get an empty line after the block
  return currentLine
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Get the line under the cursor, and check if it is an entity,
" a component, an instance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function s:CheckType()
  let firstLine = split(getline("."))
  if ((firstLine[0] ==? "port") || (firstLine[0] ==? "generic"))
    " Bad cursor position, cursor should be on "entity", "component"
    " or on the instance name line
    echohl WarningMsg | echo "error : please palce the cursor on entity, component or instance line" | echohl None
    return ""
  endif
  for firstLineWord in firstLine
    if (firstLineWord ==? "entity") || (firstLineWord ==? "component") || (firstLineWord ==? "port" || (firstLineWord ==? "generic"))
      return firstLineWord
    endif
  endfor
  " Search for an instance above
  let firstLine = split(getline(line(".") + 1))
  if ((firstLine[0] ==? "port") || (firstLine[0] ==? "generic"))
    return firstLine[0]
  endif
  echohl WarningMsg | echo "error : please palce the cursor on entity, component or instance line" | echohl None
  return ""
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Yank an entity, a component or an instance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function s:YankB()
  let yankBlock = []
  let blockType = s:CheckType() " check if we copy an entity, or a component, etc.
  if (blockType != "")
    let yankBlock = s:CopyLines(blockType)
  endif
  return [blockType,yankBlock]
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Action : what to do ? copy or paste / convert ?
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function s:Action(actionToDo)
  " Copy
  if (a:actionToDo == "yank")
    let [s:VHDLType,s:VHDLBlock] = s:YankB()
    "echo indent(".")
    "echo &l:shiftwidth
    "echo s:VHDLBlock
  endif
  " Paste
  if s:VHDLBlock != []
    " Simple paste
    if (a:actionToDo == "paste")
      let result = s:SPaste(s:VHDLBlock)
    endif
    " Entity paste
    if (s:VHDLType == "entity")
      if (a:actionToDo == "entity")
        let result = s:SPaste(s:VHDLBlock)
      endif
      if (a:actionToDo == "component")
        let result = s:PasteEC(s:VHDLType, "component", s:VHDLBlock)
      endif
      if (a:actionToDo == "instance")
        let result = s:PasteI("s_", s:VHDLBlock)
      endif
    endif
    " Component paste
    if (s:VHDLType == "component")
      if (a:actionToDo == "entity")
        let result = s:PasteEC(s:VHDLType, "entity", s:VHDLBlock)
      endif
      if (a:actionToDo == "component")
        let result = s:SPaste(s:VHDLBlock)
      endif
      if (a:actionToDo == "instance")
        let result = s:PasteI("s_", s:VHDLBlock)
      endif
    endif
    " Instance paste
    if ((s:VHDLType == "port") || (s:VHDLType == "generic"))
      if (a:actionToDo == "entity")
      endif
      if (a:actionToDo == "component")
      endif
      if (a:actionToDo == "instance")
        let result = s:SPaste(s:VHDLBlock)
      endif
    endif
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Main
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:VHDLBlock = [] " container for the block to be copied
let s:VHDLType = ""  " type of the block to copy

"""""""""""""" Yank
if !hasmapto('<Plug>SpecialVHDLAction')
  map <unique> <leader>y <Plug>SpecialVHDLYank
endif
noremap <unique> <script> <Plug>SpecialVHDLYank <SID>Yank
noremap <SID>Yank :call <SID>Action("yank")<CR>

"map <F2> :Viy<CR>
if !exists(":Viy")
  command -nargs=0 Viy :call s:Action("yank")
endif

"""""""""""""" Paste as same
if !hasmapto('<Plug>SpecialVHDLPaste')
  map <unique> <leader>p <Plug>SpecialVHDLPaste
endif
noremap <unique> <script> <Plug>SpecialVHDLPaste <SID>Paste
noremap <SID>Paste :call <SID>Action("paste")<CR>

"map <F3> :Vip<CR>
if !exists(":Vip")
  command -nargs=0 Vip :call s:Action("paste")
endif

""""""""""""""" Paste as entity
if !hasmapto('<Plug>SpecialVHDLPasteEntity')
  map <unique> <leader>e <Plug>SpecialVHDLPasteEntity
endif
noremap <unique> <script> <Plug>SpecialVHDLPasteEntity <SID>PasteEntity
noremap <SID>PasteEntity :call <SID>Action("entity")<CR>

"map <F4> :Vie<CR>
if !exists(":Vie")
  command -nargs=0 Vie :call s:Action("entity")
endif

""""""""""""""" Paste as component
if !hasmapto('<Plug>SpecialVHDLPasteComponent')
  map <unique> <leader>c <Plug>SpecialVHDLPasteComponent
endif
noremap <unique> <script> <Plug>SpecialVHDLPasteComponent <SID>PasteComponent
noremap <SID>PasteComponent :call <SID>Action("component")<CR>

"map <F5> :Vic<CR>
if !exists(":Vic")
  command -nargs=0 Vic :call s:Action("component")
endif

""""""""""""""" Paste as instance
if !hasmapto('<Plug>SpecialVHDLPasteInstance')
  map <unique> <leader>i <Plug>SpecialVHDLPasteInstance
endif
noremap <unique> <script> <Plug>SpecialVHDLPasteInstance <SID>PasteInstance
noremap <SID>Paste Instance:call <SID>Action("instance")<CR>

"map <F6> :Vii<CR>
if !exists(":Vii")
  command -nargs=0 Vii :call s:Action("instance")
endif

"vim:ff=unix
