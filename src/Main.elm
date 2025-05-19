module Main exposing (main)

import Browser
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes as Attr
import StyledHtml exposing (styledHtml)
import Tailwind.Theme as Tw
import Tailwind.Utilities as Tw


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Todo =
    { id : String
    , title : String
    , completed : Bool
    }


type alias Model =
    { todos : List Todo
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model [], Cmd.none )


type Msg
    = AddTodo String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        AddTodo title ->
            ( { model | todos = model.todos ++ [ Todo "1" title False ] }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


view : Model -> Html.Html Msg
view _ =
    styledHtml <|
        div []
            [ section [ Attr.css [ Tw.w_full, Tw.h_full, Tw.space_y_4 ] ]
                [ viewHeader
                , section [ Attr.css [ Tw.flex, Tw.items_center, Tw.justify_center ] ]
                    [ viewCard "Todos..." viewInput
                    ]
                ]
            ]


viewInput =
    input
        [ Attr.placeholder "Foo"
        , Attr.css [ Tw.border, Tw.rounded_sm, Tw.px_2 ]
        ]
        []


viewCard : String -> Html msg -> Html msg
viewCard title body =
    div [ Attr.css [ Tw.border, Tw.rounded, Tw.space_y_2, Tw.p_4 ] ]
        [ h2 [ Attr.css [ Tw.text_2xl ] ]
            [ text title
            ]
        , body
        ]


viewHeader : Html msg
viewHeader =
    header [ Attr.css [ Tw.px_4, Tw.py_2, Tw.bg_color Tw.gray_200 ] ]
        [ h1 [ Attr.css [ Tw.text_2xl ] ] [ text "Todo - Tailwind" ]
        ]
