Feature: Creación de usuarios en el endpoint /usuarios

  Como usuario con rol ADMIN
  Quiero poder crear nuevos usuarios en el sistema
  Para mantener actualizada la lista de usuarios

Scenario: Creación exitosa de usuario con rol COOPERATIVA por usuario con rol ADMIN
  Given soy un usuario con rol ADMIN
  When envío una solicitud POST al endpoint /usuarios con el siguiente JSON en el cuerpo:
    """
    {
      "primerNombre": "string",
      "apellido": "string",
      "CUIT": "string",
      "rol": "COOPERATIVA",
      "cooperativa": "string"
    }
    """
  Then la respuesta es una respuesta HTTP 200
  And el mensaje de estado es "Éxito"
  And el usuario se crea en la base de datos con el rol "COOPERATIVA"

Scenario: Creación exitosa de usuario con rol ADMIN
  Given soy un usuario con rol ADMIN
  When envío una solicitud POST al endpoint /usuarios con el siguiente JSON en el cuerpo:
    """
    {
      "primerNombre": "string",
      "apellido": "string",
      "CUIT": "string",
      "rol": "ADMIN"
    }
    """
  Then la respuesta es una respuesta HTTP 200
  And el mensaje de estado es "Éxito"
  And el usuario se crea en la base de datos con el rol "ADMIN"

Scenario: Intento de creación de usuario con rol COOPERATIVA por usuario con rol COOPERATIVA
  Given soy un usuario con rol COOPERATIVA
  When envío una solicitud POST al endpoint /usuarios con el siguiente JSON en el cuerpo:
    """
    {
      "primerNombre": "string",
      "apellido": "string",
      "CUIT": "string",
      "rol": "COOPERATIVA",
      "cooperativa": "string"
    }
    """
  Then la respuesta es una respuesta HTTP 401
  And el mensaje de estado es "Desautorizado"
  And el cuerpo de la respuesta contiene el mensaje "No tienes permisos para realizar esta acción"

Scenario: Intento de creación de usuario con JSON vacío por usuario con rol ADMIN
  Given soy un usuario con rol ADMIN
  When envío una solicitud POST al endpoint /usuarios con un JSON vacío en el cuerpo
  Then la respuesta es una respuesta HTTP 400
  And el mensaje de estado es "Error"
  And el cuerpo de la respuesta contiene el mensaje "El JSON enviado está vacío"

Scenario: Intento de creación de usuario con rol ADMIN por usuario con rol COOPERATIVA
  Given soy un usuario con rol COOPERATIVA
  When envío una solicitud POST al endpoint /usuarios con el siguiente JSON en el cuerpo:
    """
    {
      "primerNombre": "string",
      "apellido": "string",
      "CUIT": "string",
      "rol": "ADMIN"
    }
    """
  Then la respuesta es una respuesta HTTP 401
  And el mensaje de estado es "Desautorizado"
  And el cuerpo de la respuesta contiene el mensaje "No tienes permiso para crear un usuario con ese rol"
