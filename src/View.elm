module View exposing (..)

import Html exposing (..)

import AdvView exposing (..)
import BazaView exposing (..)
import Type exposing (..)

view : Model -> Html Msg
view model =
    -- text (toString model)
    case model.render of
        Adv ->
            advView model
        Baza ->
            bazaView model
