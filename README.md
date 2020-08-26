# AlertPushover

AlertPushover provides a backend for [Alert](https://github.com/haberdashPI/Alert.jl)
using [Pushover](https://pushover.net). This allows notifications to be sent from, e.g.
a batch job on a server, and you will get a notification on your desktop or phone,
wherever you have pushover installed.

You will need to sign up for an account, and create a new app. You will have a `user
token` for your account, an `API token` for the app. Then, in your `startup.jl`, or wherever
you want to initialize your alerts, setup the backend for pushever as follows.

```julia
using AlertPushover
pushover_alert!(token = [API token], user = [user token])
```

Now, when you call `alert`, as per its documentation, it will use the pushover service.

```julia
using Alert

for i in 1:10_000
    long_running_function()
end

alert("Your julia script is finished!")
```