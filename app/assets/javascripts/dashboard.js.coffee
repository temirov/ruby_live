listenToLiveStream = ->
  source = new EventSource '/events'
  source.addEventListener 'Refresh', (e) -> 
    $.getScript "/dashboard.js"

$ ->
  listenToLiveStream()
