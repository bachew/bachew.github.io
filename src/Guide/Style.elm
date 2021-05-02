module Guide.Style exposing (..)

import Element exposing (Element, el)
import Element as El
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font


main =
    El.layout []
        row


row : Element msg
row =
    El.row [ El.width El.fill, El.centerY, El.spacing 30 ]
        [ box "A"
        , box "B"
        , el [ El.alignRight ] (box "C")
        ]


box : String -> Element msg
box title =
    el
        [ Background.color (El.rgb255 240 0 245)
        , Font.color (El.rgb255 255 255 255)
        , Border.rounded 8
        , El.padding 30
        ]
        (El.text title)
