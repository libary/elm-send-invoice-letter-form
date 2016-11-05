module Type exposing (..)

type alias Flags = {
    account : String,
    defaultSum : String,
    defaultTarget : String,
    successURL : String       
}

type alias Model = {
    account : String,
    sum : String,
    target : String,
    url : String,
    errorOnSum : Bool,
    errorOnTarget : Bool,
    errorOnUrl : Bool,
    complete : Bool
}

type Msg
  = NoOp
  | ChangeSum String
  | ChangeTarget String
  | ChangeUrl String
  | SendInit
  | SendComplete