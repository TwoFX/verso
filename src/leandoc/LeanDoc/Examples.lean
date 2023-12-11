/-
Copyright (c) 2023 Lean FRO LLC. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: David Thrane Christiansen
-/
import Std.Tactic.GuardMsgs

import LeanDoc.Doc.Concrete


namespace LeanDoc.Examples

set_option pp.rawOnError true

#docs (.none) noDoc "Nothing" :=
:::::::
:::::::

/--
info: LeanDoc.Doc.Doc.mk
  LeanDoc.Doc.Part.mk #[LeanDoc.Doc.Inline.text "Nothing"] "Nothing" none #[] #[]
  Lean.HashMap.ofList []
  Lean.HashMap.ofList []
-/
#guard_msgs in
  #eval noDoc

#docs (.none) a "My title here" :=
:::::::

Hello, I'm a paragraph. Yes I am!

:::::::



/--
info: LeanDoc.Doc.Doc.mk
  LeanDoc.Doc.Part.mk
    #[LeanDoc.Doc.Inline.text "My title here"]
    "My title here"
    none
    #[LeanDoc.Doc.Block.para #[LeanDoc.Doc.Inline.text "Hello, I'm a paragraph. Yes I am!"]]
    #[]
  Lean.HashMap.ofList []
  Lean.HashMap.ofList []
-/
#guard_msgs in
  #eval a

#docs (.none) a' "My title here" :=
:::::::

* Just a list with one item

:::::::

/--
info: LeanDoc.Doc.Doc.mk
  LeanDoc.Doc.Part.mk
    #[LeanDoc.Doc.Inline.text "My title here"]
    "My title here"
    none
    #[LeanDoc.Doc.Block.ul
        #[{ indent := 0,
            contents := #[LeanDoc.Doc.Block.para #[LeanDoc.Doc.Inline.text "Just a list with one item"]] }]]
    #[]
  Lean.HashMap.ofList []
  Lean.HashMap.ofList []
-/
#guard_msgs in
  #eval a'


#docs (.none) b "My title here" :=
:::::::

# Section 1

a paragraph


:::::::

/--
info: LeanDoc.Doc.Doc.mk
  LeanDoc.Doc.Part.mk
    #[LeanDoc.Doc.Inline.text "My title here"]
    "My title here"
    none
    #[]
    #[LeanDoc.Doc.Part.mk
        #[LeanDoc.Doc.Inline.text "Section 1"]
        "Section 1"
        none
        #[LeanDoc.Doc.Block.para #[LeanDoc.Doc.Inline.text "a paragraph"]]
        #[]]
  Lean.HashMap.ofList []
  Lean.HashMap.ofList []
-/
#guard_msgs in
  #eval b

#docs (.none) c "My title here" :=
:::::::

# Section 1

a paragraph

## Section 1.1

More text:

* and a list
* with two
 * and nested



:::::::

/--
info: LeanDoc.Doc.Doc.mk
  LeanDoc.Doc.Part.mk
    #[LeanDoc.Doc.Inline.text "My title here"]
    "My title here"
    none
    #[]
    #[LeanDoc.Doc.Part.mk
        #[LeanDoc.Doc.Inline.text "Section 1"]
        "Section 1"
        none
        #[LeanDoc.Doc.Block.para #[LeanDoc.Doc.Inline.text "a paragraph"]]
        #[LeanDoc.Doc.Part.mk
            #[LeanDoc.Doc.Inline.text "Section 1.1"]
            "Section 1.1"
            none
            #[LeanDoc.Doc.Block.para #[LeanDoc.Doc.Inline.text "More text:"],
              LeanDoc.Doc.Block.ul
                #[{ indent := 0, contents := #[LeanDoc.Doc.Block.para #[LeanDoc.Doc.Inline.text "and a list"]] },
                  { indent := 0,
                    contents := #[LeanDoc.Doc.Block.para #[LeanDoc.Doc.Inline.text "with two"],
                                  LeanDoc.Doc.Block.ul
                                    #[{ indent := 1,
                                        contents := #[LeanDoc.Doc.Block.para
                                                        #[LeanDoc.Doc.Inline.text "and nested"]] }]] }]]
            #[]]]
  Lean.HashMap.ofList []
  Lean.HashMap.ofList []
-/
#guard_msgs in
  #eval c

#docs (.none) d "More writing" :=
:::::::

# Section 1

Here's a quote;

> I like quotes
  * Also with lists in them

Also, 2 > 3.

:::::::

/--
info: LeanDoc.Doc.Doc.mk
  LeanDoc.Doc.Part.mk
    #[LeanDoc.Doc.Inline.text "More writing"]
    "More writing"
    none
    #[]
    #[LeanDoc.Doc.Part.mk
        #[LeanDoc.Doc.Inline.text "Section 1"]
        "Section 1"
        none
        #[LeanDoc.Doc.Block.para #[LeanDoc.Doc.Inline.text "Here's a quote;"],
          LeanDoc.Doc.Block.blockquote
            #[(LeanDoc.Doc.Block.para #[LeanDoc.Doc.Inline.text "I like quotes"]),
              (LeanDoc.Doc.Block.ul
                 #[{ indent := 2,
                     contents := #[LeanDoc.Doc.Block.para #[LeanDoc.Doc.Inline.text "Also with lists in them"]] }])],
          LeanDoc.Doc.Block.para #[LeanDoc.Doc.Inline.text "Also, 2 > 3."]]
        #[]]
  Lean.HashMap.ofList []
  Lean.HashMap.ofList []
-/
#guard_msgs in
  #eval d

#docs (.none) e "More writing" :=
:::::::

# Section 1

Here's some code

```
(define (zero f z) z)
(define (succ n) (lambda (f x) (f (n f z))))
```

:::::::

/--
info: LeanDoc.Doc.Doc.mk
  LeanDoc.Doc.Part.mk
    #[LeanDoc.Doc.Inline.text "More writing"]
    "More writing"
    none
    #[]
    #[LeanDoc.Doc.Part.mk
        #[LeanDoc.Doc.Inline.text "Section 1"]
        "Section 1"
        none
        #[LeanDoc.Doc.Block.para #[LeanDoc.Doc.Inline.text "Here's some code"],
          LeanDoc.Doc.Block.code none #[] 0 "(define (zero f z) z)\n(define (succ n) (lambda (f x) (f (n f z))))\n"]
        #[]]
  Lean.HashMap.ofList []
  Lean.HashMap.ofList []
-/
#guard_msgs in
  #eval e

#docs (.none) f "More code writing" :=
:::::::

# Section 1

Here's some `code`!

```
(define (zero f z) z)
(define (succ n) (lambda (f x) (f (n f z))))
```

:::::::

/--
info: LeanDoc.Doc.Doc.mk
  LeanDoc.Doc.Part.mk
    #[LeanDoc.Doc.Inline.text "More code writing"]
    "More code writing"
    none
    #[]
    #[LeanDoc.Doc.Part.mk
        #[LeanDoc.Doc.Inline.text "Section 1"]
        "Section 1"
        none
        #[LeanDoc.Doc.Block.para
            #[LeanDoc.Doc.Inline.text "Here's some ", LeanDoc.Doc.Inline.code "code", LeanDoc.Doc.Inline.text "!"],
          LeanDoc.Doc.Block.code none #[] 0 "(define (zero f z) z)\n(define (succ n) (lambda (f x) (f (n f z))))\n"]
        #[]]
  Lean.HashMap.ofList []
  Lean.HashMap.ofList []
-/
#guard_msgs in
  #eval f

#docs (.none) g "Ref link before" :=
:::::::

# Section 1

[to here]: http://example.com

Here's [a link][to here]!

:::::::

/--
info: LeanDoc.Doc.Doc.mk
  LeanDoc.Doc.Part.mk
    #[LeanDoc.Doc.Inline.text "Ref link before"]
    "Ref link before"
    none
    #[]
    #[LeanDoc.Doc.Part.mk
        #[LeanDoc.Doc.Inline.text "Section 1"]
        "Section 1"
        none
        #[LeanDoc.Doc.Block.para
            #[LeanDoc.Doc.Inline.text "Here's ",
              LeanDoc.Doc.Inline.link #[(LeanDoc.Doc.Inline.text "a link")] (LeanDoc.Doc.LinkDest.ref "to here"),
              LeanDoc.Doc.Inline.text "!"]]
        #[]]
  Lean.HashMap.ofList [("to here", "http://example.com")]
  Lean.HashMap.ofList []
-/
#guard_msgs in
  #eval g

#docs (.none) g' "Ref link after" :=
:::::::

# Section 1

Here's [a link][to here]!

[to here]: http://example.com

:::::::

/--
info: LeanDoc.Doc.Doc.mk
  LeanDoc.Doc.Part.mk
    #[LeanDoc.Doc.Inline.text "Ref link after"]
    "Ref link after"
    none
    #[]
    #[LeanDoc.Doc.Part.mk
        #[LeanDoc.Doc.Inline.text "Section 1"]
        "Section 1"
        none
        #[LeanDoc.Doc.Block.para
            #[LeanDoc.Doc.Inline.text "Here's ",
              LeanDoc.Doc.Inline.link #[(LeanDoc.Doc.Inline.text "a link")] (LeanDoc.Doc.LinkDest.ref "to here"),
              LeanDoc.Doc.Inline.text "!"]]
        #[]]
  Lean.HashMap.ofList [("to here", "http://example.com")]
  Lean.HashMap.ofList []
-/
#guard_msgs in
  #eval g'
