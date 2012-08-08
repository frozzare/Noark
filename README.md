# Noark

Noark is simple application that embeds a WebView into a native OS X application. In `Appdelegate.m` there is a line `[webView setMainFrameURL:@"http://forsmo.me"];` that tells the WebView which url to load.

This more a boostrap project for a native OS X application with embedded WebView.

Noark supports Notification center and Growl for older OS X. Right now you can write

```javascript
Noark.notify('Title', 'Message');
```

Support for Webkit Notifications will be added later.

Released under MIT License.