class App.Routers.Filters extends Backbone.Router
  routes:
    'r/:id': 'repository'

  initialize: (options) ->
    @filters = options.filters
    @repositories = options.repositories

    @route(new RegExp("^(#{@filters.pluck('id').join('|')})$"), 'filter')

    @filters.on 'selected', (model) => @navigate "##{model.id}" if model
    @repositories.on 'selected', (model) => @navigate "#r/#{model.id}" if model

  filter: (id) ->
    @filters.get(id)?.select()

  repository: (id) ->
    @repositories.get(id)?.select()