front
  login
  feed
  map
  profile
  messages

back
  auth
  data geo query
  feed algorythm
  profile
    posts
      text, media, video, geolocation
    friends
  in-app messaging


**Devis MVP**

front:
  sign-in
  login
  post geolocated pin with media and hastags
  search by location or hastag
  map view with all markers
  view post details
    -> medias
    -> view on map

back:
  sign-in/login
  post pin
    - media
    - hastags
    - geolocalization
    -> permissions
  search
    - by location
      -> google place
    - by hashtag
  map view marker query based on zoom level

client:
  login/sign:
    front: 2
    back: 1
  post:
    front: 2
      permission: 0.5
      geo-service: 0.5
      form: 1
    back: 2
  markermap:
    front: 2
    back: 1
  pin-search:
    front: 2
    back: 2
    google place: 1

