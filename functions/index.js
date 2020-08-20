const { downloadVideo } = require('./downloader');
const functions = require('firebase-functions');

exports.createContent = functions.firestore
  .document('contents/{contentId}')
  .onCreate(async (snapshot, context) => {
    const content = snapshot.data();

    const url = await downloadVideo(content.url);

    return functions
      .firestore
      .collection('downloaded_videos')
      .add({
        videoId: content.url.split('v=')[1],
        url
      })
  })

