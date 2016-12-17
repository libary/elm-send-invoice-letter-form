module Type exposing (..)

import Http exposing (Error)


type alias Flags =
    { id : String
    , target : String
    , sum : String
    , email : String
    , render : String
    , sendUrl : String
    , successUrl : String
    }


type Render
    = Adv
    | Baza


type alias Model =
    { id : String
    , target : String
    , sum : String
    , email : String
    , render : Render
    , sendUrl : String
    , successUrl : String
    , errorOnTarget : Bool
    , errorOnSum : Bool
    , errorOnEmail : Bool
    , invoiceSent : Maybe Bool
    }


type Msg
    = NoOp
    | ChangeTarget String
    | ChangeSum String
    | ChangeEmail String
    | ValidateEmail
    | ValidateSum
    | ValidateTarget
    | SendInit
    | SendResult (Result Error Bool)
