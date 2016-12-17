module Update exposing (..)

import Type exposing (..)
import Helpers exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            model ! []

        ChangeTarget newTarget ->
            ( { model | target = newTarget }, message ValidateTarget )

        ChangeSum newSum ->
            ( { model | sum = newSum }, message ValidateSum )

        ChangeEmail newEmail ->
            ( { model | email = newEmail }, message ValidateEmail )

        ValidateTarget ->
            { model | errorOnTarget = not (validateTarget model) } ! []

        ValidateSum ->
            { model | errorOnSum = not (validateSum model) } ! []

        ValidateEmail ->
            { model | errorOnEmail = not (validateEmail model) } ! []

        SendInit ->
            ( model, sendInvoice model )

        SendResult (Ok result) ->
            { model | invoiceSent = Just result } ! []

        SendResult (Err _) ->
            model ! []
