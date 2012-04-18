CURLs
=====

//check login
curl -i -H "Content-Type: application/json" -X POST -d "{\"username\" : \"sso\", \"password\":\"foo\"}" http://localhost:8080/jax.server/rest/logins

//create login
curl -i -H "Content-Type: application/json" -X POST -d "{\"username\" : \"sso\", \"password\":\"foo\"}" http://localhost:8080/jax.server/rest/registration
