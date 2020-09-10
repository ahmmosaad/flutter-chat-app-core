const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp();

exports.myFunctionName = functions.firestore
    .document('Chats/{HHlLXufnHSNlPbezJAN51SwS3NC3}/MyChats/{h1yYViDgaiP42ZaltQT6COEmEdG3}/Massages/{mass}').onCreate((snap, context) => {
      console.log(snap.data());
     return  admin.messaging().sendToTopic('Chats',
{notification: {body: snap.data().content, title: snap.data().dateTime}}
      )

    });


