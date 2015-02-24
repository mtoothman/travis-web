`import Ember from 'ember'`
`import { colorForState } from 'travis/utils/helpers'`
`import FaviconManager from 'travis/utils/favicon-manager'`

Mixin = Ember.Mixin.create
  actions:
    faviconStateDidChange: (state) ->
      if state
        @setFaviconForState(state)
      else
        @setDefault()

  init: ->
    @faviconManager = new FaviconManager()

    @_super.apply this, arguments

  setFaviconForState: (state) ->
    color = colorForState(state)

    images = {
      red: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP4z8DwHwAFAAH/VscvDQAAAABJRU5ErkJggg==',
      yellow: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP4/5ThPwAHrwLktvrIVgAAAABJRU5ErkJggg==',
      green: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mOwv276HwAE7wJLzZ3V0gAAAABJRU5ErkJggg==',
      gray: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mMoqyj7DwAFMAJkMSbkxgAAAABJRU5ErkJggg=='
    }

    @setFavicon(images[color])

  setDefault: ->
    @setFavicon('data:image/png;base64,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')

  setFavicon: (href) ->
    @faviconManager.setFavicon(href)

`export default Mixin`
