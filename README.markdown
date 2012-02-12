CoffeeScript Classes that listen to messages in a backbone.js app and then emit them as Growl-style notifications.

## Requirements:
- CoffeeScript
- jQuery
- Backbone.js

## Usage:
1. `new App.Views.NotificationsView().render()` within for example your backbone.js View maintaining your whole app layout.
2. `App.Mediator.trigger("notification", "Welcome to City 17")` to trigger a message on your Mediator component.

## Notes:
- A notification has `text`, `title`, `type` (your choice of CSS class) and `sticky` parameters.
- Messages are not sticky by default so they disappear after 3s.