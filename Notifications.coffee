# Show us a Growl style notification.
# ----------
class App.Views.NotificationsView extends Backbone.View

	el: "ul#notifications"

	# Listen in on notifications.
	# bind = string; which message to listen to?
	initialize: (options) ->
		App.Mediator.bind(options?.bind or "notification", @notify)
		@

	# Create a new notification.
	# type = notify/warn/error; type of the message, determines CSS class
	# sticky = true/false; close automagically or stick?
	notify: (text, title, type="notify", sticky=false) =>
		$(@el).append(new App.Views.NotificationView(text, title, type, sticky).render().el)

	# Just to add out name to the data attr.
	render: ->
		$(@el).attr("data-view", "NotificationsView")
		@


# The individual notification.
# ----------
class App.Views.NotificationView extends Backbone.View

	# Element does not exist yet, but will be a `<li>`.
	tagName: "li"

	# Cache the template function for a single item.
	template: _.template(
		do ->
			result = ""
			$.ajax
				async: false
				url: "_notification.html"
				success: (data) -> result = data
			result
	)

	# The DOM events.
	events:
		"click a": "close"

	# Set on the Object and chain so we can render.
	initialize: (@text, @title, @type, @sticky) -> @

	render: ->
		$(@el).hide().html(@template({'text': @text, 'title': @title})).addClass(@type).slideDown().attr("data-view", "NotificationView")

		# Pure love :)
		setTimeout(@close, 3000) unless @sticky

		@
	
	close: => $(@el).slideUp("fast")