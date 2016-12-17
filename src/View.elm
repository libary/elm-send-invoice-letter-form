module View exposing (..)

import Html exposing (..)
import View.Adv exposing (..)
import View.Baza exposing (..)
import Type exposing (..)


view : Model -> Html Msg
view model =
    -- text (toString model)
    case model.render of
        Adv ->
            advView model

        Baza ->
            bazaView model
