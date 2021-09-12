function fn() {
    var config = {
        apiUrl: "https://conduit.productionready.io/api"
    };

    var result = karate.callSingle('classpath:users/features/Register.feature', config)
    config.token = result.token
    config.username = result.username
    karate.configure('headers', {'Content-Type': 'application/json'})
    karate.configure('headers', {Accept: 'application/json'})

    return config;
}
