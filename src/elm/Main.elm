import Browser
import Html exposing (..)
import Html.Attributes exposing (class)

import Part1 as Pt1
import Part2 as Pt2




main = Browser.sandbox
  { init   = init
  , view   = view
  , update = update
  }


type alias Model =
  { pt1 : Pt1.Model
  , pt2 : Pt2.Model
  }

init : Model
init = Model Pt1.init Pt2.init


type Msg
  = Pt1 Pt1.Msg
  | Pt2 Pt2.Msg


view : Model -> Html Msg
view model =
  div [ class "article-container" ]
    [ h1 [ class "article-title" ] [ text "URLs in Elm" ] -- "Url |> Parse |> Route" ]
    , Html.map Pt1 <| Pt1.view model.pt1
    , Html.map Pt2 <| Pt2.view model.pt2
    ]




update : Msg -> Model -> Model
update msg model =
  case msg of
    Pt1 pt1Msg -> { model | pt1 = (Pt1.update pt1Msg model.pt1) }

    Pt2 pt2Msg -> { model | pt2 = (Pt2.update pt2Msg model.pt2) }
