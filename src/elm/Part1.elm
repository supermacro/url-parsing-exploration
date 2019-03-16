module Part1 exposing
  ( view
  , update
  , init
  , Model
  , Msg
  )

import Browser
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (class, type_)
import Markdown
import Url

type alias Model =
  { input : String
  }

init : Model
init = Model ""


type Msg
  = Input String


md : Html msg
md = Markdown.toHtml [ class "content" ] """
I've been working on a little side project recently
([link for the curious](https://github.com/parlez-vous/)) with a few goals in mind.
One of those goals was (and continues to be) to become very fluent with the
[Elm programming language](https://elm-lang.org/).

For the most part, becoming comfortable with Elm has not been that difficult.
But once I started thinking about routing in Elm, my brain sort of had an aneurysm.

So in an effort to attain Elm Routing Enlightenment, I thought I would create
an interactive guide to really nail down the idea of "webapps with routing in Elm!"

## Part 1: Parsing URLs

First, let's make sure we know how to build urls...

*type a url into the "navigation bar"!*
"""


view : Model -> Html Msg
view model =
  let
    urlInfo =
     case Url.fromString model.input of
      Nothing ->
        List.singleton
          (if String.isEmpty model.input
            then "enter something!"
            else "Invalid URL")

      Just url ->
        let
          protocol =
            case url.protocol of
              Url.Http  -> "http"
              Url.Https -> "https"

          port_ =
            url.port_
            |> Maybe.map String.fromInt
            |> Maybe.withDefault "80 (default port)"
          
        in
          [ "Protocol: " ++ protocol
          , "Host: " ++ url.host
          , "Port: " ++ port_
          , "Path: " ++ url.path
          , "Query: " ++ Maybe.withDefault "none" url.query
          , "Fragment:" ++ Maybe.withDefault "none" url.fragment 
          ]

  in
  div [ class "part-1" ]
    [ md
    , input [ type_ "text", class "browser-input", onInput Input ] []
    , div [ class "url-info" ] <| List.map (\str -> div [] [ text str ] ) urlInfo
    ]


update : Msg -> Model -> Model
update msg _ =
  case msg of
    Input str -> Model str
