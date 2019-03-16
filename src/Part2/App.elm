
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (class, type_)
import Url



import Part2.Profile
import Part2.Newsfeed
import Part2.Settings
import Part2.Login
import Part2.Register


module Part2.App exposing
  (Model)

type Model
  = Profile Profile.model
  | Newsfeed Newsfeed.model
  | Settings Settings.model

type Route
  = Profile
  | Newsfeed
  | Settings
  | Login
  | Register

type Msg
  = Loading
  | Like
  | Dislike
  | Navigate Route


view : Model -> Document msg
view model -> 

update : Msg -> Model -> (Model, Cmd Msg)

















-- Boilerplate for the sake of the blog post

type alias Program f model msg
  { config : ApplicationConfig
  , flags  : f
  , model  : model
  , msg    : msg
  }

type Key = Key

-- simulating a Browser.application
type alias ApplicationConfig = 
  { init : flags -> Url.Url -> Key -> ( Model, Cmd Msg)

  }

browserApplication : ApplicationConfig -> Program