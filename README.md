# AlertPushover

AlertPushover provides a backend for [Alert](https://github.com/haberdashPI/Alert.jl). It
uses the [Pushover](https://pushover.net) service to send notifications remotely to the
Pushover app. This makes `alert` useful even when working remotely or via an online IDE.

You will need to sign up for an account (there is a 7-day trial, and there is a one-time $5
charge to keep using it after that). Install Pushover to receive your notifications (e.g.
open the webapp, or install the app on your phone). Then create a new app on their website.
You will then have a `user token` for your account, and an `API token` for the app you
created. Then, in your `$HOME/.julia/config/startup.jl` file add the backend for Pushover as
follows.

```julia
using AlertPushover
pushover_alert!(token = [API token], user = [user token])
```

Now, when you call `alert`, it will use the Pushover service, as follows.

```julia
using Alert

for i in 1:10_000
    long_running_function()
end

alert("Your julia script is finished!")
```

See [Alert](https://github.com/haberdashPI/Alert.jl) for more details on its usage.