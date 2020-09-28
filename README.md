# README

Para executar individualmente cada aplicação, utilize o script [run-local.sh]() ou [run-docker]() de cada projeto. Para executar o ambiente como um todo, utilize o script [run-mytest.sh]().

Após executar, utilize o script [dockerps]() para obter a lista de endereços IP de cada aplicação.

Para verificar cada um dos serviços acesse:

| Endereço | Descrição |
|----------|-----------|
| http://172.17.0.2:8761 <br> http://localhost:8761 | Painel de controle do Eureka |
| http://172.17.0.3:8081/greeting <br> http://172.17.0.4:8081/greeting <br> http://localhost:8081 | Endpoint do myservice |
| http://172.17.0.5:8086/myservice/greeting <br> http://localhost:8086/myservice/greeting | Endpoint do myservice acessado através do Zuul. Conforme o mecanismo de Load Balancing do Eureka, este endpoint pode estar sendo direcionado para uma ou outra instância do myservice. |
| http://172.17.0.3:8081/foo?delay=1000&size=1&resp=BAR | Endpoint do myservice que simula um GET a um serviço que demora 1000 milissegundos, aloca 1 byte no head e retorna BAR na sua resposta. Todos os parâmetros são opcionais. |
| POST http://172.17.0.3:8081/bar?delay=1000&resp=FOO | Endpoint do myservice que simula um POST a um serviço que demora 1000 milissegundos e retorna FOO. O corpo do POST pode conter qualquer quantidade de informação. Todos os parâmetros são opcionais. |
| http://172.17.0.5:8086/myservice/foo <br> http://172.17.0.5:8086/myservice/bar| Os mesmos endpoints do myservice acessados via Zuul.|

## JavaMelody

| Endereço | Descrição |
|----------|-----------|
|http://172.17.0.2:8761/monitoring | Painel de monitoria do JavaMelody do Eureka |
| http://172.17.0.3:8081/monitoring <br> http://172.17.0.4:8081/monitoring | Painel de monitoria do JavaMelody do myservice |
| http://172.17.0.5:8086/monitoring | Painel de monitoria do JavaMelody do Zuul |
