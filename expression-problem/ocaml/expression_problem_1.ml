
(* Demonstrates of a possible solution to expression problem in OCaml. *)

(* Classes *)

module type Document = sig
    type t
    val load : t -> unit
    val save : t -> unit
end

module type Printable = sig
    type t
    val print : t -> unit
end


module type PrintableDocument = sig
    type t = string
    include Document  with type t := t
    include Printable with type t := t
end


(* Text Document *)

module TextDocument: PrintableDocument = struct
    type t = string
    let load t = print_endline ("Loading TextDocument(" ^ t ^ ")")
    let save t = print_endline ("Savin TextDocument(" ^ t ^ ")")
    let print t = print_endline ("Printing TextDocument(" ^ t ^ ")")
end


(* Drawing Document *)

type drawing_document = Drawing_document of string

module DrawingDocument: PrintableDocument = struct
    type t = string
    let load t = print_endline ("Loading DrawingDocument(" ^ t ^ ")")
    let save t = print_endline ("Savin DrawingDocument(" ^ t ^ ")")
    let print t = print_endline ("Printing DrawingDocument(" ^ t ^ ")")
end



(* Demonstration *)

let test_text t =
    TextDocument.load t;
    TextDocument.save t;
    TextDocument.print t


let test_drawing t =
    let open DrawingDocument in
    load t;
    save t;
    print t


let () =
    print_endline "";
    test_text "text";
    print_endline "";
    test_drawing "drawing";
    print_endline "";


