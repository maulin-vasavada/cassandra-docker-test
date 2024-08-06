# how to run it

Run ./build.sh

# jConsole settings
In jConsole use the below url as remote service and use cassandra/cassandra username/password for the auth
```service:jmx:rmi://localhost/jndi/rmi://localhost:7199/jmxrmi```

## SSL config if JMX server requires
use below config to start jConsole with ssl config if server requires it

```
jconsole -J-Djavax.net.ssl.keyStore=<server-keystore.jks>
-J-Djavax.net.ssl.keyStorePassword=<keystore-password>
-J-Djavax.net.ssl.trustStore=<server-truststore.jks>
-J-Djavax.net.ssl.trustStorePassword=<truststore-password>
```
