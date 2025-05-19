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
            [ section [ Attr.css [ Tw.bg_color Tw.red_50, Tw.text_color Tw.green_400 ] ]
                [ p [] [ text "Hej" ]
                ]
            ]
