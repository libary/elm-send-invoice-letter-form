module View.Adv exposing (advView)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Exts.Html exposing (..)
import List exposing (append)

import Type exposing (..)
-- import Helpers exposing (..)

advView : Model -> Html Msg
advView model =
    if model.invoiceSent == Nothing
        then
            invoiceReadyView model
        else
            invoiceSentView model

invoiceReadyView : Model -> Html Msg
invoiceReadyView model =
    let
        nodes : List (Html Msg)
        nodes =
            (emailView model)
            |> append (sumView model)
            |> append (targetView model)
    in
        Html.form [ onSubmit SendInit ]
            [ fieldset []
                (append [ legend [] [ text "Отправить счёт на оплату по почте" ] ] nodes)
            , p []
                [ input [ type' "submit", class "button", value "отправить" ] []
                , text nbsp
                , text nbsp
                , text nbsp
                , input [ type' "button", class " button", value "отмена", attribute "onclick" "window.history.back();" ] []
                ]
            -- , p [] [ text (toString model) ]
            -- , p [] [ text (toString (validate model)) ]
            ]

invoiceSentView : Model -> Html Msg
invoiceSentView model =
    let
        message : String
        message =
            if model.invoiceSent == Just True
                then "счёт на оплату отослан"
                else "счёт на оплату не удалось отправить"
    in
        div [ class "display-field" ] [ text message ]

targetView : Model -> List (Html Msg)
targetView model =
    [ div [ class "editor-label" ]
        [ label [for "Title"] [ text "назначение платежа" ]
        , text nbsp
        , text "(*)"
        ]
    , div [ class "editor-field" ]
        [ input
            [ type' "text"
            , classList
                [ ("text-box-long", True)
                , ("input-validation-error", model.errorOnTarget)
                ]
            , placeholder "укажите назначение платежа"
            , name "Title"
            , value model.target
            , onInput ChangeTarget
            ] []
        , br [] []
        , span [ classList
                    [ ("field-validation-valid", not model.errorOnTarget)
                    , ("field-validation-invalid", model.errorOnTarget)
                    , ("field-validation-error", model.errorOnTarget)
                    ]
                ]
                [ text "укажите назначение платежа" ]
        ]
    ]

sumView : Model -> List (Html Msg)
sumView model =
    [ div [ class "editor-label" ]
        [ label [ for "Sum" ] [ text "сумма к оплате" ]
        , text nbsp
        , text "(*)"
        ]
    , div [ class "editor-field" ]
        [ input
            [ type' "text"
            , classList
                [ ("text-box", True)
                , ("input-validation-error", model.errorOnSum)
                ]
            , placeholder "укажите сумму к оплате"
            , name "Sum"
            , value model.sum
            , onInput ChangeSum
            ] []
        , text nbsp
        , text "руб."
        , br [] []
        , span [ classList
                    [ ("field-validation-valid", not model.errorOnSum)
                    , ("field-validation-invalid", model.errorOnSum)
                    , ("field-validation-error", model.errorOnSum)
                    ]
                ]
                [ text "проверьте указанную сумму" ]
        ]
    ]

emailView : Model -> List (Html Msg)
emailView model =
    [ div [ class "editor-label" ]
        [ label [ for "Email" ] [ text "email" ]
        , text nbsp
        , text "(*)"
        ]
    , div [ class "editor-field" ]
        [ input
            [ type' "email"
            , classList
                [ ("text-box", True)
                , ("input-validation-error", model.errorOnEmail)
                ]
            , placeholder "укажите email"
            , name "Email"
            , value model.email
            , onInput ChangeEmail
            ] []
        , br [] []
        , span [ classList
                    [ ("field-validation-valid", not model.errorOnEmail)
                    , ("field-validation-invalid", model.errorOnEmail)
                    , ("field-validation-error", model.errorOnEmail)
                    ]
                ]
                [ text "проверьте указанный email" ]
        ]
    ]
