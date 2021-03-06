module Guide.Counter exposing (..)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


main =
  Browser.sandbox
    { init = { counter = 0 }
    , update = update
    , view = view
    }


type alias Model = { counter : Int }
type Msg = Increment | Decrement


update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      { model | counter = model.counter + 1 }

    Decrement ->
      { model | counter = model.counter - 1 }


view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (String.fromInt model.counter) ]
    , button [ onClick Increment ] [ text "+" ]
    ]
