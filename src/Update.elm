module Update exposing(..)

import Type exposing (..)
import Helpers exposing (..)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        NoOp ->
            (model, Cmd.none)
        ChangeEmail newEmail ->
            let
                errorOnEmail = not (validateEmail newEmail)
            in
                ({model
                  | email = newEmail
                  , errorOnEmail = errorOnEmail}, Cmd.none)
        ChangeSum newSum->
            let
                errorOnSum = not (validateSum newSum)
            in
                ({model
                  | sum = newSum
                  , errorOnSum = errorOnSum}, Cmd.none)
        ChangeTarget newTarget ->
            let
                errorOnTarget = not (validateTarget newTarget)
            in
                ({model
                  | target = newTarget
                  , errorOnTarget = errorOnTarget}, Cmd.none)
        SendInit ->
            (model, sendInvoice model)
        SendSucceed result ->
            ({model | invoiceSent = Just result }, Cmd.none)
        SendFail error ->
            ({model | invoiceSent = Just False }, Cmd.none)
