listenToLiveStream = ->
  source = new EventSource '/events'

  source.onopen = ->
    console.log 'Connection opened'
    $.getScript "/dashboard.js"

  source.onerror = ->
    source.close()
    console.log 'Connection closed'
    listenToLiveStream()

  source.onmessage = (e)->
    console.log 'Message recieved'
    $.getScript "/dashboard.js"

  source.addEventListener 'Refresh', (e) -> 
    console.log 'Refresh event received'
    console.log JSON.parse e.data
    $.getScript "/dashboard.js"
  , false


$ ->
  listenToLiveStream()
