module Guide.Http exposing (..)

import Browser
import Html exposing (Html, text, pre)
import Http


main =
  Browser.element
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view
    }


type Model
  = Failure
  | Loading
  | Success String


init : () -> (Model, Cmd Msg)
init _ =
  ( Loading
  , Http.get
    { url = "https://elm-lang.org/assets/public-opinion.txt"
    , expect = Http.expectString GotText
    }
  )


type Msg
  = GotText (Result Http.Error String)


update : Msg -> Model -> (Model, Cmd msg)
update msg model =
  case msg of
    GotText result ->
      case result of
        Ok fullText ->
          (Success fullText, Cmd.none)

        Err _ ->
          (Failure, Cmd.none)


subscriptions : Model -> Sub msg
subscriptions model =
  Sub.none


view : Model -> Html msg
view model =
  case model of
    Failure ->
      text "Unable to load"

    Loading ->
      text "Loading..."

    Success fullText ->
      pre [] [ text fullText]
