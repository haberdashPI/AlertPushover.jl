module AlertPushover

export pushover_alert!

using Alert
using HTTP

"""
    pushover_alert!(;token,user)

Use the [Pushover](https://pushover.net) notificaiton service to send notifications when
calling `alert`. You must provide an API token and user name, which are documented in the
[description of pushover's api](https://pushover.net/api).

Call this funciton with no arguments to return to the default alert notification backend.
"""
function pushover_alert!(;token=nothing,user=nothing)
    if isnothing(token) || isnothing(user)
        Alert.set_alert_backend!()
    end

    Alert.set_alert_backend!() do message
        HTTP.post("https://api.pushover.net/1/messages.json",[],
            readtimeout = 15,
            retry_non_indempotent = true,
            retry = true,
            retries = 8,
            HTTP.URIs.escapeuri(Dict(
                :token => token,
                :user => user,
                :message => message
            ))
        )

        @info "Set message '"*message*"' to https://pushover.net."
    end

    nothing
end

end
