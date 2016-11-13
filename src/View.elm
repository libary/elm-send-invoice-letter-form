module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Exts.Html exposing (..)

import Type exposing (..)
import Helpers exposing (..)

view : Model -> Html Msg
view model =
    -- text (toString model)
    case model.render of
        Adv ->
            advView model
        Baza4Sms ->
            bazaView model

advView : Model -> Html Msg
advView model =
    Html.form [] 
        [ fieldset [] 
            [ legend [] [ text "Отправить счёт на оплату по почте" ] 
            , div [ class "editor-label" ] 
                [ label [for "Title"] [ text "назначение платежа" ]  
                , text nbsp
                , text "(*)"
                ]
            , div [ class "editor-field" ] 
                [ input 
                    [ class "text-box-long"
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
        , p [] 
            [ button [ type' "submit", class "button" ] [ text "отправить" ]
            , text nbsp
            , text nbsp
            , text nbsp
            , button [ type' "button", class " button", attribute "onclick" "window.history.back();"] [ text "отмена" ]
            ]
        ]
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

bazaView : Model -> Html Msg
bazaView model =
    div [] []