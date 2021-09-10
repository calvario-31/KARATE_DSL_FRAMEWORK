function fn() {
  var config = {
    apiUrl: "https://conduit.productionready.io/api",
  };

 /* karate.callSingle('classpath:ping/features/HealthCheck.feature', config)
  var accessToken = karate.callSingle('classpath:auth/features/Login.feature', config).token

  karate.configure('cookies', {'token': accessToken})*/
  karate.configure('headers', {'Content-Type': 'application/json'})
  karate.configure('headers', {Accept: 'application/json'})

  return config;
}
