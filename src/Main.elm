module Main exposing (main)

import Browser
import Css
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes as Attr
import Html.Styled.Events exposing (onClick, onInput)
import StyledHtml exposing (styledHtml)
import Tailwind.Color exposing (withOpacity)
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
    , todoTitle : String
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model [] "", Cmd.none )


type Msg
    = AddTodo String
    | ToggleTodo String
    | UpdateTodoTitle String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        AddTodo title ->
            ( { model | todos = model.todos ++ [ Todo "1" title False ], todoTitle = "" }, Cmd.none )

        ToggleTodo id ->
            let
                toggle todo =
                    if todo.id == id then
                        { todo | completed = not todo.completed }

                    else
                        todo
            in
            ( { model | todos = List.map toggle model.todos }, Cmd.none )

        UpdateTodoTitle title ->
            ( { model | todoTitle = title }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


view : Model -> Html.Html Msg
view model =
    styledHtml <|
        div []
            [ section [ Attr.css [ Tw.w_full, Tw.h_full, Tw.space_y_8 ] ]
                [ viewHeader
                , section [ Attr.css [ Tw.flex, Tw.items_center, Tw.justify_center, Tw.gap_4 ] ]
                    [ viewCard "Add Todo" <| viewAddTodo model
                    , viewTodoList model.todos
                    ]
                ]
            ]


viewTodo : Todo -> Html Msg
viewTodo todo =
    li [ Attr.css [ Tw.flex, Tw.items_center, Tw.p_3, Tw.border_b ] ]
        [ input
            [ Attr.type_ "checkbox"
            , Attr.checked todo.completed
            , onClick (ToggleTodo todo.id)
            ]
            []
        , span
            []
            [ text todo.title ]
        ]


viewTodoList : List Todo -> Html Msg
viewTodoList todos =
    ul [] <|
        List.map viewTodo todos


viewAddTodo : Model -> Html Msg
viewAddTodo model =
    div [ Attr.css [ Tw.flex, Tw.flex_col, Tw.justify_between, Tw.flex_grow ] ]
        [ viewInput model
        , button
            [ Attr.css
                [ Tw.bg_color Tw.primary
                , Tw.text_color Tw.white
                , Tw.rounded
                , Tw.py_2
                , Tw.px_3
                , Tw.transition_colors
                , Css.hover
                    [ Tw.bg_color <| withOpacity Tw.opacity90 Tw.primary
                    ]
                ]
            , onClick <| AddTodo model.todoTitle
            ]
            [ text "Create" ]
        ]


viewInput : Model -> Html Msg
viewInput model =
    input
        [ Attr.placeholder "Foo"
        , Attr.css [ Tw.border, Tw.rounded, Tw.px_2, Tw.min_h_10 ]
        , Attr.value model.todoTitle
        , onInput UpdateTodoTitle
        ]
        []


viewCard : String -> Html msg -> Html msg
viewCard title body =
    div [ Attr.css [ Tw.border, Tw.rounded, Tw.p_4, Tw.min_w_64, Tw.min_h_48, Tw.flex, Tw.flex_col ] ]
        [ h2 [ Attr.css [ Tw.text_2xl, Tw.mb_2 ] ]
            [ text title
            ]
        , div [ Attr.css [ Tw.flex_grow, Tw.flex, Tw.flex_col ] ]
            [ body ]
        ]


viewHeader : Html msg
viewHeader =
    header [ Attr.css [ Tw.px_4, Tw.py_2, Tw.bg_color (withOpacity Tw.opacity50 Tw.primary) ] ]
        [ h1 [ Attr.css [ Tw.text_2xl ] ] [ text "Todo - Tailwind" ]
        ]
