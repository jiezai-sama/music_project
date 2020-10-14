const express = require('express');
const cors = require('cors');
const reg = require('./router/register.js');
const log = require('./router/login.js');
const index = require('./router/index.js');
const songlist = require('./router/songlist.js');
const song = require('./router/song.js');
const album = require('./router/album.js');
const singer = require('./router/singer.js');
const mysearch = require('./router/mysearch.js');
const me = require('./router/me.js');
const api = require('./router/api.js');
const bodyParser = require('body-parser');
const app = express();
app.listen(3000);
app.use(bodyParser.urlencoded({
    extended:false
}));
app.use(cors({origin:['http://127.0.0.1:8080','http://localhost:8080']}));
app.use('/register',reg);
app.use('/login',log);
app.use('/index',index);
app.use('/songlist',songlist);
app.use('/song',song);
app.use('/album',album);
app.use('/singer',singer);
app.use('/mysearch',mysearch);
app.use('/me',me);
app.use('/api',api);
