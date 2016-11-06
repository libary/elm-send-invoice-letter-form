module Type exposing (..)

type alias Flags = {
    account : String,
    email : String,
    sum : String,
    target : String,
    successURL : String       
}

type alias Model = {
    account : String,
    email : String,
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
  | ChangeEmail String
  | ChangeSum String
  | ChangeTarget String
  | ChangeUrl String
  | SendInit
  | SendComplete