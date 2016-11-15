module Update exposing(..)

import Cmd.Extra exposing (message)

import Type exposing (..)
import Helpers exposing (..)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        NoOp ->
            (model, Cmd.none)

        ChangeTarget newTarget ->
            ({model | target = newTarget}, message ValidateTarget)

        ChangeSum newSum->
            ({model | sum = newSum}, message ValidateSum)

        ChangeEmail newEmail ->
            ({model | email = newEmail}, message ValidateEmail)

        ValidateTarget ->
            ({model | errorOnTarget = not (validateTarget model)}, Cmd.none)

        ValidateSum ->
            ({model | errorOnSum = not (validateSum model)}, Cmd.none)

        ValidateEmail ->
            ({model | errorOnEmail = not (validateEmail model)}, Cmd.none)

        SendInit ->
            -- (model, sendInvoice model)
            ({model | invoiceSent = Just True }, Cmd.none)

        SendSucceed result ->
            ({model | invoiceSent = Just result }, Cmd.none)

        SendFail error ->
            ({model | invoiceSent = Just False }, Cmd.none)
