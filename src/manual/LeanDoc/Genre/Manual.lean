import LeanDoc.Doc
import LeanDoc.Doc.Concrete
import LeanDoc.Doc.TeX
import LeanDoc.Output.TeX

import LeanDoc.Genre.Manual.TeX


open LeanDoc.Doc

open LeanDoc.Genre.Manual.TeX

namespace LeanDoc.Genre

structure Manual.PartMetadata where
  authors : List String := []

def Manual : Genre where
  PartMetadata := Manual.PartMetadata
  Block := Empty
  Inline := Empty
  TraverseContext := Unit
  TraverseState := Unit

instance : TeX.GenreTeX Manual IO where
  part go _meta txt := go txt
  block _go b _txt := nomatch b
  inline _go i _txt := nomatch i

namespace Manual

structure Config where
  destination : System.FilePath := "_out"

def ensureDir (dir : System.FilePath) : IO Unit := do
  if !(← dir.pathExists) then
    IO.FS.createDirAll dir
  if !(← dir.isDir) then
    throw (↑ s!"Not a directory: {dir}")

open IO.FS in
def emitTeX (logError : String → IO Unit) (config : Config) (text : Part Manual) : IO Unit := do
  let opts : TeX.Options Manual IO := {headerLevels := #["chapter", "section", "subsection", "subsubsection", "paragraph"], headerLevel := some ⟨0, by simp_arith [Array.size, List.length]⟩, logError := logError}
  let rendered ← text.toTeX (opts, (), ())
  let dir := config.destination.join "tex"
  ensureDir dir
  withFile (dir.join "main.tex") .write fun h => do
    h.putStrLn (preamble text.titleString ["author 1", "author 2"])
    h.putStrLn rendered.asString
    h.putStrLn postamble

def manualMain (text : Part Manual) (options : List String) : IO UInt32 := do
  let hasError ← IO.mkRef false
  let logError msg := do hasError.set true; IO.eprintln msg
  let cfg ← opts {} options

  -- TODO xrefs
  emitTeX logError cfg text

  if (← hasError.get) then
    IO.eprintln "Errors were encountered!"
    return 1
  else
    return 0
where
  opts (cfg : Config)
    | ("--output"::dir::more) => opts {cfg with destination := dir} more
    | (other :: _) => throw (↑ s!"Unknown option {other}")
    | [] => pure cfg
