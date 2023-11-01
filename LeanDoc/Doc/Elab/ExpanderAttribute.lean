import Lean

namespace LeanDoc.Doc.Elab

open Lean

unsafe def mkDocExpanderAttrUnsafe (attrName typeName : Name) (descr : String) (attrDeclName : Name) : IO (KeyedDeclsAttribute α) :=
  KeyedDeclsAttribute.init {
    name := attrName,
    descr := descr,
    valueTypeName := typeName,
    evalKey := fun _ stx => do
      return (← Attribute.Builtin.getIdent stx).getId
  } attrDeclName


@[implemented_by mkDocExpanderAttrUnsafe]
opaque mkDocExpanderAttributeSafe (attrName typeName : Name) (desc : String) (attrDeclName : Name) : IO (KeyedDeclsAttribute α)

def mkDocExpanderAttribute (attrName typeName : Name) (desc : String) (attrDeclName : Name := by exact decl_name%) : IO (KeyedDeclsAttribute α) := mkDocExpanderAttributeSafe attrName typeName desc attrDeclName
