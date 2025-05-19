module StyledHtml exposing (..)

import Css.Global
import Html
import Html.Styled exposing (div, toUnstyled)
import Tailwind.Utilities exposing (globalStyles)


styledHtml : Html.Styled.Html msg -> Html.Html msg
styledHtml html =
    toUnstyled <|
        div []
            [ -- This will give us the standard tailwind style-reset as well as the fonts
              Css.Global.global globalStyles
            , div []
                [ html
                ]
            ]
