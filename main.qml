import QtQuick 2.0
import "user"

Item {

    width: 360
    height: 360

    DataBase {
        id: dataBase
        Component.onCompleted: {
            transaction(function (tx){
                tx.executeSql('CREATE TABLE IF NOT EXISTS User(id TEXT, name TEXT)');
            });
        }

        Component.onDestruction:  {
            transaction(function (tx){
                tx.executeSql('DROP TABLE User');
            });
        }
    }

    UserService {
        id: userService
        connection: dataBase
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            var user = {
                id: "1",
                name: "2"
            }

            userService.insert(user, function(size){
                console.log("user: " , size);
            });

            userService.getById("1", function(user){
                if(typeof user !== 'undefined') {
                    console.log("user: " , "id", user.id, "name", user.name);
                }
            });
        }
    }
}
