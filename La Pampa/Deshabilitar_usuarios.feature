Feature: Deshabilitar usuarios

Scenario: Deshabilitar usuario existente como ADMIN con rol ADMIN
  Given soy un usuario con rol ADMIN
  And tengo un id de usuario existente con rol ADMIN
  When envío una solicitud DELETE al endpoint "/usuarios/:id" con el id de usuario existente
  Then obtengo una respuesta HTTP 200
  And la respuesta contiene un mensaje de estado "Exito"

Scenario: Deshabilitar usuario existente como ADMIN con rol COOPERATIVA
  Given soy un usuario con rol ADMIN
  And tengo un id de usuario existente con rol COOPERATIVA
  When envío una solicitud DELETE al endpoint "/usuarios/:id" con el id de usuario existente
  Then obtengo una respuesta HTTP 200
  And la respuesta contiene un mensaje de estado "Exito"

Scenario: Deshabilitar usuario existente como COOPERATIVA con rol ADMIN
  Given soy un usuario con rol COOPERATIVA
  And tengo un id de usuario existente con rol ADMIN
  When envío una solicitud DELETE al endpoint "/usuarios/:id" con el id de usuario existente
  Then obtengo una respuesta HTTP 401
  And la respuesta contiene un mensaje de estado "Desautorizado"
  And la respuesta contiene un error "No tienes permisos para realizar esta acción"

Scenario: Deshabilitar usuario existente como COOPERATIVA con rol COOPERATIVA
  Given soy un usuario con rol COOPERATIVA
  And tengo un id de usuario existente con rol COOPERATIVA
  When envío una solicitud DELETE al endpoint "/usuarios/:id" con el id de usuario existente
  Then obtengo una respuesta HTTP 401
  And la respuesta contiene un mensaje de estado "Desautorizado"
  And la respuesta contiene un error "No tienes permisos para realizar esta acción"

Scenario: Deshabilitar usuario inexistente como ADMIN
  Given soy un usuario con rol ADMIN
  And tengo un id de usuario inexistente
  When envío una solicitud DELETE al endpoint "/usuarios/:id" con el id de usuario inexistente
  Then obtengo una respuesta HTTP 404
  And la respuesta contiene un mensaje de estado "No encontrado"
  And la respuesta contiene un error "El usuario no existe"

Scenario: Deshabilitar usuario inexistente como COOPERATIVA
  Given soy un usuario con rol COOPERATIVA
  And tengo un id de usuario inexistente
  When envío una solicitud DELETE al endpoint "/usuarios/:id" con el id de usuario inexistente
  Then obtengo una respuesta HTTP 404
  And la respuesta contiene un mensaje de estado "No encontrado"
  And la respuesta contiene un error "El usuario no existe"
