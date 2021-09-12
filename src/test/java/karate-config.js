function fn() {
    var config = {
        apiUrl: "https://conduit.productionready.io/api"
    };

    var result = karate.callSingle('classpath:Register.feature', config)
    config.token = result.token
    config.credentials = result.credentials
    karate.configure('headers', {ContentType: 'application/json'})
    karate.configure('headers', {Accept: 'application/json'})

    return config;
}
