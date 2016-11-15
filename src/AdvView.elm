module AdvView exposing (advView)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Exts.Html exposing (..)
import List exposing (append)

import Type exposing (..)

advView : Model -> Html Msg
advView model =
    if model.invoiceSent == Nothing
        then
            invoiceReadyView model
        else
            invoiceSentView model
    -- <form>
    --     <fieldset>
    --         <legend>Отправить счёт на оплату по почте</legend>
    --         <div class="editor-label">
    --             <label for="Title">назначение платежа</label> (*)
    --         </div>
    --         <div class="editor-field">
    --             <input class="text-box-long" data-val="true" data-val-required="укажите назначение платежа" id="Title" name="Title" type="text" value="model.target">
    --             <br />
    --             <span class="field-validation-valid" data-valmsg-for="Title" data-valmsg-replace="true"></span>
    --         </div>
    --         <div class="editor-label">
    --             <label for="Sum">сумма к оплате</label> (*)
    --         </div>
    --         <div class="editor-field">
    --             <input class="text-box" data-val="true" data-val-regex="проверьте указанную сумму" data-val-regex-pattern="^(\d{1,}(\,\d{1,2})?)$" data-val-required="укажите сумму" id="Sum" name="Sum" type="text" value="model.sum">&nbsp;руб.
    --             <br />
    --             <span class="field-validation-valid" data-valmsg-for="Sum" data-valmsg-replace="true"></span>
    --         </div>
    --         <div class="editor-label">
    --             <label for="Email">email</label> (*)
    --         </div>
    --         <div class="editor-field">
    --             <input data-val="true" data-val-length="длина email не должна превышать 30 знаков" data-val-length-max="30" data-val-regex="проверьте указанный e-mail" data-val-regex-pattern="^([\w\-\.]+)@((\[([0-9]{1,3}\.){3}[0-9]{1,3}\])|(([\w\-]+\.)+)([a-zA-Z]{2,4}))$" data-val-required="укажите email клиента" id="Email" name="Email" type="text" value="model.email">
    --             <br />
    --             <span class="field-validation-valid" data-valmsg-for="Email" data-valmsg-replace="true"></span>
    --         </div>
    --     </fieldset>
    --     <p>
    --         <input type="submit" value="отправить" class="button">&nbsp;&nbsp;&nbsp;<input type="button" value="отмена" class="button" onclick="javascript:window.history.back();">
    --     </p>
    -- </form>

invoiceReadyView : Model -> Html Msg
invoiceReadyView model =
    let
        nodes =
            (advEmailView model)
            |> append (advSumView model)
            |> append (advTargetView model)
    in
        Html.form [ onSubmit SendInit ]
            [ fieldset []
                (append [ legend [] [ text "Отправить счёт на оплату по почте" ] ] nodes)
            , p []
                [ button [ type' "submit", class "button" ] [ text "отправить" ]
                , text nbsp
                , text nbsp
                , text nbsp
                , button [ type' "button", class " button", attribute "onclick" "window.history.back();"] [ text "отмена" ]
                ]
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
        div [] [ text message ]

advTargetView : Model -> List (Html Msg)
advTargetView model =
    [ div [ class "editor-label" ]
        [ label [for "Title"] [ text "назначение платежа" ]
        , text nbsp
        , text "(*)"
        ]
    , div [ class "editor-field" ]
        [ input
            [ type' "text"
            , class "text-box-long"
            , placeholder "укажите назначение платежа"
            , name "Title"
            , value model.target
            ] []
        , br [] []
        , span [ classList
                    [ ("field-validation-valid", not model.errorOnEmail)
                    , ("field-validation-invalid", model.errorOnEmail)
                    ]
                ]
                [ text "укажите назначение платежа" ]
        ]
    ]

advSumView : Model -> List (Html Msg)
advSumView model =
    [ div [ class "editor-label" ]
        [ label [ for "Sum" ] [ text "сумма к оплате" ]
        , text nbsp
        , text "(*)"
        ]
    , div [ class "editor-field" ]
        [ input
            [ type' "text"
            , class "text-box"
            , placeholder "укажите сумму к оплате"
            , name "Sum"
            , value model.sum
            ] []
        , text nbsp
        , text "руб."
        , br [] []
        , span [ classList
                    [ ("field-validation-valid", not model.errorOnSum)
                    , ("field-validation-invalid", model.errorOnSum)
                    ]
                ]
                [ text "проверьте указанную сумму" ]
        ]
    ]

advEmailView : Model -> List (Html Msg)
advEmailView model =
    [ div [ class "editor-label" ]
        [ label [ for "Email" ] [ text "email" ]
        , text nbsp
        , text "(*)"
        ]
    , div [ class "editor-field" ]
        [ input
            [ type' "email"
            , class "text-box"
            , placeholder "укажите email"
            , name "Email"
            , value model.email
            ] []
        , text nbsp
        , text "руб."
        , br [] []
        , span [ classList
                    [ ("field-validation-valid", not model.errorOnEmail)
                    , ("field-validation-invalid", model.errorOnEmail)
                    ]
                ]
                [ text "проверьте указанный email" ]
        ]
    ]
