const { downloadVideo } = require('./downloader');
const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp();

exports.createContent = functions.firestore
  .document('contents/{contentId}')
  .onCreate(async (snapshot, context) => {
    const content = snapshot.data();

    const url = await downloadVideo(content.url);

    return admin
      .firestore()
      .collection('downloaded_videos')
      .add({
        videoId: content.url.split('v=')[1],
        url
      })
  })

  exports.markProgress = functions.firestore
    .document('progresses/{progressId}')
    .onCreate(async (snapshot, context) => {
      const progress = snapshot.data();

      const userId = progress.userId;
      const courseRef = progress.course;

      const courseSnapshot = await courseRef.get();
      const contentCount =  courseSnapshot.data().contents.length;

      const progressSnapshot = await admin.firestore().collection(`progresses`).where('userId', '==', userId).get();
      const progressCount =  progressSnapshot.data().length;

      return admin
        .firestore()
        .doc(`user_progress/${userId}`)
        .add({
          userId: userId,
          user_progress:(progressCount/contentCount)*100
        })
    })
