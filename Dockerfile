# Archivo que representa la información para la creación de
# una imagen para Docker, indicando todos los parametros necesarios.

# El comando FROM indica la imagen base.
# openjdk:8-jdk-alpine es una imagen de Java 8 muy ligera.
FROM openjdk:8-jdk-alpine

# Indicando variable de ambiente para pasar el nombre
# de la base de datos.
ENV NOMBRE_APP = 'micro-estudiante'
# forma estandar para cambiar la configuracion
ENV spring.datasource.url='jdbc:mysql://192.168.77.10:3306/micro_estudiante'
ENV spring.datasource.username='root'
ENV spring.datasource.password='12345678'

# Añadiendo el punto de montaje en el host
# Por defecto Tomcat crea los archivo temporales en esa ruta,
# lo habilitamos para ver los log, no es necesario para nuestro ejemplo.
VOLUME /tmp

# Puertos que estarán disponibles de nuestra aplicación.
EXPOSE 8080
# Copiando el archivo jar generado luego de la ejecución del comando
# gradle task bootjar, se crean el jar y se copia a la imagen.
COPY /build/libs/practicadocker-0.0.1-SNAPSHOT.jar practicadocker.jar

#Comando que se ejecuta una vez es iniciada la aplicación.
ENTRYPOINT ["java", "-jar", "practicadocker.jar"]

# Para subir al repositorio realizo el push
# debo logearme primero
# docker login -u usuario
# se etiqueta la imagen y luego hacemos el push
# sudo docker build -t nombre-imagen .
# sudo docker tag nombre_imagen_local id_usuario/nombre_a_subir
# sudo docker push id_usuario/nombre_a_subir
# Ejemplo:
# sudo docker build -t docker-springboot .
# sudo docker tag docker-springboot vacax/docker-springboot
# sudo docker push vacax/docker-springboot
#docker run -p 8081:8081 -name spring-docker-01-app -d spring-docker-01