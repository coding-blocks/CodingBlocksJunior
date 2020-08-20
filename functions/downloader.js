const stream = require('stream');
const Minio = require('minio');
const { v4 } = require('uuid');
const YoutubeDL = require('ytdl-core');

const minioUrl = process.env.minioUrl
const minioAccessKey = process.env.minioAccessKey
const minioSecretKey = process.env.minioSecretKey
const minioBucket = process.env.minioBucket

const client = new Minio.Client({
  endPoint: minioUrl,
  accessKey: minioAccessKey,
  secretKey: minioSecretKey,
  useSSL: true
});

const downloadVideo = url => new Promise((resolve, reject) => {
  const stream = stream.PassThrough();
  const filename = v4() + '.mp4'
  client.putObject(minioBucket, filname, stream, 'application/octet-stream', e => {
    if (e) {
      return reject(e)
    }
    resolve(`https://${minioUrl}/${minioBucket}/${filename}`)
  })
  return YoutubeDL(url).pipe(stream);
});

module.exports = {
  downloadVideo
}

