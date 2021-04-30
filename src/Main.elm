module Main exposing (..)

import Element exposing (Element, el, text)


main =
    Element.layout []
        row


row : Element msg
row =
    Element.row
        [ Element.centerY
        , Element.centerX
        , Element.spacing 30
        ]
        [ Element.paragraph [] [text "Welcome!"]
        ]
