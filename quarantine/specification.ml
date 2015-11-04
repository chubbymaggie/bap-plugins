open Bap.Std
open Spec

let spec = [
  Defn.({
      name = "malloc_is_safe";
      vars = ["p"; "c"];
      constrs = [
        Constr.var "p" ARM.CPU.r0;
        Constr.dep "c" "p"
      ];
      rules = [
        Rule.({
            name = "when_checked";
            premises = [Pat.call "malloc" [] ["p"]];
            conclusions = [Pat.jump `jmp "c" "dst"];
          })
      ]
    })
]
