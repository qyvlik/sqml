import QtQuick 2.0

import sqml 1.0

CrudService {
    id: userService

    __dao: UserDao {
        __connection: userService.connection
        debug: userService.debug
    }
}
