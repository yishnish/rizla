// ==UserScript==
// @name         chat pervert
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        https://www.twitch.tv/*
// @grant        none
// ==/UserScript==

(function() {
    'use strict';

    // Your code here...
window.setTimeout(function(){
let messages = [];

const xhr = new XMLHttpRequest();

var observer = new MutationObserver(function(mutations){
    mutations.forEach(function(mutation){
        if(mutation.addedNodes.length === 1 && mutation.addedNodes[0].hasChildNodes && mutation.addedNodes[0].childNodes.length === 4){
            xhr.open('POST', 'https://<your fancy host name>/rest/message', true);

            const lineStuff = mutation.addedNodes[0].childNodes[2].children;
            const time = lineStuff[0].innerText;
            const name = lineStuff[2].innerText;
            const message = lineStuff[4].innerText;
            const host_url_bits = window.location.href.split('/');
            const host = host_url_bits[host_url_bits.length - 1];
            console.log('sending name: ' + name + ', message: ' + message + ', time:' + time, 'host: ' + host);
            let f = new FormData();
            f.set('username', 'me');
            f.set('password', 'monster');
            f.set('user', name);
            f.set('message', message);
            f.set('time', time);
            f.set('host', host);
            xhr.send(f);
        }
    });
});

var config = {childList: true};

var chatList = document.querySelector('ul.chat-lines');

observer.observe(chatList, config);
}, 2000);})();

